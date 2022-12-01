################################################################################
#                                                                              #
#       All rights reserved to Jacob (Jian) Li, graduate student of            #
#       New York University (NYU)                                              #
#       Department of Business (DPB)                                           #
#       Management and System Program (MASY)                                   #
#       Master of Science in Management and System (M.S. in MS)                #
#                                                                              #
################################################################################

# R Package used to build Shiny App 
library(shiny)

# R Package used to build Fuzzy Inference System
library(sets)

# UI design
ui <- fluidPage(
  
  #Sidebar Part 1--get user's three required inputs for prediction 
  sidebarLayout(
    sidebarPanel(
    # HTML tags to build User Interface neat
    h2("Please enter ALL repuried fields to predict"),
    br(),
    # Get user input of their estimated annual salary in K Dollars. Default value is 70
    numericInput("salary", "Please enter your estimited annual salary (In K Dollars):", value=70),
    
    # Get user input of their estimated commute time in minutes. Default value is 30
    numericInput("commute", "Please enter your estimated commute time (In Minutes):", value=30),
    
    # Get user input of their company's employees' number. Default value is 50
    numericInput("company", "please enter how many employees your company have: ", value=50),
    
    # FIS start to process data with all three user's inputs after click the button
    actionButton("action", "Comfim and Proceed"),

    # HTML tags to build User Interface neat
    br(),
    br(),
    br(),
    br(),
    br(),
    br(),
    br(),
    br(),
    br(),
    br(),
    br(),
    
    # HTML tags to build User Interface neat
    h2("Please Menmbership Function you want to display"),
    
    # Get User selection of display four membership functions, including 3 input membership functions
    # and one output membership function
    selectInput("option", "Please select what Membership Function you want to see", 
                choices = c("Salary",
                            "Commute Time", 
                            "Company Size",
                            "Prediction"),
                 selected = "Salary")
    ),
    
    # Area of the Prediction and Membership Function display
    mainPanel(
      plotOutput(outputId = "distPlot"),
      textOutput(outputId = "result_prediction"),
      uiOutput("pic")
    )
  )
)

# Shiny App Server
server <- function(input, output) {
  output$distPlot <- renderPlot({
    req(input$action)
    universe <- seq(1, 10, 0.1)
    sets_options("universe", seq(1, 10, 0.1))
    
    variables <- set(
      # Salary Membership Function
      salary = fuzzy_partition(varnames = c(low = 3, medium = 6, high = 9),
                               sd = 1),
      # Commute Time Membership Function
      commute = fuzzy_partition(varnames = c( short= 3, medium = 6, long = 8), 
                                sd = 0.6),
      # Company Size Membership Function
      size = fuzzy_partition(varnames = c(small = 3, medium = 6,
                                          large = 9), sd = 0.75),
      # Prediction Membership Function
      prediction = fuzzy_partition(varnames = c(bad = 1, acceptable = 3, ok = 5, good = 7, perfect = 9),
                                   FUN = fuzzy_cone, radius = 1.2))
    
    # Setting Fuzzy Rules based on the surveys' respond
    
    rules <- set(
      fuzzy_rule(salary %is% high && commute %is% short && size %is% large, prediction %is% perfect),
      
      fuzzy_rule(salary %is% high && commute %is% short && size %is% medium, prediction %is% perfect),
      
      fuzzy_rule(salary %is% high && commute %is% short && size %is% small, prediction %is% good),
      
      fuzzy_rule(salary %is% high && commute %is% medium && size %is% large, prediction %is% perfect),
      
      fuzzy_rule(salary %is% high && commute %is% medium && size %is% medium, prediction %is% good),
      
      fuzzy_rule(salary %is% high && commute %is% medium && size %is% small, prediction %is% good),
      
      fuzzy_rule(salary %is% high && commute %is% long && size %is% large, prediction %is% perfect),
      
      fuzzy_rule(salary %is% high && commute %is% long && size %is% medium, prediction %is% good),
      
      fuzzy_rule(salary %is% high && commute %is% long && size %is% small, prediction %is% ok),
      
      fuzzy_rule(salary %is% medium && commute %is% short && size %is% large, prediction %is% perfect),
      
      fuzzy_rule(salary %is% medium && commute %is% short && size %is% medium, prediction %is% good),
      
      fuzzy_rule(salary %is% medium && commute %is% short && size %is% small, prediction %is% ok),
      
      fuzzy_rule(salary %is% medium && commute %is% medium && size %is% large, prediction %is% ok),
      
      fuzzy_rule(salary %is% medium && commute %is% medium && size %is% medium, prediction %is% acceptable),
      
      fuzzy_rule(salary %is% medium && commute %is% medium && size %is% small, prediction %is% bad),
      
      fuzzy_rule(salary %is% medium && commute %is% long && size %is% large, prediction %is% ok),
      
      fuzzy_rule(salary %is% medium && commute %is% long && size %is% medium, prediction %is% acceptable),
      
      fuzzy_rule(salary %is% medium && commute %is% long && size %is% small, prediction %is% bad),
      
      fuzzy_rule(salary %is% low && commute %is% long && size %is% small, prediction %is% bad),
      
      fuzzy_rule(salary %is% low && commute %is% long && size %is% mediumm, prediction %is% bad),
      
      fuzzy_rule(salary %is% low && commute %is% long && size %is% large, prediction %is% acceptable),
      
      fuzzy_rule(salary %is% low && commute %is% medium && size %is% small, prediction %is% bad),
      
      fuzzy_rule(salary %is% low && commute %is% medium && size %is% mediumm, prediction %is% bad),
      
      fuzzy_rule(salary %is% low && commute %is% medium && size %is% large, prediction %is% ok),
      
      fuzzy_rule(salary %is% low && commute %is% short && size %is% small, prediction %is% bad),
      
      fuzzy_rule(salary %is% low && commute %is% short && size %is% mediumm, prediction %is% bad),
      
      fuzzy_rule(salary %is% low && commute %is% short && size %is% large, prediction %is% acceptable)
    )
    
    
    
    model <- fuzzy_system(variables, rules)
    
    

    
    #Get user input of targeted company's employee's number
    salaryUser <- as.numeric(input$salary)
    
    # Convert user's salary input to the input that FIS could processing 
    if ((salaryUser/10) > 10){
      salaryIn = 10
    }else{
      salaryIn = (salaryUser/10)}
    
    
    
    #Get user input of targeted company's employee's number                
    commuteUser <- as.numeric(input$commute)
    
    # Convert user's commute time input to the input that FIS could processing 
    if ((commuteUser/10) > 10){
      commuteIn = 10
    }else{
      commuteIn = (commuteUser/10)}
    
    
    #Get user input of targeted company's employee's number
    sizeUser <- as.numeric(input$company)
    
    # Convert user's company size input to the input that FIS could processing 
    if ((sizeUser/20) > 10){
      sizeIn = 10
    }else{
      sizeIn = (sizeUser/10)}
    
    # Initializing the FIS
    finalResult <- fuzzy_inference(model, list(salary = salaryIn, commute = commuteIn,
                                               size = sizeIn))
    
    # Getting Prediction of posibility that one student will accept the job
    gset_defuzzify(finalResult, "centroid")
    
    percentage <- round((((gset_defuzzify(finalResult, "centroid")) * 10)/100),2)
    print(percentage)
    plot(finalResult)
    
    h2(output$result_prediction <- renderText({ 
      paste("The possibily that you will take this job is ", percentage)
    }))
  })
  
  output$pic <- renderUI({
    if(input$option=="Salary"){
      tags$img(src="./SalaryMembershipFunction.png", width="70%")  
    }else if(input$option=="Commute Time"){
      tags$img(src="./CommuteTimeMembershipFunction.png", width="70%")  
    }else if(input$option=="Company Size"){
      tags$img(src="./CompanySizeembershipFunction.png", width="70%")  
    }else{
      tags$img(src="./PredictionMembershipFunction.png", width="70%")  
    }
    
  })

}

shinyApp(ui = ui, server = server)
