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
  
### Goals And Axioms That Form The Basis Of These Calculations
#### [EdgeWeighting+Scaling(2).pdf](https://github.com/lduncan1712/ImpactNetwork/files/10356074/EdgeWeighting%2BScaling.2.pdf)


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
### File ______________ provides various oportunities to create visualizations, allowing choice to preconstructved weight, directed/undirected, and dynamic/undynamic


















