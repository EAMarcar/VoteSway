suppressPackageStartupMessages(library(shiny))
suppressPackageStartupMessages(library(dplyr))





fluidPage(theme = "bootstrap.css",

      tags$head(      
      tags$style(HTML("
      .shiny-output-error-VSerrors {
            color: red;
            font-weight: bold;
            font-size: 24px;
            }
         ")),
      
      tags$style(HTML(".shiny-text-output {
            color: blue;
            font-weight: bold;      
            font-size: 24px;
      } "))
      
      ), 
          
          
      titlePanel("VoteSway"),
  
      helpText("Find the best way to persuade
               friends and family to vote for your favorite candidate."),
      helpText("Enter the characterisitices of the person you want
               to persuade.
      VoteSway will tell you the most effective means of communication to use"),
##      helpText(" VoteSway will tell you the most effective means of communication to use"),
      
      
      fluidRow(
            column(3, 
      radioButtons("sex", "Sex:",
                   c("Male" = "male",
                     "Female" = "female"))),
            column(4,
      radioButtons("educ", "Education level:",
                   c("High School" = 1,
                     "College" = 2,
                     "Advanced Degree" = 3)))),
       
      fluidRow(
            column(3, 
      numericInput("age", label=("Age:"), 35,
             min = 18, max = 100),
            hr()),
            
            column(4, helpText("Enter data then press submit")),
      
            column(6,       
      actionButton("goButton", "Submit"))),
      
   
      fluidRow(
            
            column(6, h4("The predicted optimal medium for this person is:"),
                      textOutput('text4'))
   
               ),
       

      helpText(
            "The chart below shows the sample distribution for people with these characteristics (age +/- 5 years)"),
 
      htmlOutput("gvis"),
      
      helpText("_______________________________________________")
)  
