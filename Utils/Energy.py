import numpy as np
import matplotlib.pyplot as plt
from numpy.core.defchararray import split
from numpy.lib.function_base import append

import sys

def plot_energy(energy):
    energy_file = open(energy, "r")
    E=energy_file.readlines()
    E=[line.split() for line in E]
    E=np.array(E)
    E=E.astype(float)
    #print(E)
        
    plt.figure(1)
    plt.plot(E[:,0],E[:,1])
    plt.plot(E[:,0],E[:,2])
    plt.plot(E[:,0],E[:,3])
    plt.title("Energy")
    plt.legend(["PE","KE","TE"])
    plt.show()



if __name__ == "__main__":
    try:
        energy=(sys.argv)[1]
    except:
        print ("Usage: python3 Energy.py <energy_file>")
        sys.exit(2)
    plot_energy(energy)
