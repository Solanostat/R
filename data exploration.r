# load data from local disk
iris <- read.csv("~/Documents/R/Data/Iris.txt", header=FALSE)

# change column names of a data frame in R
colnames(iris) <- c("Sepal.Length", "Sepal.Width",  "Petal.Length", "Petal.Width",  "Species" )

# Check the dimensionality
dim(iris)

#Get Sepal.Length of the first 10 rows
iris[1:10, "Sepal.Length"]          # or iris$Sepal.Length[1:10]

# check the first and last five rows
head(iris, n=5)                     # or iris[1:5,]
tail(iris, n=5)                     # or iris[146:150,]

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


