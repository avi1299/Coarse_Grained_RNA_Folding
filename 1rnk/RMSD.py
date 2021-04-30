import numpy as np
import math
import matplotlib.pyplot as plt
from numpy.core.defchararray import split
from numpy.lib.function_base import append

import sys

def calculate_RMSD(top,ini_conf,conf):
    top_file = open(top, "r")
    ini_conf_file=open(ini_conf,"r")
    conf_file =open(conf,"r")
    nucleotide_count = int(top_file.readline().split()[0])
    steps=[]
    RMSD=[]
    ini_conf_file.readline()
    ini_conf_file.readline()
    ini_conf_file.readline()
    #print(ini_conf_file.readlines())
    ini_pos=ini_conf_file.readlines()
    ini_pos=[line.split()[0:3] for line in ini_pos]
    ini_pos=np.array(ini_pos)
    ini_pos=ini_pos.astype(float)

    #print(ini_pos)
    
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
        traj=np.array(traj)-ini_pos
        R=math.sqrt(np.sum(traj**2)/nucleotide_count)
        RMSD.append(R)
        
    # #steps=[x/100000 for x in steps]
    plt.figure(1)
    plt.plot(steps,RMSD)
    plt.title("Root Mean Square Deviation")
    plt.show()

if __name__ == "__main__":
    try:
        top=sys.argv[1]
        ini_conf=sys.argv[2]
        conf=sys.argv[3]
    except:
        print ("Usage: python3 RMSD.py <top_file> <initial_conf_file> <trajectory_file>")
        sys.exit(2)
    calculate_RMSD(top,ini_conf,conf)
