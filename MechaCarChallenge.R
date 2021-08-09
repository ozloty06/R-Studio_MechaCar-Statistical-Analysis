
# ### DELIVERABLE 1 ### 
# Use the library() function to load the dplyr package.
library(dplyr)


# Import and read in the MechaCar_mpg.csv file as a data frame.
prototypes_data <- read.csv('MechaCar_mpg.csv',check.names = F,stringsAsFactors = F) #read in dataset
head(prototypes_data)


# Perform linear regression using the lm() function. In the lm() function, pass in all six variables (i.e., columns), 
# Make sure your data meet the assumptions. ...
ggplot(prototypes_data,aes(x=mpg)) + geom_density() #visualize distribution using density plot
shapiro.test(prototypes_data$mpg) 
# mpg data was not normally distributed based on shapiro-wilk normality test p-value = 0.7869

# Create a correlation matrix
prototypes_matrix <- as.matrix(prototypes_data[,c("vehicle_length","vehicle_weight","spoiler_angle", "ground_clearance", "AWD", "mpg")]) #convert data frame into numeric matrix
matrix <- cor(prototypes_matrix)
head(matrix)

# Perform the linear regression analysis. ...
# and add the dataframe you created in Step 4 as the data parameter.
lm(mpg ~ vehicle_weight + spoiler_angle + ground_clearance + AWD + vehicle_length,data=prototypes_data) #generate multiple linear regression model

# Using the summary() function, determine the p-value and the r-squared value for the linear regression model.
summary(lm(vehicle_length ~ vehicle_weight + spoiler_angle + ground_clearance + AWD + mpg,data=prototypes_data)) #generate summary statics

# Plot MPG vs Vehicle Length
ggplot(prototypes_data)+geom_point()+geom_smooth(method="lm")+aes(mpg,vehicle_length)

# Save your MechaCarChallenge.RScript file to your GitHub repository.
# Ok.


# ### DELIVERABLE 2 ###
# In your MechaCarChallenge.RScript, import and read in the Suspension_Coil.csv file as a table.
suspension_data <- read.csv('Suspension_Coil.csv',check.names = F,stringsAsFactors = F) #read in dataset
head(suspension_data)

# plot the suspension coil PSI for the different lots
ggplot(suspension_data)+ geom_bar() + aes(PSI, color=Manufacturing_Lot)

# Write an RScript that creates a total_summary dataframe using the summarize() function to get the mean, median, variance, and standard deviation of the suspension coil’s PSI column.
# load tidyverse library 
library(tidyverse)

total_summary <- suspension_data %>% summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI)) #create summary table with multiple columns
head(total_summary)

# Write an RScript that creates a lot_summary dataframe using the group_by() and the summarize() functions to group each manufacturing lot by the mean, median, variance, and standard deviation of the suspension coil’s PSI column.
lot_summary <- suspension_data %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI), .groups = 'keep') #create summary table with multiple columns
head(lot_summary)




# ### DELIVERABLE 3 ###
# create a sample set from the data
sample_table <- suspension_data %>% sample_n(50) #randomly sample 50 data points

# use the t.test() function to determine if the PSI across all manufacturing lots is statistically different from the population mean of 1,500 pounds per square inch.
total_lots <- t.test((sample_table$PSI),mu=mean(suspension_data$PSI)) #compare sample versus population means
total_lots

# Next, write three more RScripts in your MechaCarChallenge.RScript using the t.test() function and its subset() argument to determine if the PSI for each manufacturing lot is statistically different from the population mean of 1,500 pounds per square inch.
Lot1 <- t.test(subset(sample_table, Manufacturing_Lot == "Lot1")$PSI,mu=1500)
Lot1
Lot2 <- t.test(subset(sample_table, Manufacturing_Lot == "Lot2")$PSI,mu=1500)
Lot2
Lot3 <- t.test(subset(sample_table, Manufacturing_Lot == "Lot3")$PSI,mu=1500)
Lot3



