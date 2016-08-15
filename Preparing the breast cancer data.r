#-------------------------------------------------------------------#
# Clearing memory
#-------------------------------------------------------------------#
rm(list=ls())

#-------------------------------------------------------------------#
# Downloading data
#-------------------------------------------------------------------#
loc <- "http://archive.ics.uci.edu/ml/machine-learning-databases/"
ds  <- "breast-cancer-wisconsin/breast-cancer-wisconsin.data"
url <- paste(loc, ds, sep="")

df  <- read.table(url, sep=",", header=FALSE, na.strings="?")[-1]
df  <- df[, c(10, 1:9)]
names(df) <- c("class", "clumpThickness", "sizeUniformity",
					"shapeUniformity", "maginalAdhesion",
					"singleEpithelialCellSize", "bareNuclei",
					"blandChromatin", "normalNucleoli", "mitosis")

df$class <- factor(df$class, levels=c(2,4),labels=c("benign", "malignant"))

set.seed(123456)
train    <- sample(nrow(df), 0.7*nrow(df))
df.train <- df[ train,]
df.valid <- df[-train,]

#-------------------------------------------------------------------#
# Function for assessing binary classification accuracy
#-------------------------------------------------------------------#
performance <- function(table, n=2){
	if(!all(dim(table) == c(2,2)))
		stop("Must be a 2 x 2 table")
	tn = table[1,1]
	fp = table[1,2]
	fn = table[2,1]
	tp = table[2,2]
	sensitivity = tp/(tp+fn)  # true positive rate
	specificity = tn/(tn+fp)  # true negative
	ppp = tp/(tp+fp)          # Probability that an observation with a positive classification is correctly identified
                              # as positive (also called precision)
	npp = tn/(tn+fn)          # Probability that an observation with a negative classification is correctly
                              # identified as negative
	hitrate = (tp+tn)/(tp+tn+fp+fn)  # Proportion of observations correctly identified
	result <- paste("Sensitivity = ", round(sensitivity, n) ,
	"\nSpecificity = ", round(specificity, n),
	"\nPositive Predictive Value = ", round(ppp, n),
	"\nNegative Predictive Value = ", round(npp, n),
	"\nAccuracy = ", round(hitrate, n), "\n", sep="")
	cat(result)
}

