# Define UI for application that draws a histogram
ui <- fluidPage(
    
    # Define UI for slider demo app ----
    ui <- fluidPage(
        #table <- "responses", 
        # App title ----
        titlePanel("Locate your cluster!"),
        
        # Sidebar layout with input and output definitions ----
        sidebarLayout(
            
            # Sidebar to demonstrate various slider options ----
            sidebarPanel(
                

                # Input: Commitment 1 ----
                sliderInput("commit1", "The cluster members did everything in their power to reliably deliver their contributions to the achievement of the common cluster objectives.",
                            min = 1, max = 5,
                            value = 3),
                
                # Input: Agreeableness ----
                sliderInput("commun1", "The communication at cluster level was comprehensive.",
                            min = 1, max = 5,
                            value = 3),
                
                # Input: Conscientiousness 1 ----
                sliderInput("relation1", "There was fair interaction between the cluster members at cluster level.",
                            min = 1, max = 5,
                            value = 3),
                
                # Input: fair1  ----
                sliderInput("fair1", "The costs and benefits of cluster work were shared fairly between the members.",
                            min = 1, max = 5,
                            value = 3),
                
                
                # Input: Openess 1 ----
                sliderInput("diff1", "The cluster members were willing to see different points of view.",
                            min = 1, max = 5,
                            value = 3),
                
                # Input: Extraversion 2 ----
                sliderInput("commit2", "The cluster members collaborated towards the achievement of the common research objectives, also beyond the boundaries of sub-projects.",
                            min = 1, max = 5,
                            value = 3),
                
                # Input: Agreeable 2 ----
                sliderInput("commun2", " The cluster members participated actively in communication within the cluster.",
                            min = 1, max = 5,
                            value = 3),
                
                # Input: Conscientiousness 2 ----
                sliderInput("relation2", "The collaboration at cluster level was characterized by mutual trust.",
                            min = 1, max = 5,
                            value = 3),
                
                # Input: Neuroticissm 2 ----
                sliderInput("fair2", "The contributions made by the cluster members towards the achievement of the common research objectives were appropriately recognized at the cluster level.",
                            min = 1, max = 5,
                            value = 3),
                
                # Input: Openess 2 ----
                sliderInput("diff2", "The cluster members made their own viewpoint understandable to the other cluster members.",
                            min = 1, max = 5,
                            value = 3),
                
                
                actionButton("submit", "Submit"),
                
                tags$div(style = "margin-bottom: 20px;"),
                
                
                p("Should you encounter any problems, dysfunctions, or bugs, please report them", 
                  tags$a(href = "https://github.com/maltehueckstaedt/Shiny_DEKiF/issues", "here"), "."),
                
            ),
            
            
            
            # Main panel for displaying outputs ----
           
             mainPanel(
                tags$head(tags$style("#shiny-modal img { max-width: 100%; }")), #Zwingt Abbildung im Popup nicht größer das Popupfenster selbst zu sein
                
                
                modalDialog(
                  title = tags$h1(
                    style = "display: flex; align-items: center; justify-content: space-between;",
                    "Welcome!", HTML('<img src="https://i.ibb.co/bgXRLfj/logo-dekif.png" alt="Logo" style="height: 100px; margin-right: 10px;">')), 
                  
                  p("With the ShinyApp \"Locate Your Cluster\" you can assess the functionality of your research collaboration across five dimensions (Difference, Relationship, Commitment, Communication, Fairness) and compare your team with other research clusters. The reference point for your data is the information provided by approximately 5000 PIs and spokespersons of DFG research collaborations. Enjoy!"),
                  p("Should you encounter any problems, dysfunctions, or bugs, please report them", 
                    tags$a(href = "https://github.com/maltehueckstaedt/Shiny_DEKiF/issues", "here"), "."),
                  
                  
                    p("Have fun!"),
                    size = "m",
                    easyClose = T,
                    footer = modalButton("OK")
                ),
                
                
                # Output: Table summarizing the values entered ----
                tableOutput("values"),
                plotOutput("com"),
                textOutput("he"),
                textOutput("le"),
                plotOutput("pc"),
                textOutput("hc"),
                textOutput("lc"),
                plotOutput("diff"),
                textOutput("ho"),
                textOutput("lo"),
                plotOutput("commu"),
                textOutput("ha"),
                textOutput("la"),
                plotOutput("fair"),
                textOutput("hn"),
                textOutput("ln")
            ))
    )
    
    
)