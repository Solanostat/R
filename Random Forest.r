# Random Forest for classification

#-------------------------------------------------------------------#
# Library Required 
#-------------------------------------------------------------------#

packages = c("randomForest", "pROC", "ggplot2")
packages = lapply(packages, FUN = function(x) {
  if(!require(x, character.only = TRUE)) {
    install.packages(x, dependencies = TRUE)
    library(x, character.only = TRUE)
  }
})

#-------------------------------------------------------------------#
#  Model Building: Choosing the number of trees
#-------------------------------------------------------------------#

# Initializing the parameter tuning
nIter <- 50
nTree <- seq(30,1200,30)
auc <- matrix(NA, nIter, length(nTree))

for(i in 1:nIter){
  # Initializing the cross validation
  idx <- sample(nrow(df.train), 0.1*nrow(df.train))
  for(nt in nTree){
    fit.forest    <- randomForest(class~., data=df.train[-idx,], na.action=na.roughfix, ntree=nt)
    forest.pred   <- predict(fit.forest, df.train[idx,], type="prob")
    roc    <- roc(df.train[idx,1]~forest.pred[,1], df.train)
    auc[i, which(nTree==nt)] <- auc(roc)
  }
  print(i)
}

data.plot <- data.frame(nTree, apply(auc,2,mean))
names(data.plot) <- c("number.tree", "average.auc")
ggplot(data.plot, aes(x=number.tree, y=average.auc)) + geom_point(shape=1) +  geom_smooth()


##---------------------------------------------------------------------#
## Fitting the final model, getting the prediction and testing the model
##---------------------------------------------------------------------#

fit           <- randomForest(class~., data=df.train, na.action=na.roughfix, importance =TRUE, ntree=500)
forest.pred1  <- predict(fit, df.valid, type="prob")
forest.pred2  <- predict(fit, df.valid)

roc           <- roc(df.valid[,1]~forest.pred1[,1], df.valid, plot=T)
forest.perf   <- table(df.valid$class, forest.pred2, dnn=c("Actual", "Predicted"))

> auc(roc)
Area under the curve: 0.9987
> performance(forest.perf)


