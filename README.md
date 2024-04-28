# Regression Analysis on Cancer Data

<h2> Introduction </h2>
<p>Cancer is the number one leading cause of deaths in the United States. It is critical to detect cancer early in order to reduce the number of people who die because of it. For this project we analyzed a real-world dataset based on cancer incidences in America. This dataset consists of 3072 observations and 16 variables. In this dataset each row represents a county. The purpose of our project was to take this dataset and analyze it to gain meaningful insights on what factors affect the cancer incidence rate. We have performed regression algorithms to analyze and summarize the data into useful knowledge that helps in the decision making process with the effective model. In this problem we have performed linear regression in RStudio and Lasso Regression in python notebook.</p>
<h2>Key findings and recommendations</h2>
<h3>Visualizations</h3>
<p>Before analyzing the data to solve which factors affected cancer incidence rates, we put the raw data into a series of charts in order to visualize what it was telling us at the start. Below we have outlined the charts we used and explained the meaning of each chart.</p>
<img src="Fig1_Cancer.jpg", alt="fig1">
<p>Figures 1 and 2 show an initial scatter plot of the cancer data. Using incidenceRate as the base variable, we can interpret these graphs in terms of each of the other variables correlating with the incidenceRate variable. From Figure 1, the data is showing that there are only positive correlations with popEst2015 and PovertyEst. In Figure 2, the variables from recTrend to incidenceRate were modeled. From Figure 2, the data is showing a positive correlation between incidenceRate and the variables, avgAnnCount, deathRate, and avgDeathsPerYear. These graphs start to give us an idea of the variables we will pay more attention to in our analysis.</p>
<img src="Fig2_Cancer.jpg", alt="fig2">
<img src="Fig3_Cancer.jpg", alt="fig3">
<p>Figure 6 shows that in most of the observations, the death rate from cancer has been about 300 per 100,000 people per county. Figure 7 shows the average deaths per county per year were under 5,000 from 2009-2013. Therefore, looking at these two graphs, the death rate and overall deaths per year seem to be falling.</p>
<img src="Fig4_Cancer.jpg", alt="fig4">
<p>From these visualizations, we can see that with the data provided variables like the poverty, population, and death rates may have an impact on the cancer incidences.</p>
<ol><li><B>Regions of the country most prone to cancer</B></li>
We divided all of the states into four regions as per the US Census bureau -<br>
<U>Region 1:</U> Northeast- Connecticut, Maine, Massachusetts, New Hampshire, Rhode Island, Vermont, New
Jersey, New York, and Pennsylvania<br>
<U>Region 2:</U> Midwest- Illinois, Indiana, Michigan, Ohio, Wisconsin, Iowa, Kansas, Minnesota, Missouri, Nebraska, North Dakota, and South Dakota<br>
<U>Region 3:</U> South- Delaware, Florida, Georgia, Maryland, North Carolina, South Carolina, Virginia, Washington, D.C, West Virginia, Alabama, Kentucky, Mississippi, Tennessee, Arkansas, Louisiana, Oklahoma, and Texas<br>
<U>Region 4:</U> West- Arizona, Colorado, Idaho, Montana, Nevada, New Mexico, Utah, Wyoming, Alaska, California, Hawaii, Oregon, and Washington<br>
<img src="Fig5_Cancer.jpg", alt="fig5">  
<p>We calculated the average incidence rate for each of the four regions based on which we found the following figures:
We see that at 471.41 per 100,000, the North-East has the highest incidence-rate of Cancer in the United States.
https://www2.census.gov/geo/pdfs/maps-data/maps/reference/us_regdiv.pdf </p><br>
  
 <li><B>Four Level indicator variable</B></li>
<p>The levels we chose to partition medIncome were Low, Very Low, High, and Very High. From the chart above, it is clear that Very Low has the highest incidence rate, followed by Low, then High, then finally Very High. This means that most counties have a very low median household income. Please click the following link to see the code that generated this chart:
https://colab.research.google.com/drive/1dH5cABx4lLTya2bzVETr-UvidAxfnyZD?usp=sharing </p> <br>
<img src="Fig6_Cancer.jpg", alt="fig6">
<li><B>Correlation analysis</B></li>
<p>From the generated correlation matrix above, many correlations between factors can be seen. One such correlation is between avgDeathsPerYear and avgAnnCount, with a correlation of 0.94. This has a very high positive correlation, indicating that as avgDeathsPerYear increases, so does avgAnnCount. This makes total sense since it is expected that as the incidences of cancer increases, the number of deaths would increase as well. Another strong correlation was between PovertyEst and avgDeathsPerYear with a correlation of 0.94. This also makes intuitive sense since it is expected that as poverty increases, more deaths will occur. </p>
<img src="Fig7_Cancer.jpg", alt="fig7">
<p>A very interesting correlation that can be seen is between avgAnnCount and PovertyEst, with a correlation of 0.89, which means that the poorer a county is, the more incidences of cancer there are. This could be linked to stress, nutrition, or many other factors, but further analysis would need to be done to find out. One of the more obvious or expected correlations is between avgAnnCount and popEst2015. These two variables have a correlation of 0.93. This means that the higher the population of a county is, the more people will get cancer, which is obvious. The only factor that is directly moderately correlated with incidenceRate is deathRate, with a correlation of 0.45. This means that as the incidence rate of cancer increases, the deaths from cancer will increase as well, which is obvious. No other factors had much correlation with incidenceRate directly. Please click the following link to see the code that generated this chart:
https://colab.research.google.com/drive/1dH5cABx4lLTya2bzVETr-UvidAxfnyZD?usp=sharing </p><br>

<li><B>Regression models</B></li>
<b><U>Linear Regression</U></b>
<p>Linear regression is performed explaining the incidenceRate using all the variables except the geographical variables such as County, countyName, countyCode and State.
Using forward selection we determine the optimized model for this problem.
P-Value for this model is less than alpha(0.05) thus we can say that this model is significant. Overall this a useful model with R-squared value equals 0.4729 which means approximately 47% of the incidenceRate is explained by these variables.</p>
<b>Model Output:</b>
<p>When we ran our optimized model we received the output shown above. We can interpret this model by saying that the variables deathRate, fiveYearTrend, povertyPercent, avgAnnCount, popEst2015, and medIncome are the significant variables. In terms of the relationships with incidenceRate, we can say:<br>
When deathRate increases, incidenceRate increases, holding all the other independent variables constant. When fiveYearTrend increases, incidenceRate increases, holding all the other independent variables constant. When povertyPercent increases, incidenceRate decreases, holding all the other independent variables constant. When recentTrendrising increases, incidenceRate increases, holding all the other independent variables constant. When recentTrendstable increases, incidenceRate increases, holding all the other independent variables constant. When recTrendfalling increases, incidenceRate increases, holding all the other independent variables constant. When recTrendrising increases, incidenceRate decreases, holding all the other independent variables constant. When recTrendstable increases, incidenceRate increases, holding all the other independent variables constant. When avgAnnCount increases, incidenceRate increases, holding all the other independent variables constant. When popEst2015 increases, incidenceRate decreases, holding all the other independent variables constant. When medIncome increases, incidenceRate increases, holding all the other independent variables constant.</p>
<b><U>Lasso Regression</U></b>
<p>Performed One-Hot Encoding for all the categorical variables that did not have an implied ordering. Here is the sample of one-hot encoding for the variable “State”.
Performed Ordinal Encoding on the categorical variables that had an implied ordering in order to preserve their order, here is an example:
Performing lasso regression with different alpha values after splitting the dataset into test and train set. Here 20% of the data is allotted for the test set and 80% data is allotted for the train set.
With this model the R-squared values are calculated.
We found out that lower values of alpha seem to produce better R2 scores (a better fit for the model).
See the code here:
https://colab.research.google.com/drive/1dH5cABx4lLTya2bzVETr-UvidAxfnyZD?usp=sharing </p>
</ol>

<h2>Recommendations:</h2>
<p>Going forward, based on our findings our recommendations would be that the American Cancer Society focus the most on the North East, then the South and Mid West, then the West as that is the ordering from most incidences of cancer to the least incidences of cancer, and that they focus on deathRate, fiveYearTrend, povertyPercent, recentTrend, recTrend, avgAnnCount, popEst2015, and medIncome, since these are the factors that best explain incidenceRate, so figuring out how to change these would in turn allow us to lower the incidence rate of cancer. Also, based on the correlation matrix, deathRate is moderately correlated with incidenceRate, so again, attention should be given to this, there are other variables that are correlated with deathRate, so by changing those, deathRate would also change, and then incidenceRate would change, so the correlation matrix can be used as a guide in this fashion.</p>
<h2>Conclusion</h2>
We performed Regression algorithms,
<ol><li>Linear Regression - The best model has given R-Squared value of 47% </li>
<li>Lasso Regression - The best model has given R-Squared value of 37% with alpha = 1.0 </li></ol>
<p>Also we have visualized various graphs keeping incidenceRate as the base variable.
We met the requirements of the project by exploring the factors related to cancer deaths in the US. We did this by creating a model of cancer incidence using the factors in this dataset. We wrote an executive summary of cancer factors in America. We also did this by finding out which regions of the country are most prone to cancer. We Created a 4 level indicator variable for Median Income (column G) and conducted an analysis, comparing the incidence rate of these levels (Very Low, Low, High, Very High). We did a correlation analysis to see which factors are most highly correlated with cancer incidence rate (and which are correlated with each other). We created an actionable regression model for incidence rate. </p><p>Lastly, we explainecd our findings so that a non-technical person could understand. We went above and beyond by implementing a Lasso Regression model, and hypertuning it. We also applied superior professionalism in the design and appearance of our solution. For our visualizations using R, we used functions that we weren’t taught in class such as ggplot2 and when using Excel, we also used functions that we weren’t taught in class. We also used Scikit-learn and Pandas to generate some of our graphs and to build our Lasso Regression model, which we weren’t taught in class. Some key challenges we faced with this dataset were the amount of variables and observations we had to analyze. When performing the linear regression to identify which factors affected cancer incidence rates, we had 16 variables to perform the model selection. Using R, we were able to complete forward selection to find the optimized model. In terms of recommendations, we mentioned that the American Cancer Society should focus the most on the North East, then the South and Mid West, then the West, in that order. We mentioned which factors they should pay the most attention to and why.</p>
