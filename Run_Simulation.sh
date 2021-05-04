#! /bin/sh

if [ "$#" -ne 1 ]; then
    echo "Illegal number of parameters"
    echo "Usage: $PROGNAME <pdb_name>"
    exit 1
fi

cd $1

echo "Creating the topology and initial configuration file from the PDB. 53 indicates chain is from 5' -> 3'"
python3 ../tacoxDNA/src/PDB_oxDNA.py $1.pdb 53

echo "Visulaizing the topology and initial configuration"
./../cogli2/build/bin/cogli2 --drums --rna --always-centre -t $1.pdb.top $1.pdb.oxdna 

echo "Running the simulation. Edit inputMD1 to change the simulation parameters"
./../oxDNA/build/bin/oxDNA input

echo "Visualizing the simulation. Use '+' and '-' keys to move the simulation forward and backward"
./../cogli2/build/bin/cogli2 --drums --rna --always-centre -t $1.pdb.top trajectory.dat

echo "Plotting the RoG throughout the simulation"
python3 ../Analysis/RoG.py $1.pdb.top trajectory.dat

echo "Plotting the Energy throughout the simulation"
python3 ../Analysis/Energy.py energy.dat

echo "Plotting the RMSD"
python3 ../Analysis/RMSD.py $1.pdb.top $1.pdb.oxdna trajectory.dat

echo "Plotting the RMSF"
python3 ../Analysis/RMSF.py $1.pdb.top trajectory.dat

cd ..
