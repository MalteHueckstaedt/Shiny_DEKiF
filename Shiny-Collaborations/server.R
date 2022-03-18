#////////////////////////////////////////////////////////////////
#////////////////////////////////////////////////////////////////
#////////////////////////////////////////////////////////////////
#///////////////////////////  PRELUDE  //////////////////////////
#////////////////////////////////////////////////////////////////
#////////////////////////////////////////////////////////////////
#////////////////////////////////////////////////////////////////

library(googlesheets4)
library(data.table)
library(ggplot2)

#make a normal distribution to graph
set.seed(3000)
xseq<-seq(1,7,.01)
densities <-dnorm(xseq, 4,1)

# Authorize googlesheets4
gs4_auth(cache = ".secrets")

dt <- readRDS("data/dt.rds")

#////////////////////////////////////////////////////////////////
#////////////////////////////////////////////////////////////////
#////////////////////////////////////////////////////////////////
#///////////////////////////  SERVER  ///////////////////////////
#////////////////////////////////////////////////////////////////
#////////////////////////////////////////////////////////////////
#////////////////////////////////////////////////////////////////

server <- function(input, output, session) {
    # Reactive expression to create data frame of all input values ----
    sliderValues <- reactive({
        data.frame(
            dimension = c("Difference",
                     "Relationship",
                     "Commitment",
                     "Communication",
                     "Fairness"),
            "your score" = as.character(c((input$diff1 + (input$diff2)),
                                   
                                   (input$relation1 + (input$relation2)),
                                   
                                   (input$commit1 + (input$commit2)),
                                   
                                   (input$commun2 + (input$commun1)),
                                   
                                   (input$fair1 + (input$fair2)))),
            "nightmare score" = c("2","2","2","2","2"),
            "dream score" = c("10","10","10","10","10"),
            
            stringsAsFactors = FALSE,
            check.names = FALSE)
        
        
    })
    # Show the values in an HTML table, only after they press submit
    observeEvent(input$submit, {
        output$values <- renderTable({
            sliderValues()
        })
        
        output$com <- renderPlot({
            ggplot(dt, aes(x=commitment)) + 
                geom_density(alpha=.2, fill="#5889c5", bw=0.5)+
                geom_vline(xintercept = input$commit1+input$commit2, color="#000000")+ 
                annotate("text", x = input$commit1+input$commit2, y = 0.1, label = "Your Score", 
                         vjust = 1.5,angle = 90, color="#000000")+
                theme(axis.text.y=element_blank(), 
                      axis.title.y=element_blank(),
                      axis.ticks.y = element_blank())+ ggtitle("Commitment: \n How does your score compare to others?")+theme(
                          plot.title = element_text(color="black", size=14, face="bold"))+
                theme(plot.title = element_text(hjust = 0.5))+
                labs(x ="Scores")+xlim(2, 10)
        })
        

        output$he <- renderText({
            'High: The PIs are committed to the goals of the cluster and work together across sub-projects to achieve them. They are reliably engaged at the cluster level and do their best to reliably deliver their contributions.'
        })
        
        output$le <- renderText({
            'Low: PIs feel more committed to the goals of their sub-projects than to those of the cluster and avoid cross-sub-project cooperation.
          
          '
        })
        
        
        output$pc <- renderPlot({
            ggplot(dt, aes(x=relationship)) + 
                geom_density(alpha=.2, fill="#5889c5", bw=0.5)+
                geom_vline(xintercept = input$relation1+input$relation2, color="#000000")+ 
                annotate("text", x = input$relation1+input$relation2, y = 0.1, label = "Your Score", 
                         vjust = 1.5,angle = 90, color="#000000")+
                theme(axis.text.y=element_blank(), 
                      axis.title.y=element_blank(),
                      axis.ticks.y = element_blank())+ ggtitle("Relationship: \n How does your score compare to others?")+theme(
                          plot.title = element_text(color="black", size=14, face="bold"))+
                theme(plot.title = element_text(hjust = 0.5))+
                labs(x ="Scores")+xlim(2, 10)
        })
        output$hc <- renderText({
            'High: The collaboration at the cluster level is characterised by a group feeling and mutual trust.'
        })
        output$lc <- renderText({
            'Low: The cluster is a loose coalition of sub-projects whose PIs neither feel connected by a group feeling nor have been able to build up mutual trust.'
        })
        
        
        
        output$diff <- renderPlot({
            ggplot(dt, aes(x=difference)) + 
                geom_density(alpha=.2, fill="#5889c5", bw=0.5)+
                geom_vline(xintercept = input$diff1+input$diff2, color="#000000")+ 
                annotate("text", x = input$diff1+input$diff2, y = 0.1, label = "Your Score", 
                         vjust = 1.5,angle = 90, color="#000000")+
                theme(axis.text.y=element_blank(), 
                      axis.title.y=element_blank(),
                      axis.ticks.y = element_blank())+ ggtitle("Difference: \n How does your score compare to others?")+theme(
                          plot.title = element_text(color="black", size=14, face="bold"))+
                theme(plot.title = element_text(hjust = 0.5))+
                labs(x ="Scores")+xlim(2, 10)
        })
        output$ho <- renderText({
            'High: The PIs of the cluster are able to overcome (disciplinary) differences and to communicate with each other.'
        })
        
        output$lo <- renderText({
            'Low: The PIs of the cluster are not able to communicate with each other and thus overcome (disciplinary) differences.'
        })
        
        
        
        output$commu <- renderPlot({
            ggplot(dt, aes(x=communication)) + 
                geom_density(alpha=.2, fill="#5889c5", bw=0.5)+
                geom_vline(xintercept = input$commun1+input$commun2, color="#000000")+ 
                annotate("text", x = input$commun1+input$commun2, y = 0.1, label = "Your Score", 
                         vjust = 1.5,angle = 90, color="#000000")+
                theme(axis.text.y=element_blank(), 
                      axis.title.y=element_blank(),
                      axis.ticks.y = element_blank())+ ggtitle("Communication: \n How does your score compare to others?")+theme(
                          plot.title = element_text(color="black", size=14, face="bold"))+
                theme(plot.title = element_text(hjust = 0.5))+
                labs(x ="Scores")
        })
        
        output$ha <- renderText({
            'High: All PIs participate exhaustively in communication at the cluster level. The circulation of information is comprehensive.'
        })
   
        output$la <- renderText({
            'Low: The participation of PIs in communication at the cluster level is fragmentary and the circulation of information cannot be adequately ensured.'
        })
        
        
        output$fair <- renderPlot({
            ggplot(dt, aes(x=fairness)) + 
                geom_density(alpha=.2, fill="#5889c5", bw=0.5)+
                geom_vline(xintercept = input$fair1+input$fair2, color="#000000")+ 
                annotate("text", x = input$fair1+input$fair2, y = 0.1, label = "Your Score", 
                         vjust = 1.5,angle = 90, color="#000000")+
                theme(axis.text.y=element_blank(), 
                      axis.title.y=element_blank(),
                      axis.ticks.y = element_blank())+ ggtitle("Fairness: \n How does your score compare to others?")+theme(
                          plot.title = element_text(color="black", size=14, face="bold"))+
                theme(plot.title = element_text(hjust = 0.5))+
                labs(x ="Scores")+xlim(2, 10)
        })
        output$hn <- renderText({
            'High: Effort and income gained by the collaboration at the cluster level are balanced. The contributions made by the PIs are appropriately rewarded.'
        })
        output$ln <- renderText({
            "Low: Effort and return of collaboration at the cluster level are unfairly distributed. The contributions that PIs make to achieve the common goals are not adequately recognised."
        })
    })
    #store the results
    
    formData <- reactive(c(
        input$diff1, input$diff2, input$relation1, input$relation2, input$commit1, input$commit2, input$commun1, input$commun2, input$fair1, input$fair2,input$commitment, Sys.time()
    ))
    
    
    
    to_be_done_at_submit <- observeEvent(input$submit, {
        #Collect data
        dtData <- data.table(
          commit1 <- input$commit1,
          commun1 <- input$commun1,
          relation1 <- input$relation1,
          
          fair1 <- input$fair1,
          diff1 <- input$diff1,
          commit2 <- input$commit2,
          
          commun2 <- input$commun2,
          relation2 <- input$relation2,
          fair2 <- input$fair2,
          diff2 <- input$diff2
        )
        
        #Put data on drive
        sheet_append(ss = "1Glv5vjkB1VipxVxeyOsVzIHj9RO_K7arpqIJ7CddORA",
                     data = dtData,
                     sheet = 1)
        
    })
    
    # Results <- reactive(c(
    #   input$diff1, input$diff2, input$relation1, input$relation2, input$commit1, input$commit2, input$commun1, input$commun2, input$fair1, input$fair2,input$commitment, Sys.time()
    # ))
    # 
    # 
    # 
    # #This will add the new row at the bottom of the dataset in Google Sheets.
    # observeEvent(input$submit, {
    #   MySheet <-   gs4_get('https://docs.google.com/spreadsheets/d/1Glv5vjkB1VipxVxeyOsVzIHj9RO_K7arpqIJ7CddORA/edit#gid=760098930')
    #   sheet_append(MySheet , data = as.data.frame(t(Results())))
    #   # Data  <- Data  %>%
    #   #   sheet_append(ss = "1yrJGzVmumFqJDbIjqXzgo9rnDPMx7aE2uqc5lVGkDn0",
    #   #              data = Results,
    #   #              sheet=1)
    # }
    # )
    
    #   
}