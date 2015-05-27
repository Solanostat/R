# load data from local disk
iris <- read.csv("~/Documents/R/Data/Iris.txt", header=FALSE)

# change column names of a data frame in R
colnames(iris) <- c("Sepal.Length", "Sepal.Width",  "Petal.Length", "Petal.Width",  "Species" )

# Check the dimensionality
dim(iris)

# select variables v1, v2, v3
myvars <- c("v1", "v2", "v3")
newdata <- mydata[myvars]

# another method
myvars <- paste("v", 1:3, sep="")
newdata <- mydata[myvars]

# select 1st and 5th thru 10th variables
newdata <- mydata[c(1,5:10)]

# exclude variables v1, v2, v3
myvars <- names(mydata) %in% c("v1", "v2", "v3") 
newdata <- mydata[!myvars]

# exclude 3rd and 5th variable 
newdata <- mydata[c(-3,-5)]

# delete variables v3 and v5
mydata$v3 <- mydata$v5 <- NULL

#Get Sepal.Length of the first 10 rows
iris[1:10, "Sepal.Length"]          # or iris$Sepal.Length[1:10]

# check the first and last five rows
head(iris, n=5)                     # or iris[1:5,]
tail(iris, n=5)                     # or iris[146:150,]

# based on variable values
newdata <- mydata[ which(mydata$gender=='F' 
& mydata$age > 65), ]

# The subset( ) function is the easiest way to select variables and observations. 
# In the following example, we select all rows that have a value of age greater than or equal to 20 or 
# age less then 10. We keep the ID and Weight columns.
newdata <- subset(mydata, age >= 20 | age < 10, select=c(ID, Weight))

# In the next example, we select all men over the age of 25 and we keep variables weight through income 
# (weight, income and all columns between them).
newdata <- subset(mydata, sex=="m" & age > 25,
select=weight:income)

#check variable names or column names
names(iris)

#structure
str(iris)

#attributes
attributes(iris)

#Distribution of every variable
summary(iris)

#Frequency
table(iris$Species)

#pie chart
pie(table(iris$Species))

#Variance of Sepal.Length
var(iris$Sepal.Length)

#Covariance of two variables
cov(iris$Sepal.Length, iris$Petal.Length)

#Correlation of two variables
cor(iris$Sepal.Length, iris$Petal.Length)

#histogram
hist(iris$Sepal.Length)

#density
plot(density(iris$Sepal.Length))

#scatter plot
plot(iris$Sepal.Length, iris$Sepal.Width)

#pair plot
plot(iris)                       # or pairs(iris)


