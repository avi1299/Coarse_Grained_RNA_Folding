import numpy as np
import math
import matplotlib.pyplot as plt
from numpy.core.defchararray import split
from numpy.lib.function_base import append

import sys

def calculate_RMSF(top,conf):
    top_file = open(top, "r")
    conf_file =open(conf,"r")
    nucleotide_count = int(top_file.readline().split()[0])
    steps=[]
    RMSF=[]
    traj_timseries=[]
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
        traj_timseries.append(traj)    
    traj_timseries = np.array(traj_timseries)

    traj_mean=np.mean(traj_timseries,axis=0)

    for x in traj_timseries:
        y=x-traj_mean
        R=math.sqrt(np.sum(y**2)/nucleotide_count)
        RMSF.append(R)

    plt.figure(1)
    plt.plot(steps,RMSF)
    plt.title("Root Mean Square Fluctuation")
    plt.show()

if __name__ == "__main__":
    try:
        top=sys.argv[1]
        conf=sys.argv[2]
    except:
        print ("Usage: python3 RMSF.py <top_file> <trajectory_file>")
        sys.exit(2)
    calculate_RMSF(top,conf)
