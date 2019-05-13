# create the dataset from the csv file.
setwd("C:/Users/agupta8/Desktop/") # set your working directory

#getwd() - test

Source_folder <- "C:/Users/agupta8/Desktop/"
Source_File <- "kdnuggets_1.csv"
File_1 <- "kdnuggets.csv"
File_2 <- "language.csv"
File_3 <- "deeplearning.csv"
File_4 <- "BigData.csv"

Source_location <- paste(Source_folder,Source_File, sep="")
Source_1 <- paste(Source_folder,File_1, sep="")
Source_2 <- paste(Source_folder,File_2, sep="")
Source_3 <- paste(Source_folder,File_3, sep="")
Source_4 <- paste(Source_folder,File_4, sep="")

# read the file in df variable
df <- read.csv(Source_location)

primary <- df[1:98,]

language <- df[99:110,]

deeplearning <- df[111:123,]

BigData <- df[124:134,]

##############################normal ggplots#############################
library(ggplot2)

library(plotly)

set.seed(100)

write.csv(primary, file = Source_location,row.names=FALSE, na="")
write.csv(language, file = Source_2,row.names=FALSE, na="")
write.csv(deeplearning, file = Source_3,row.names=FALSE, na="")
write.csv(BigData, file = Source_4,row.names=FALSE, na="")


primary = read.csv(Source_1)
language = read.csv(Source_2)
deeplearning = read.csv(Source_3)
BigData = read.csv(Source_4)


primary$Language...Tool <- factor(primary$Language...Tool, levels = unique(primary$Language...Tool)[order(primary$Votes, decreasing = FALSE)])

Bar_graph_primary <- plot_ly(primary, y = ~primary$Language...Tool, x = ~primary$Votes, name = 'Language Distribution', type = 'bar',orientation = 'h') %>%

  layout(title = 'Distribution of votes w.r.t Languages used', xaxis = list(title = ""), yaxis = list(title = ""), barmode = 'group')

Bar_graph_primary

# 2 . Most popular Data Science Language

language$Language...Tool <- factor(language$Language...Tool, levels = unique(language$Language...Tool)[order(language$Votes, decreasing = FALSE)])

p <- plot_ly(language, y = ~language$Language...Tool, x = ~language$Votes, type = 'bar', orientation = 'h',
             marker = list(color = c('rgba(222,45,38,0.8)','rgba(204,204,204,1)', 'rgba(204,204,204,1)',
                                     'rgba(204,204,204,1)', 'rgba(204,204,204,1)','rgba(204,204,204,1)',
                                     'rgba(204,204,204,1)', 'rgba(204,204,204,1)','rgba(204,204,204,1)',
                                     'rgba(204,204,204,1)', 'rgba(204,204,204,1)','rgba(204,204,204,1)'))) %>%
  
  add_text(text=~language$Votes, hoverinfo='none', textposition = 'right', showlegend = FALSE,
           textfont=list(size=12, color="black")) %>%
  layout(title = "Most Popular Language - KD Nuggets Survey 2019",
         xaxis = list(title = ""),
         yaxis = list(title = ""))

p

# 3 . Most popular Deep Learning Framework
deeplearning$Language...Tool <- factor(deeplearning$Language...Tool, levels = unique(deeplearning$Language...Tool)[order(deeplearning$Votes, decreasing = FALSE)])

p <- plot_ly(deeplearning, y = ~deeplearning$Language...Tool, x = ~deeplearning$Votes, type = 'bar', orientation = 'h',
             marker = list(color = c('rgba(222,45,38,0.8)',
                                     'rgba(204,204,204,1)','rgba(204,204,204,1)','rgba(204,204,204,1)',
                                     'rgba(204,204,204,1)','rgba(204,204,204,1)','rgba(204,204,204,1)',
                                     'rgba(204,204,204,1)','rgba(204,204,204,1)','rgba(204,204,204,1)',
                                     'rgba(204,204,204,1)','rgba(204,204,204,1)','rgba(204,204,204,1)'))) %>%
  add_text(text=~deeplearning$Votes, hoverinfo='none', textposition = 'right', showlegend = FALSE,
           textfont=list(size=12, color="black")) %>%
  layout(title = "Most popular Deep Learning Framework - KD Nuggets Survey 2019",
         xaxis = list(title = ""),
         yaxis = list(title = ""))


p

# 4 . Most popular Big Data Tools and Techniques

BigData$Language...Tool <- factor(BigData$Language...Tool, levels = unique(BigData$Language...Tool)[order(BigData$Votes, decreasing = FALSE)])

p <- plot_ly(BigData, y = ~BigData$Language...Tool, x = ~BigData$Votes, type = 'bar', orientation = 'h',
             marker = list(color = c('rgba(222,45,38,0.8)',
                                     'rgba(204,204,204,1)','rgba(204,204,204,1)','rgba(204,204,204,1)',
                                     'rgba(204,204,204,1)','rgba(204,204,204,1)','rgba(204,204,204,1)',
                                     'rgba(204,204,204,1)','rgba(204,204,204,1)','rgba(204,204,204,1)',
                                     'rgba(204,204,204,1)'))) %>%
  add_text(text=~BigData$Votes, hoverinfo='none', textposition = 'right', showlegend = FALSE,
           textfont=list(size=12, color="black")) %>%
  layout(title = "Most popular Big Data Tools - KD Nuggets Survey 2019",
         xaxis = list(title = ""),
         yaxis = list(title = ""))

p

