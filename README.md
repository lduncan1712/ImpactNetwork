# ImpactNetwork
A Data Collection and Formatting Project To Extract Insight From The Perceived Impact Network Of A Graduating Secondary School Class And Its Corralation To Key Variables




https://user-images.githubusercontent.com/113392258/210892492-3f08e347-5d81-432c-baa7-61e4bd5a168f.mp4








## PROJECT OUTLINE:
![BETTER](https://user-images.githubusercontent.com/113392258/210866682-6a80ca10-d85f-425e-ab2c-080688f2ea1c.png)



## OUTLINE (1,2):
### [Project Description(1,2).pdf](https://github.com/lduncan1712/ImpactNetwork/files/10354929/Project.Description.1.pdf)


## Conversion And Matching From GoogleSheets to SQL Database (3):
### https://github.com/lduncan1712/BridgeApplication3


## Database Schema (4):
![schema](https://user-images.githubusercontent.com/113392258/210866343-2ef84b2a-f818-40a6-89aa-c8744604cc2e.png)




## Weighting/Scaling Edges (5):
#### The Debatably Most Important Portion Of This Process Is Correctly Scaling The Edges Using The Data Given
#### To This End, I Have Formulated 4 Possible Weighting Calculations (That Each Emphasize A Certain Aspect, But Possess A Respective Downside)
  
### Goals And Axioms That Form The Basis Of This Relatively Intuitive Logic
#### &emsp; [Axioms.pdf](https://github.com/lduncan1712/ImpactNetwork/files/10356074/EdgeWeighting%2BScaling.2.pdf)


### Weights (1-4) (Simplest To Most Complex)
#####   &emsp;&emsp; S<sub>1</sub> = s<sub>1</sub> + s<sub>2</sub>    (simple sum)
#####  &emsp;&emsp;  S<sub>2</sub> = s<sub>1</sub> + s<sub>2</sub>    (simple product)
##### &emsp; (the following weights have different cases, case1 = both nodes participate, case 2 = only one)
##### &emsp;&emsp;  S<sub>3</sub> = (s<sub>1</sub>/et<sub>1</sub>) + (s<sub>2</sub>/et<sub>2</sub>) &emsp; (gives each participating node an influence of 1)
##### &emsp;&emsp;&emsp;&emsp;    = (s<sub>1</sub>/et<sub>1</sub>)

#### &emsp;&emsp;   S<sub>4</sub> = (s<sub>1</sub>/et<sub>1</sub>)*(s<sub>2</sub>/et<sub>2</sub>)*(s<sub>1</sub>*s<sub>2</sub>)  &emsp; (scaled product: combining exponential reciprocity with relative importance)
#### &emsp;&emsp;&emsp;&emsp;     = (s<sub>1</sub>/et<sub>1</sub>)*(s<sub>1</sub>)*2

#### (where s<sub>n</sub> refers to directed outward strength of node n on this edge, and et<sub>n</sub> refers to the sum of node n's directed outward strength among all its outward edges

  
  
  
## GEPHI (6,7)
### File https://github.com/lduncan1712/ImpactNetwork/blob/main/impact_network_(4)_CREATE_CSV.sql provides various oportunities to create visualizations, allowing choice to preconstructved weight, directed/undirected, and dynamic/undynamic



## TAKEAWAYS
### [MAIN TAKEAWAYS (QUANTATATIVE)](https://github.com/lduncan1712/ImpactNetwork/blob/main/mainTakeAways%20(QUANTATATIVE))
(Coloured By Previous)
![previous](https://user-images.githubusercontent.com/113392258/211068082-5c042301-5634-4143-b9d7-698bb2cd8dea.png)
(Coloured By Modularity Class (0.75)
![0 75](https://user-images.githubusercontent.com/113392258/211068118-7165b9ff-b590-420d-b9f2-d87c36855e85.png)

(Coloured By Modularity Class (2.5)
![2 5](https://user-images.githubusercontent.com/113392258/211068243-22236971-f09d-4d43-bc5c-550b30b95b8e.png)

(Time Of First Reference (Inclusion))
![inclusionRow](https://user-images.githubusercontent.com/113392258/211074595-f8fe1421-cb2d-4ad8-825a-c0b0e44243b8.png)
(Sized By Degree)
![degree(1)](https://user-images.githubusercontent.com/113392258/211087231-604b07b1-974a-4f43-bdae-e96772d67a6d.png)





## REPLICATION AND MODIFICATION
### Anyone interested in modifying or replicating this project follow these steps
#### 1) Replicate "impact_network" Database (or Modify) using [impact_network_(1)_CREATE_DB.sql](https://github.com/lduncan1712/ImpactNetwork/blob/main/impact_network_(1)_CREATE_DB.sql)

#### 2) Insert starting entries to it using [starting entries](https://github.com/lduncan1712/ImpactNetwork/blob/main/impact_network_(1)_STARTINGENTRIES.sql), as well as adding file containing all participant names as "nodes"

#### 3) Create Stored Procedures Required By "BridgeApplication3" To impact_network Using 
[Procedure1](https://github.com/lduncan1712/ImpactNetwork/blob/main/impact_network_(2)_GETIDSTOWEIGH.sql)    and [Procedure2](https://github.com/lduncan1712/ImpactNetwork/blob/main/impact_network_(2)_WEIGHBYSC2SCORE.sql)

#### 4) Convert Survey Responses (and Match) using [BridgeApplication3](https://github.com/lduncan1712/BridgeApplication3)

#### 5) Complete Post Conversion Final Formatting (to differentiate neglected vs non participant) using [SetUnreferencedTo-1](https://github.com/lduncan1712/ImpactNetwork/blob/main/impact_network_(3)_POST_FORMATTING.sql)

#### 6) Set overall Edge Strength using [SetFinalEdgeStrength](https://github.com/lduncan1712/ImpactNetwork/blob/main/impact_network_(3)_POST_STRENGTH_DEFINITION.sql)

#### 7) Create CSV file to be used by Gephi for visualization [MakeCSV](https://github.com/lduncan1712/ImpactNetwork/blob/1738bbff3d6ee3ce7d1b641a183df3e99ca0ecfe/impact_network_(4)_CREATE_CSV.sql)

#### 8) Run Additional Calculations (Optional)


















