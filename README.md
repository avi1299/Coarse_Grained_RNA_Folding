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


