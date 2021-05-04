# Coarse_Grained_RNA_Folding
I am not the author of the oxDNA, cogli2 or tacoxDNA software and have just included them here for easy processing and faster workflows for all using this repository.
The links of the original packages are 
* [oxDNA](https://dna.physics.ox.ac.uk/index.php/Main_Page)
* [cogli2](https://sourceforge.net/projects/cogli1/)
* [tacoxDNA](https://github.com/lorenzo-rovigatti/tacoxDNA)

This repository shows how you can use these packages to run Coarse Grained MD simulations of RNA(/DNA) folding. Apart from these steps, the ANalysis folder contains some codes to help analyse the trajectory/configuration files to plot:
1. Energy variation
2. Radius of Gyration(RoG)
3. Root Mean Square Deviation(RMSD)
4. Root Mean Square Fluctuation(RMSF)

The ```PDB_Downloader.sh``` is a bash script that downloads the PDB for a molecule on giving the name of the molecule as a commandline argument. For example

```./PDB_Downloader.sh 1rnk```

This creates a folder 1rnk and in it downloads the 1rnk.pdb from the RCSB Protein Data Bank.

You will also need to create an ```input``` script containing the simulation paramters and the names of the input anf output files. Sample input scripts can be found in the oxDNA/EXAMPLES folder.

Once you have the ```input``` file in the same directory as your PDB file, run the ```Run_Simulation.sh``` bash script and provide the name of the RNA molecule you wanted to simulate. For example

```./Run_Simulation.sh 1rnk```

The ```Run_Simulation.sh``` performs 5 steps:
1. Creation of topology and configuration files from the PDB
2. Visualizing the input files
3. Running the simulation
4. Visualizing the simulation
5. Performing analysis on the output files of the simulation

