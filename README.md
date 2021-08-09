# R-Studio_MechaCar-Statistical-Analysis


## Resources
RStudio v.1.4.1717

## Overview
Vehicle manufacturer, AutosRUs, is unveling their newest prototype, the MechaCar. Unfortunately, some production challenges are intereferring with their progress and upper management has requested a review of the existing production data for insights to help get the manufacturing team back on track. 

This analysis includes a linear regression analysis to identify variables that predict the mpg of the MechaCar prototypes. Additionally, a summary statistics analysis was performed on the suspension coils data on pounds per square inch (PSI) of the coils and t-tests are used determine if manufacturing lots are statistically different from the mean population.


## Results
#### Linear Regression to Predict MPG
A linear regression analysis was used to explore, quantify and measure the variability of coorelated variables. To do this, data from the manufacturing team included vehicle length, vehicle weight, spoiler angle, ground clearance, drive type (AWD), and mpg was used to create a correlation matrix. Variable coefficients varied from 2.5% to 33% for most variables in our MechaCar data set except mpg and vehicle length, which had the higest non-random correlation of 61%. There also exists some correlation of mpg to ground clearance with a non-random correlation of 33%.

> # Create a correlation matrix
> prototypes_matrix <- as.matrix(prototypes_data[,c("vehicle_length","vehicle_weight","spoiler_angle", "ground_clearance", "AWD", "mpg")]) #convert data frame into numeric matrix
> matrix <- cor(prototypes_matrix)

[correlation_matrix]

When plotted for linear regression analysis, the slope of our linear model was greater than zero, indicating a positive correlation of vehicle length to mpg. This is surprising as motorists are generally advised that smaller cars yield higher fuel efficiency (mpg). Therefore an inverse correlationw as expected but not found in this data set. Our null hypothesis states that the slow is equal to zero and alternate hypothesis states that the slope is not equal to zero, therefore there is sufficient evidence to reject our null hypothesis. 

> lm(mpg ~ vehicle_weight + spoiler_angle + ground_clearance + AWD + vehicle_length,data=prototypes_data) # generate multiple linear regression model
> summary(lm(vehicle_length ~ vehicle_weight + spoiler_angle + ground_clearance + AWD + mpg,data=prototypes_data)) # generate summary statics


[linear_regression]

While the linear model does predict the mpg of MechaCar prototypes with a Pearson correlation coefficient of 0.61, our multiple R-squared value of 0.7119 indicates that roughly 71% of the variability of our dependant variable (mpg) is explained using this linear model. Additionally, our p-value of 6.712e-11 is much smaller than our assumed significance level of 0.05%. This is especially important given a potentially lower target significance level may be warranted given the safety standards involved in the development of suspension coils. This further validates rejection of the null hypothesis and our linear model may be used to predict mpg of MechaCar protoypes.

[summary_lm]

#### Summary Statistics on Suspension Coils
The design specifications for the MechaCar suspension coils dictate that the variance of the suspension coils must not exceed 100 pounds per square inch. A target mean of 1500 PSI was provided. Our data indicates a mean of 1498.78 with a median 1500, variance of 62.29356 and a standard deviation of 7.892627. Therefore, our current manufacturing data does collectively meet this design specification in total.

[total_summary]

When we looked at individual lots, three lots were included in our data set. Our means ranged from 1496-1500 with medians from 1498 to 1500. However, our variance indicates a possible area of concern with Lot 3. Lots 1 and 2 had a variance of 0.98 and 7.47 respectively with a standard deviation of 0.99 and 2.73 respectively. Meanwhile, Lot 3 shows a variance of 170 and a standard deviation of 13.0. 

[lot_summary]

With the variance of 170 and standard deviation of 13.0, it is likely that some prototype suspension coils manufactured in Lot 3 exceeded the permissible range of 100 PSI defined in our design specifications. Further, while Lot 2 falls within the expected design specifications, Lot 1 may serve as a preferred comparison for quality improvements over Lot 2, due to the lowest variance and standard deviation in the tested data set. If the manufactured lots are run sequentially, it is possible an issue initially emerges in Lot 2 and is further exasperated during the subsequent runs despite not initially falling outside of specifications. 

A bar chart depicting variance by lot shows Lot 1 data falling consistently close to the target PSI while variability increases within Lot 2 and finally Lot 3.


#### T-Tests on Suspension Coils
Our last analysis includes t-tests to compare the means to sample datasets. T-tests were conducted on a sample subset of the data and for each of the three manufacturing lots within the data. 

[total_lots]

[lots_ttest]

All t-test results included a p-value well above our significance level of 0.05 percent with total p-value calculated at 0.6705 and p-values for lots 1, 2 and 3 at 0.4243, 0.1427, and 0.5129 respectively.


## Summary
#### Study Design: MechaCar vs Competition
To further our analysis of the MechaCar prototype on behalf of the AutosRUs leadership team, a competitive analysis study should be performed. Such a study should investigate items of greatest value to consumers, including:
- price of vehicle (MSRP - Manufacturer's Suggested Retail Price)
- safety rating (NHTSA - National Highway Traffice Safety Administration)
- fuel efficiency (miles per gallon)
- gross vehicle weight rating (GVWR)
- specifications (body type, engine type, powertrain, etc.)
- operating/maintenance expenses (insurance, fuel, repair costs, etc.)

For the study, we would want to look at newest models from comparable competitors and would limit our analysis to comparable vehicles for the prior 2 model years. Our hypotheses for the study would be as follows:
- Null Hypothesis, H~0~: The MechaCar protoype does not outperform comparable competitor vehicles in fuel efficiency and safety.
- Alternate Hypothesis, H~a~: The MechaCar outperforms comparable models in fuel efficiency and safety.

To conduct our statistical test, we can use a two-way ANOVA to test both fuel effiency and safety ratings across muliple groups of data from the manufacturers. This test is the most straightforward way to compare means across large real-world numerical data with more than one sample or groups providing data.