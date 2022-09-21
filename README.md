# Birth-Death Process Reduction for Epidemics


[![License: GPL v3](https://img.shields.io/badge/License-GPL%20v3-blue.svg)](http://www.gnu.org/licenses/gpl-3.0)

Copyright: 2022, Gerrit Großmann, [Group of Modeling and Simulation](https://mosi.uni-saarland.de/) at [Saarland University](http://www.cs.uni-saarland.de/)

Version: 0.1 (Please note that this is proof-of-concept code.)

A more detailed description of the technique can be found in **Chapter 7** of my [phd dissertation](https://github.com/gerritgr/phd).

![alt text](overview.png "Overview")



# Usage

### Step 1: Install Python3 and Jupyter Notebooks
If not already installed, you can install [Anaconda](https://www.anaconda.com/). 

### Step 2: Install Rust (only necessary for simulation baseline)
For simulation, we use Rust code based on the [Rejection-Based Simulation of Stochastic Spreading Processes on Complex Networks](https://www.researchgate.net/publication/330009206_Rejection-Based_Simulation_of_Stochastic_Spreading_Processes_on_Complex_Networks) paper.
```console
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```
and compile the simulation code
```console
cd rust/Rejection-Based-Epidemic-Simulation/rust_reject/ && cargo build --release
```

### Step 3: Install Julia
Install [Julia](https://julialang.org/downloads/) and [link it to your jupyter notebook](https://datatofish.com/add-julia-to-jupyter/).


### Step 4: Open 'main.ipynb'
`visualization.ipynb` (Python) can also create nicer plots but is not really necessary.

## Docker
You can also use Docker to run the code off the shelf:
```console
docker pull gerritgr/bdreduction:latest
docker run -p 8888:8888 gerritgr/bdreduction
```
You can then open the Jupyter Lab URL in your browser and open `main.ipynb` (no need to execute the first cell). 


# Graphs
We use generate contact networks with the following parameters:

```console
n=10^2
g = erdos_renyi(n, 1/n*10, seed=123)      #ER
g = barabasi_albert(n, 3, seed=123)       #BA
g = watts_strogatz(n, 8, 0.8, seed=123)   #WS      

n=10^4
g = erdos_renyi(n, 1/n*20, seed=123)
g = barabasi_albert(n, 4, seed=123)
g = watts_strogatz(n, 12, 0.8, seed=123)  

n=10^6
g = erdos_renyi(n, 1/n*40, seed=123)
g = barabasi_albert(n, 6, seed=123)
g = watts_strogatz(n, 16, 0.8, seed=123)  
```

