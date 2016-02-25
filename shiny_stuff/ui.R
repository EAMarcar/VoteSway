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

      
sidebarLayout(
      
 mainPanel(
      
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

            ), ## end mainPanel

      sidebarPanel( h4("Directions", align = "center", style = "color:blue"),
       
   

            
            helpText("VoteSway helps you decide which method is the best way to communicate 
                      with friends or family about an upcoming election \n Simply select
                      the sex and education level and enter the age of the person you want to 
                      get your message to. VoteSway will tell you the best method and dispaly
                      a chart percentage of people in that cohort (+/- 5 yearrs of age) who prefer 
                      that method.  Occaisionally for small cohorts VoteSway's prediction 
                      will vary from the respondents actual choices."),
            
            helpText("Data Source"),
      
            helpText("VoteSway uses data from a Pew Research study that sampled 1011 adults.
                     The survey was conducted by Princeton Survey Research Associates International
                     (PSRAI). Interviews were done in English by Princeton Data Source from 
                     November 1 to 4, 2012. The margin of sampling error for the complete
                     set of weighted data is ± 3.6 percentage points."),
            helpText("Disclaimer"),
            helpText("VoteSway is a project for the Coursera Developing Data Products class.
                     No claims are made as to the validity or accuracy of the information generated.")
    
    
    
      )) ## end sidePanel, end sidebarlayout
      
      
      )  ## end fluidPage  
