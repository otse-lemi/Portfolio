```
Title: "EXPLORATORY DATA ANALYSIS ON THE COVID-19 DATASET"
Date: "MAY 2020"
```
## **Introduction**

This analysis aims to help us understand the causal relationship between events that are taking place during this COVID19 pandemic period. And how the insights drawn from it can guide our approach to it incase of such in the future


## **DATASETS**

The datasets are got from the John Hopkins csse dataset in the UNCOVER COVID-19 challenge datasets on kaggle and the covid19countryinfo.csv

Additional sets: I leveraged the Coronavirus Government Response Tracker dataset from Oxford Blavatnik School of Government

## **INSIGHTS FROM THE ANALYSIS**
**Population at risk of COVID-19:** 

Firstly, I identified the countries that were hit early by the pandemic. This countries include China, Italy, France, Spain, Iraq.

Secondly, I Checked if the confirmed cases take exponential trend in a week time to confirm if a country is in pandemic state. Then I found the rate of spread at the time of exponential spread which I used to identify countries that are more prone to exponential spread.

Thirdly, I used the median value of the confirmed cases to identify countries at the verge of the pandemic(The High risk countries). A visualization was done to this effect 

Fourtly, using the pairplot, I checked out the Correlation of different variables with the total cases.


1. Median age has a higher correlation with the total cases and as it is accepted universally,it implies aged population is more vulnerable with highly affected countries with median age more than 40.

2. Lung Patients and smokers are seen to be positively correlated with cases, indicating people with deteriorated respiratory conditions are more vulnerable. Lower cases are seen with death rate from lung diseases varying in the lower levels. On the contrary we should not ignore that higher number of cases are also seen to fall in that range.

3. Owing to the highly contagious nature of the pandemic, even countries with high healthcare systems are not likely to escape adverse effect, as shown by hospital bed per/1000 and health expenditure plot

4. Temperature has a positive correlation and humidity has negative correlation indicating higher temperature and low humid countries could also be vulnerable. But there are no strong evidience against it and could'nt be strongly advocated.

5. Vulnereablity of the pandemic is not limited to countries with lower income. Higher income countries also tend to be exposed to high threat.


In conclusion, usin the kdeplot, we got a smooth distribution above fair vicinity of 25th percentile of the distribution of the median age. Hence 25th percentile is taken as the lower limit and age groups below could be ignore.

As we have seen before as age increases the vulerablitiy to the sickness also increases. Therefore it is thought that capping the upper limit makes ambiguity and some countries with higher median age group in their population could be missed out, for whom it is highly likely to get adversely affected


**How implemented strategies affects the rate of the COVID-19 infection**

All I did here was to use plots to get a quicker understanding of how the variables(strategies) affects the amount of confirmed cases.

##**INSIGHTS**
1. Closing of schools have no effect on reduced cases

2. Closing of work places have no effect on reduced cases

3. Closing Public Transport has a great effect on the confirmed cases. the number of caes reduced drastically

4. Restriction on Internal movement has no effect on reduced cases

5.  Restriction on gathering has no effect on the rate of infection

6. control of international travel is seen to have an effect on the number of confirmed cases. The number of cases is greatly reduced

