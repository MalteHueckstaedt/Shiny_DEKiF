#load libraries
library(shiny)
library(shinydashboard)
library(googlesheets4)
library(DT)

# setwd("/Users/maltehueckstaedt/Documents/Dokumente/GitHub/AP6/dekif_evaluation")


#make a normal distribution to graph
set.seed(3000)
xseq<-seq(1,7,.01)
densities <-dnorm(xseq, 4,1)



# Define UI for application that draws a histogram
ui <- fluidPage(
  
  # Define UI for slider demo app ----
  ui <- fluidPage(
    table <- "responses", 
    # App title ----
    titlePanel("Collaboration"),
    
    # Sidebar layout with input and output definitions ----
    sidebarLayout(
      
      # Sidebar to demonstrate various slider options ----
      sidebarPanel(
        
        # Input: Extraversion 1 ----
        sliderInput("extra1", "I see myself as someone who is extraverted, enthusiastic.",
                    min = 1, max = 5,
                    value = 3),
        
        # Input: Agreeableness ----
        sliderInput("agree1", "I see myself as someone who is critical, quarrelsome.",
                    min = 1, max = 7,
                    value = 1),
        
        # Input: Conscientiousness 1 ----
        sliderInput("consc1", "I see myself as someone who is dependable, self-disciplined.",
                    min = 1, max = 7,
                    value = 1),
        
        # Input: Neuroticism 1 ----
        sliderInput("neur1", "I see myself as someone who is anxious, easily upset.",
                    min = 1, max = 7,
                    value = 1),
        
        
        # Input: Openess 1 ----
        sliderInput("open1", "I see myself as someone who is open to new experiences, complex.",
                    min = 1, max = 7,
                    value = 1),
        
        # Input: Extraversion 2 ----
        sliderInput("extra2", "I see myself as someone who is reserved, quiet.",
                    min = 1, max = 7,
                    value = 1),
        
        # Input: Agreeable 2 ----
        sliderInput("agree2", "I see myself as someone who is sympathetic, warm.",
                    min = 1, max = 7,
                    value = 1),
        
        # Input: Conscientiousness 2 ----
        sliderInput("consc2", "I see myself as someone who is disorganized, careless",
                    min = 1, max = 7,
                    value = 1),
        
        # Input: Neuroticissm 2 ----
        sliderInput("neur2", "I see myself as someone who is calm, emotionally stable.",
                    min = 1, max = 7,
                    value = 1),
        
        # Input: Openess 2 ----
        sliderInput("open2", "I see myself as someone who is conventional, uncreative.",
                    min = 1, max = 7,
                    value = 1),
        
        # Input: Commitment ----
        sliderInput("commitment", "I see mysfd uncreative.",
                    min = 1, max = 7,
                    value = 1),
        
        actionButton("submit", "Submit")
        
      ),
      
      # Main panel for displaying outputs ----
      mainPanel(
        
        # Output: Table summarizing the values entered ----
        tableOutput("values"),
        plotOutput("pe"),
        textOutput("he"),
        textOutput("le"),
        plotOutput("pc"),
        textOutput("hc"),
        textOutput("lc"),
        plotOutput("po"),
        textOutput("ho"),
        textOutput("lo"),
        plotOutput("pa"),
        textOutput("ha"),
        textOutput("la"),
        plotOutput("pn"),
        textOutput("hn"),
        textOutput("ln")
      ))
  )
  
  
)