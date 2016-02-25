## project app "VoteSway" data peparation module

## libraries
library(dplyr)
library(caret)
## read Pew data 

vote_data <- read.csv("Pew_2012_social.csv", stringsAsFactors=FALSE)

## create action and outcome variable

vote_data$action <- 0
vote_data$outcome <- "U"

for (i in 1: nrow(vote_data)) {
      
if (vote_data$pial1e[i] == 1) { vote_data$action[i] <- vote_data$action[i] + 1
                                vote_data$outcome[i] <- "E" }       

if (vote_data$pial1d[i] == 1 & vote_data$outcome[i] == "U") 
                              { vote_data$action[i] <- vote_data$action[i] + 1
                               vote_data$outcome[i] <- "D" }  

if (vote_data$pial1c[i] == 1 & vote_data$outcome[i] == "U") 
                              { vote_data$action[i] <- vote_data$action[i] + 1
                                vote_data$outcome[i] <- "C" }

if (vote_data$pial1b[i] == 1 & vote_data$outcome[i] == "U") 
                              { vote_data$action[i] <- vote_data$action[i] + 1
                                vote_data$outcome[i] <- "B" }

if (vote_data$pial1a[i] == 1 & vote_data$outcome[i] == "U") 
                              { vote_data$action[i] <- vote_data$action[i] + 1  
                                    vote_data$outcome[i] <- "A" }

}

## Drop oservations with no selected outcome 

vote1 <- filter(vote_data, outcome != "U")

## select variables for analysis

vote2 <- select(vote1, age, sex, educ2, outcome)

## convert educ2 to class variable with three levels

vote2$educ2 <- ifelse(vote2$educ2 == 9, median(vote2$educ2),  vote2$educ2)
vote2$educ <- 0
vote2$educ <- ifelse(vote2$educ2 == 1| vote2$educ2 == 2 | vote2$educ2 == 3, 1, vote2$educ)
vote2$educ <- ifelse(vote2$educ2 == 4| vote2$educ2 == 5 | vote2$educ2 == 6, 2, vote2$educ)
vote2$educ <- ifelse(vote2$educ2 == 7| vote2$educ2 == 8 | vote2$educ2 == 9, 3, vote2$educ)
vote2$educ <- as.factor(vote2$educ)

vote3 <- select(vote2, age, sex, educ, outcome)



## Write out the file to be used for the model inside the app

write.csv(vote3, file = "VoteSway_input.csv")


## train the model

sway_mod <- train(outcome ~ ., data = vote3, method = "rf", importance = TRUE, verbose = FALSE)

## save the file with the model

saveRDS(sway_mod, "swaymod.rds")


## End of file

