## Get dataframe
Age <- c(18, 25, 40, 16, 35, 24, 19, 25, 32, 21)

Gender <- c("Male", "Male", "Female", "Male", "Male", "Male", "Female", "Female", "Male", "Female")

Attendance_df <- data.frame(Age, Gender)

#Discretise equal width
disc <- function(df, bin) {
  y <- df[!sapply(df, is.numeric)]											#Save non-numeric attributes
  df <- df[sapply(df, is.numeric)]											#Strip out non-numeric attributes
  saved.names <- names(df)												#Save names of attributes
  store <- list()																#Create empty list
  for (i in 1:ncol(df)) {														#For each numeric columns in dataset
    a <- df[,i]
    B <- max(a)															#Maximum value of non-ordinal attribute
    A <- min(a)															#Minimum value of non-ordinal attribute
    W <- (B-A)/bin														#Width interval 
    c <- seq(A, B, by = W)												#Cut values
    for (m in 1:nrow(df)) {												#For each row of non-ordinal attribute
      for (n in 1:(length(c)-1)) {											#For each cut values
        if (a[m] >= c[n] && a[m] < c[n+1]) {						#Compare row value across cut values
          a[m] <- c[n]												#Replace row value with minimum cut interval
        }
      }
    }
    store[[i]] <- a															#Insert in list after discretisation of each column in dataset
  }
  store <- do.call(cbind.data.frame, store)									#Convert list to dataframe
  names(store) <- saved.names												#Restore original names
  df <- cbind(y, store)														#Join non-numeric columns 
  return(df)
}

att_disc <- disc(Attendance_df, 4)
store <- c()
for(i in 1:nrow(att_disc)){
  if (att_disc$Age[i] == 16) {
    store[i] <- 'A'
  }
  else if (att_disc$Age[i] == 22) {
    store[i] <- 'B'
  }
  else if (att_disc$Age[i] == 32) {
    store[i] <- 'C'
  }
  else if (att_disc$Age[i] == 40) {
    store[i] <- 'D'
  }
  else {
    store[i] <- 'E'
  }
}
att_disc$Age_ca <- store

att_disc