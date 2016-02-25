# VoteSway
##Data Products class project
###February 25, 2016

The class project consists of two parts, a shiny application and a slidify presentation.  There is an additional component used in preparation of the application.

**The shiny app**

The shiny app files are located in a sub directory of this repository: shiny_stuff.  The application itself is composed of server.R and ui.R files.

Two other files VoteSway_inout.csv and swaymod.rds are inputs to server.R.  VoteSway_input contains servey data from Pew Research cited below.  swaymod.rds is an R file containing a Random Forest model used by the app.

A www file is used for css for the application.

**The presentation**

The presentation file is index.Rmd.  There are also a .md and .html versions of the file.

There are various other related files in this directory including another copy of VoteSway_input.csv used in the presentation.

**Other component and files**

There is another R script file, VoteSway_data_final which reads Pew_2012_social.csv and runs the Random Forest model,  This script writes the VoteSway_input.csv and swaymod.rds files.

The Pew Research survey information is located here: http://www.pewinternet.org/2012/11/06/social-media-and-voting/


End of file