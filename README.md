# mfem-benchmarks

Utility to automate building the `mfem` library.

# Building everything
Downloads and builds mfem 3.4 and its dependencies:
```
cd scripts
./prepare.sh
```

Note: we configure mfem to use OpenMP.
Feel free to change the script or the configuration file to your liking.

# Running everything
To run all the example applications, just `./run.sh`
