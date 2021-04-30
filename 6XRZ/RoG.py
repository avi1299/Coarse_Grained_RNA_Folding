import numpy as np
import math
import matplotlib.pyplot as plt
from numpy.core.defchararray import split
from numpy.lib.function_base import append

import sys

def calculate_ROG(top,conf):
    top_file = open(top, "r")
    conf_file =open(conf,"r")
    #print(top_file.read())
    nucleotide_count = int(top_file.readline().split()[0])
    #print(nucleotide_count)
    steps=[]
    TE=[]
    PE=[]
    KE=[]
    ROG=[]
    while True:
        checker=conf_file.readline()
        if (checker==''):
            break
        else: 
            steps.append(int(checker.split()[2]))
        conf_file.readline()
        energy_line=conf_file.readline()
        TE.append(float(energy_line.split()[2]))
        PE.append(float(energy_line.split()[3]))
        KE.append(float(energy_line.split()[4]))
        i=0
        traj=np.zeros([nucleotide_count,3])
        while(i<nucleotide_count):
            line=conf_file.readline()
            #print(line)
            traj[i] = [float(x) for x in line.split()][0:3]
            i+=1
        mean_traj=np.mean(traj,axis=0)
        #print(mean_traj)
        traj=np.array([(arr-mean_traj) for arr in traj])
        #print(traj)
        R=math.sqrt(np.sum(traj**2))
        #print(R)
        ROG.append(R)
    #print (ROG)
        
    steps=[x/100000 for x in steps]
    plt.figure(1)
    plt.plot(steps,ROG)
    plt.title("Radius of gyration")
    plt.show()

# plt.figure(2)
# plt.plot(steps,TE)
# plt.plot(steps,KE)
# plt.plot(steps,PE)
# plt.title("Energy")
# plt.legend(["TE","KE","PE"])
# plt.show()

if __name__ == "__main__":
    try:
        top=(sys.argv)[1]
        conf=sys.argv[2]
    except:
        print ("Usage: python3 RoG.py <top_file> <conf_file>")
        sys.exit(2)
    calculate_ROG(top,conf)