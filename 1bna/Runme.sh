#! /bin/sh
#Creating the topology and initial configuration file from the PDB. 53 indicates chain is from 5' -> 3'
python3 ../tacoxDNA-master/src/PDB_oxDNA.py 1bna.pdb 53

#Visulaizing the topology and initial configuration
./../cogli2/build/bin/cogli2 --drums --rna --always-centre -t 1bna.pdb.top 1bna.pdb.oxdna 

#Running the simulation. Edit inputMD1 to change the simulation parameters
./../oxDNA/build/bin/oxDNA inputMD1small

#Visualizing the simulation. Use "+" and "-" keys to move the simulation forward and backward.
./../cogli2/build/bin/cogli2 --drums --rna --always-centre -t 1bna.pdb.top trajectory.dat

#Plotting the RoG throughout the simulation
python3 ../Utils/RoG.py 1bna.pdb.top trajectory.dat

#Plotting the Energy throughout the simulation
python3 ../Utils/Energy.py energy.dat

#Plotting the RMSD
python3 ../Utils/RMSD.py 1bna.pdb.top 1bna.pdb.oxdna trajectory.dat
