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
            'High: Die PIs fühlen sich den Zielen des Clusters verbunden und arbeiten für die Ereichung teilprojektübergreifend zusammen. Sie engagieren sich zuverlässig auf der Cluster Ebene und tun alles, im ihre Beiträge zuverlässig zu liefern'
        })
        
        output$le <- renderText({
            'Low: Die PIs fühlen sich den Zielen ihrer Teilprojekte mehr verpflichtet als denen des Cluster und vermeiden die teilprojektübergreifende Zusammenarbeit'
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
            'High: Die Zusammenarbeit auf der Clusterebene ist durch eine Wir-Gefühl und wechselseitiges Vertrauen geprägt'
        })
        output$lc <- renderText({
            'Low: Das Cluster ist eine lose Koaliation von Teilprojekten, deren PIs sich weder durch ein Wir-Gefühl verbunden fühlen noch sich ein wechselseitges Vertrauen aufbauen konnten'
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
            'High: Die PIs des Cluster sind in der Lage, fachliche Differenzen zu überbrücken und sich wechseleitig (ggf. auch disziplinübergreifend) zu verständigen'
        })
        
        output$lo <- renderText({
            'Low: Die PIs des Cluster sind nicht in der Lage, sich wechselseitg zu verständigen und so (disziplinäre) Differenzen zu überbrücken'
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
            'High: An der Kommunikation auf der Verundebene beteiligen sich alle PIs erschöpfend. Die Informationszirkulation erfolgt umfassend'
        })
   
        output$la <- renderText({
            'Low: An der Kommunikation auf der Verundebene beteiligen sich nicht alle PIs in erschöpfendder Weise. Die Informationszirkulation gerät in der Folge ins stocken'
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
            'High: Aufwand und Ertrag der der Kooperation auf der Verbundeben sind reziprok. Die von den PIs geleisteten Beiträge werden angemessen honoriert'
        })
        output$ln <- renderText({
            "Low: Aufwand und Ertrag der Koopertation auf der Verbundebene sind unfair verteilt. Die Beiträge, die die PIs zur Erreichung der gemeinsamen Ziele besteuern, werden nicht angemessen anerkannt"
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