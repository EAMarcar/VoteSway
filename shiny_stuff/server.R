## server.R script

suppressPackageStartupMessages(library(shiny))
suppressPackageStartupMessages(library(ggplot2))
suppressPackageStartupMessages(library(dplyr))
suppressPackageStartupMessages(library(googleVis))
suppressPackageStartupMessages(library(caret))
suppressPackageStartupMessages(library(randomForest))

vote1 <- read.csv("VoteSway_input.csv", stringsAsFactors=FALSE)

function(input, output) {
         
#       output$value1 <- renderPrint({ input$age })
#       output$value2 <- renderPrint({ input$sex })
#       output$value3 <- renderPrint({ input$educ })
      
      

      ## read in the model
      
      swaymod <- readRDS("swaymod.rds")
      
      
 
      
      ## create the reactive variable to use to produce the plot
      
      vote2 <- reactive({
            
            ## validate input
            
            validate(
                  need(input$age >= 18 & input$age <= 100,
                        "Please enter an age be between 18 and 100"),
                  errorClass = "VSerrors"
            )
                        
            
            if (input$sex == 'male') {sex_in = 1}
            else {sex_in <- 2}    
              
            ## subset the dataset for the selected cohort          
                
            votez <- subset(vote1, (age >= (input$age -5) & age <= (input$age + 5) ) 
                                  & (sex == sex_in) 
                      & (educ == input$educ)  )
      
            if (nrow(votez) > 0) {
            
            ## build the data frame that is the input to the googleVis chart     
          
            votez <- mutate(votez, num=1, tot=nrow(votez))
            votez <- select(votez, outcome, num)  
            votez <- summarize(group_by(votez, outcome), num=sum(num))
            votez$tot <- sum(votez$num)             
            votez <- mutate(votez, Percent = round((num/tot * 100)))
            
            ## Add column used gy GoogleVis
            codes <- c("A", "B", "C", "D", "E")
            litrl <- c("Face-to-Face", "Phone Call", "Email", "Text", "Social Media Post")
            
            votez$outcome <- ifelse(votez$outcome == "A", "Face-to-Face", votez$outcome)
            votez$outcome <- ifelse(votez$outcome == "B", "Phone Call", votez$outcome)
            votez$outcome <- ifelse(votez$outcome == "C", "Email", votez$outcome)
            votez$outcome <- ifelse(votez$outcome == "D", "Text", votez$outcome)
            votez$outcome <- ifelse(votez$outcome == "E", "Social Media Post", votez$outcome)
            
            
#             for ( i in 1:nrow(votez)) {
#                   
#                   if (votez$outcome[i] == codes[i]) {  votez$outcome[i] <- litrl[i]}  
#             }
                        
            
            ## value of vote2() 
            select(votez, outcome, Percent)
            
            
            
            
            }
            
                        
                     
          })
      
      returned <- reactive({
          
            
            
            
            
            
            input$goButton
            isolate ({
                
                  c_type  <- "Not avialable"
                  validate(
                        need(is.numeric(input$age),
                             "Please enter a numeric value for age"),
                        errorClass = "VSerrors")
                              
            sex_in <- 2
            if (input$sex == 'male') {sex_in <- 1}
                  
            age <- as.integer(input$age)
            if (age < 18 | age > 100 ) { age <- 35}
            
            sex <- as.integer(sex_in)
            educ <- as.factor(input$educ)
            inputs <- cbind(age,sex,educ)
            new_vote <- as.data.frame(inputs)
            new_vote$educ <- as.factor(new_vote$educ)
            
            
            ## predict the outcome
#         input$goButton
#         isolate(
            outcode <- predict(swaymod, newdata=new_vote)
                         
 ##            )   ## close isolate 
            
            

            ## pick txt for outcome
     
            codes <- c("A", "B", "C", "D", "E")
            litrl <- c("Face-to-Face", "Phone Call", "Email", "Text", "Social Media Post")
                  
            c_type  <- "Not avialable"
            
            for ( i in 1:5) {
                  
                  if (outcode == codes[i]) { c_type <- litrl[i]}  
            }

            outcode <- "X"
                         
            })
         
           c_type   ## the predicted communications medium
      })


      output$text4 <- renderPrint({
            prediction <- returned()
   
             input$goButton
            isolate(prediction)
             
             })
 
 ## render the plot

     output$gvis <- renderGvis({ 
            
            input$goButton      
            isolate(
             
            if (length(vote2()) > 0) {      
          
                gvisColumnChart(vote2(), 
               ##                 xvar="Outcomes", yvar=c("Percent"),
                    options=list(width=600, height=450, title="Preferred Communication Methods",
                   titleTextStyle="{color:'blue',fontName:'Ariel',fontSize:16}")                           
                                
                                )
                       
            }
                )  ## close isolate
            
            
                  })
      
}

## end of file