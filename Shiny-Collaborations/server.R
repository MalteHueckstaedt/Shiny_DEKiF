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
            Name = c("Openness",
                     "Conscientiousness",
                     "Commitment",
                     "Agreeableness",
                     "Neuroticism"),
            Value = as.character(c((input$open1 + (8-input$open2))/2,
                                   
                                   (input$consc1 + (8 - input$consc2))/2,
                                   
                                   (input$commit1 + (input$commit2)),
                                   
                                   (input$commun2 + (input$commun1)),
                                   
                                   (input$neur1 + (8 - input$neur2))/2)),
            
            stringsAsFactors = FALSE)
        
        
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
                labs(x ="Scores")
        })
        

        output$he <- renderText({
            'High: Commitment...'
        })
        
        output$le <- renderText({
            'Low: Commitment...'
        })
        output$pc <- renderPlot({
            plot(xseq, densities, type = "l", lwd = 2, main = "Conscientiousness: \n How does your score compare to others?",  xlab = "Scores", yaxt='n', ylab = "")
            abline(v=((input$consc1 + (8 - input$consc1))/2), col="blue")
            text(((input$consc1 + (8 - input$consc1))/2), 0.1, "Your Score", col = "red") 
        })
        output$hc <- renderText({
            'High: People that have a high degree of conscientiousness are reliable and prompt. Traits include being organized, methodic, and thorough. A person scoring high in conscientiousness usually has a high level of self-discipline. These individuals prefer to follow a plan, rather than act spontaneously. Their methodic planning and perseverance usually makes them highly successful in their chosen occupation.'
        })
        output$lc <- renderText({
            'Low: People who score low on conscientiousness tend to be laid back, less goal-oriented, and less driven by success.'
        })
        output$po <- renderPlot({
            plot(xseq, densities, type = "l", lwd = 2, main = "Openness to Experience: \n How does your score compare to others?",  xlab = "Scores", yaxt='n', ylab = "")
            abline(v=((input$open1 + (8-input$open2))/2), col="blue")
            text(((input$open1 + (8-input$open2))/2), 0.1, "Your Score", col = "red") 
        })
        output$ho <- renderText({
            'High: People who like to learn new things and enjoy new experiences usually score high in openness. Openness includes traits like being insightful and imaginative and having a wide variety of interests.'
        })
        
        output$lo <- renderText({
            'Low: People who score low on openness tend to be conventional and traditional in their outlook and behavior. They prefer familiar routines to new experiences, and generally have a narrower range of interests.'
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
            'High: Communication'
        })
   
        output$la <- renderText({
            'Low: Communication'
        })
        output$pn <- renderPlot({
            plot(xseq, densities, type = "l", lwd = 2, main = "Neuroticism: \n How does your score compare to others?",  xlab = "Scores", yaxt='n', ylab = "")
            abline(v=((input$neur1 + (8 - input$neur2))/2), col="blue")
            text(( (input$neur1 + (8 - input$neur2))/2), 0.1, "Your Score", col = "red") 
        })
        output$hn <- renderText({
            'High: This dimension relates to one’s emotional stability and degree of negative emotions. People that score high on neuroticism often experience emotional instability and negative emotions. Traits include being moody and tense. A person who is high in neuroticism has a tendency to easily experience negative emotions.'
        })
        output$ln <- renderText({
            "Low: On the other end of the section, people who score low in neuroticism experience more emotional stability. Emotional stability refers to a person's ability to remain stable and balanced. They tend to experience negative emotions less easily and handle stress well."
        })
    })
    #store the results
    
    formData <- reactive(c(
        input$open1, input$open2, input$consc1, input$consc2, input$commit1, input$commit2, input$commun1, input$commun2, input$neur1, input$neur2,input$commitment, Sys.time()
    ))
    
    
    
    to_be_done_at_submit <- observeEvent(input$submit, {
        #Collect data
        dtData <- data.table(
            open1 <- input$open1,
            open2 <- input$open2
        )
        
        #Put data on drive
        sheet_append(ss = "1Glv5vjkB1VipxVxeyOsVzIHj9RO_K7arpqIJ7CddORA",
                     data = dtData,
                     sheet = 1)
        
    })
    
    # Results <- reactive(c(
    #   input$open1, input$open2, input$consc1, input$consc2, input$commit1, input$commit2, input$commun1, input$commun2, input$neur1, input$neur2,input$commitment, Sys.time()
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