# ODD firefighters model


## Overview

### Purpose 

The objective of the model is to understand if the number of groups of communicating firefighters has an effect on the efficiency of the fire fighting brigade when initially a fire breaks out in a forested plot randomly picked.

### Entities, state variables and scales

Cells : state (forest, clear, fire)
Firefighters : state (patrolling, fighting) ; group-id

Spatial scales: cells = 1 spatial unit = 100m, 30 x 30 cells (3000m x 3000m) in a non-torus world.
Temporal scale: time step of 1h corresponding to 1 movement of patrolling of the firefighters and the spread of fire to neighboring cells.

### Process overview and scheduling
Each time step first the fire is propagated from the cells already in fires to their neighbors (SM 1 - fire propagation); second the firefighters patroll and fight the fires (SM 2 - firefighters activity) and third, if the communication is ON the firefighters HELP (SM3 TO DEFINE).


## Design concepts

### Sensing/Interaction: 
The firefighters detect fire in a Van Neuman neighborhood of the cells around itself and (in the communication scenario) get the information about the fire positions detected by others.

### Stochasticity: 
Randomness is used for the initial setting of forest and initial plot on fire. The movement of patrolling is also using randomness by TODO (autocorrelated or brownian??)

### Collectives: 
Communicating firefighters create groups of agents that interact primarily among them. The collectives do not have specific behaviours though.

### Observation: 
Two results of simulations are observed at the end of the simulations (when all the fire is extinguished): 1) the total area burnt by the fire, 2) the time elapsed before all the fire is extinguished.


## Details

### Initialisation

Cells are initialized with a "clear" state. For a rounded fixed number of cells computed as the proportion of forest (propforest) times the number of cells (900) the state is changed to "forest". After that, if there are forest cells, one of them is picked randomly and set to "burning" to initialize the fire. 

12 Firefighters are initialized at the center of random cells of the grid and set an initial state of "patrolling". If the model is set to use communication, the group-id are assigned to the firefighters by attributing in a random order a group number of 1 to the number of groups (nb-groups) incrementing by 1 for each agent. The last groups get the extra firefighters if the number of firefighters is not a multiple of the number of groups (e.g. nb-groups = 5 for 12 firefighters).


### Input data
None

### Submodels

*SM 1 - fire propagation*

Van Neuman neighborhood


*SM 2 - firefighters activity*

Van Neuman neighborhood

