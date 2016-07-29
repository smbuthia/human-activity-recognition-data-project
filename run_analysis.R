## data directory location
datadir <- "UCI HAR Dataset"

## merge training data
mergetrain <- function(trainfile_x = "X_train.txt",
                       trainfile_y = "y_train.txt",
                       trainfile_subject = "subject_train.txt",
                       traindir = "train"){
    trainfile_x <- paste(datadir, traindir, trainfile_x, sep = "/")
    trainfile_y <- paste(datadir, traindir, trainfile_y, sep = "/")
    trainfile_subject <- paste(datadir, traindir, trainfile_subject, sep = "/")
    
    if(file.exists(trainfile_x) 
       & file.exists(trainfile_y) 
       & file.exists(trainfile_subject)) {
        traindata_x <- read.table(trainfile_x)
        traindata_y <- read.table(trainfile_y)
        traindata_subject <- read.table(trainfile_subject)
        
        trainall <- cbind(traindata_x, traindata_y, traindata_subject)
    }
    else {
        stop("possibly missing a training file!")
    }
    trainall
}

## merge test data
mergetest <- function(testfile_x = "X_test.txt",
                      testfile_y = "y_test.txt",
                      testfile_subject = "subject_test.txt",
                      testdir = "test"){
    testfile_x <- paste(datadir, testdir, testfile_x, sep = "/")
    testfile_y <- paste(datadir, testdir, testfile_y, sep = "/")
    testfile_subject <- paste(datadir, testdir, testfile_subject, sep = "/")
    
    if(file.exists(testfile_x) 
       & file.exists(testfile_y) 
       & file.exists(testfile_subject)) {
        testdata_x <- read.table(testfile_x)
        testdata_y <- read.table(testfile_y)
        testdata_subject <- read.table(testfile_subject)
        
        testall <- cbind(testdata_x, testdata_y, testdata_subject)
    }
    else {
        stop("possibly missing a test file!")
    }
    testall
}


## merges the training and test data sets to create one data set
mergetestandtrain <- function(...) {
    alldata <- rbind(mergetrain(), mergetest())
    alldata
}

## extracts mean and sd for each measurement
getmeanandsdmeasurements <- function(dataset) {
    ## get the means 
    means <- colMeans(dataset)
    ## get the sd
    stddeviations <- apply(dataset, 2, sd)
    meanandsd <- rbind(means, stddeviations)
}

## replace activities with descriptive activity names
setactivitynames <- function(activitydata, 
                             activitylabelsfile = "activity_labels.txt") {
    activitylabelsfile <- paste(datadir, activitylabelsfile, sep = "/")
    activitylabels <- read.table(activitylabelsfile)
    names(activitylabels) <- c("code", "description")
    activitylabels$description <- lapply(activitylabels$description, as.character)
    library(plyr)
    mapvalues(activitydata[[1]], activitylabels$code, activitylabels$description)
}

## labels data in the data set with appropriate label names
labeldataset <- function(featuresfile, dataset) {
    featuresfile <- paste(datadir, featuresfile, sep = "/")
}