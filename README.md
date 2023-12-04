# Using Logistic Regression to Build Credit Scores

In the Spring of 2021, I took KSU's Applied Binary Classification Undergraduate Course taught by Professor Michael Frankel sponsored by Equifax. This course used data provided by Equifax to predict which custmers were a good or bad credit risk. A copy of the report is provided in this repo and can be downloaded [here](https://github.com/njones738/Using-Logistic-Regression-to-Build-Credit-Scores/blob/main/deliverables/Binary.Classification.Modeling.Deliverable.NATHANIELJONES.pdf).

### __Project Purpose:__  

The purpose of this report is to create a model that predict a customer’s credit score to maximize the profitability of granting credit. The original data contained over 1.2 million observations with over 300 parameters for each. SAS and Python was used during this project. A binary predictor was used to indicate whether a customer was considered a credit risk. This predictor was created from the customers’ delinquency status on payments. Initially, the data needed to be recoded and cleaned of missing and coded values. Parameters with a low enough proportion of missing or coded data had the median calculated and put in place of any missing or coded value. Parameters with a proportion too high were removed to avoid imputing a significant portion of the parameter. The remaining parameters underwent the process of variable clustering to further reduce the number of parameters that will be used in the model.
The next phase transformed the parameters to create additional forms. The forms were included to see if they yielded significant results in the final model. Some of these transformations included creating discrete indicators for variables which were originally continuous and calculating the odds of the variables. Two methods were used to in creating these transformations: an automatic process using a procedure in SAS and a user process.
The last phase of the project, a logistic regression model was run on the parameters and the different transformed versions in the dataset. The main metric used to assess the performance of the models created were the percent of concordant observations, the Kolmogorov-Smirnov statistic, the Chi-Squared statistic, and most importantly, profit. From this logistic regression, two simpler models were created to reduce model complexity. To assess the consistency of the model performance it was split into a training and a validation subset.
SAS was used to conduct the cleaning of missing values, manipulation of the parameters, and the analysis. In addition, Python was ued to interpolate thee threshhold used during the imputation step.

### __Tools used:__   


* SAS
* Python
* R

### __Results:__      

An analysis of the profitability was the conducted by looking at the number of correct customers predicted to not default, which earns the company a mean revenue of $250 per customer. Of those that do default but were predicted to be low rick customers, it was determined that every 1000 customers who are extended credit yield an average profit of $115,303.14. In addition to the model, a reduced model that included twenty parameters yield an average profit of $112,777 per 1000 customers. This less than $3000 off the initial models profit per 1000 customers and this model is much less complex meaning it is easier to interpret and explain to potential customers. 

## Folder structure

```
- readme.md
- data (less than 100 Mb)
---- interpolate.csv
- deliverables
---- Binary.Classification.Modeling.Deliverable.NATHANIELJONES.docx
---- Get.that.number.Nathaiel.Jones.pptx
- scripts
---- FINAL_PROJECT_NATHANIELJONES.sas
---- Get_that_Numby.sas
---- Interpolation.py
---- Next_Step.sas
---- Phase_2.sas
---- UNUSEDDEscr_save.log.sas
---- Descr_save.log.sas
---- Descritize2MACRO.sas
```

## Deliverables

* Final Project Report     
* Get that Number     
