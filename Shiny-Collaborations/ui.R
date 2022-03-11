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
                
                # Input: Neuroticism 1 ----
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
                
                
                actionButton("submit", "Submit")
                
            ),
            
            # Main panel for displaying outputs ----
            mainPanel(
                
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