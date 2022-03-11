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
                sliderInput("commit2", "The cluster members collaborated towards the achievement of the common research objectives, also beyond the boundaries of sub-projects.",
                            min = 1, max = 5,
                            value = 3),
                
                # Input: Agreeable 2 ----
                sliderInput("commun2", " The cluster members participated actively in communication within the cluster.",
                            min = 1, max = 5,
                            value = 3),
                
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
                sliderInput("commit3", "The cluster members were committed to the common objectives of the cluster.",
                            min = 1, max = 7,
                            value = 1),
                
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
                plotOutput("po"),
                textOutput("ho"),
                textOutput("lo"),
                plotOutput("commu"),
                textOutput("ha"),
                textOutput("la"),
                plotOutput("pn"),
                textOutput("hn"),
                textOutput("ln")
            ))
    )
    
    
)