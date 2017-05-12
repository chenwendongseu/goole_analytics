###############################
### Google Analytics - ui.R ###
###############################

library(shiny) 

shinyUI(pageWithSidebar( 
  
  headerPanel("Google Analytics"), 
  
  sidebarPanel( 
    
    dateRangeInput(inputId = "dateRange",  
                   label = "Date range", 
                   start = "2013-04-18",
                   max = "2013-08-05"
    ),
    
    sliderInput(inputId = "minimumTime",
                label = "Hours of interest- minimum",
                min = 0,
                max = 23,
                value = 0,
                step = 1),
    
    sliderInput(inputId = "maximumTime",
                label = "Hours of interest- maximum",
                min = 0,
                max = 23,
                value = 23,
                step = 1),
    
    checkboxInput(inputId = "smoother",
                  label = "添加平滑?",
                  value = FALSE),
    
    checkboxGroupInput(inputId = "domainShow",
                       label = "Show NHS and other domain (defaults to all)?",
                       choices = list("世界卫生组织" = "NHS",
                                      "其他" = "Other")
    ),
    
    radioButtons(inputId = "outputType",
                 label = "输出要求",
                 choices = list("浏览人数" = "visitors",
                                "反弹率" = "bounceRate",
                                "浏览时间" = "timeOnSite"))
  ),
  mainPanel(
    tabsetPanel( 
      tabPanel("Summary", textOutput("textDisplay")), 
      tabPanel("Monthly figures", plotOutput("monthGraph")),
      tabPanel("Hourly figures", plotOutput("hourGraph"))
    )
  )
))
