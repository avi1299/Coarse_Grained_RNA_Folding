import numpy as np
import math
import matplotlib.pyplot as plt
from numpy.core.defchararray import split
from numpy.lib.function_base import append

import sys

def calculate_ROG(top,conf):
    top_file = open(top, "r")
    conf_file =open(conf,"r")
    nucleotide_count = int(top_file.readline().split()[0])
    steps=[]
    ROG=[]
    while True:
        checker=conf_file.readline()
        if (checker==''):
            break
        else: 
            steps.append(int(checker.split()[2]))
        conf_file.readline()
        conf_file.readline()
        i=0
        traj=np.zeros([nucleotide_count,3])
        while(i<nucleotide_count):
            line=conf_file.readline()
            traj[i] = [float(x) for x in line.split()][0:3]
            i+=1
        mean_traj=np.mean(traj,axis=0)
        traj=np.array([(arr-mean_traj) for arr in traj])
        R=math.sqrt(np.sum(traj**2)/nucleotide_count)
        ROG.append(R)
        
    #steps=[x/100000 for x in steps]
    plt.figure(1)
    plt.plot(steps,ROG)
    plt.title("Radius of gyration")
    plt.show()

if __name__ == "__main__":
    try:
        top=(sys.argv)[1]
        conf=sys.argv[2]
    except:
        print ("Usage: python3 RoG.py <top_file> <conf_file>")
        sys.exit(2)
    calculate_ROG(top,conf)
