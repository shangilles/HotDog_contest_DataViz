
# Library to read the Excel document
library("readxl")
# For plots
library("dplyr")
library("ggplot2")
library("reshape2")


obama <- read_excel("D://Shan/Viz/Data/obama-approval-ratings.xls")
View(obama)
str(obama)

# Barplot


ggplot(obama, aes(y=Approve, x=Issue)) + 
  geom_bar(position="dodge", stat="identity", color = "black", fill = "red") +
  labs(title = "Approval of President Obama's Position by Issue", x = "", y = "") + coord_flip()



# Stacked bar plot

# In order to make the stacked chart, I had to melt the dataset into a long form so that the variables could be grouped together.
melted <- melt(obama, "Issue")

print(melted)


ggplot(melted, aes(x = Issue, y = value))+
  geom_col(aes(fill = variable), width = 0.7) + 
  labs(title = "Approval of President Obama's Position by Issue", y = "# of Respondents", x = "") + coord_flip()




# Pie chart
ggplot(obama, aes(x="", y=Approve, fill=Issue)) +
  geom_bar(stat="identity", width=1) +
  coord_polar("y", start=0) +
  labs(title = "Approval of President Obama's Position by Issue", x = "", y = "")



# Donut chart

ggplot(obama, aes(x = 2, y = Approve, fill = Issue)) +
  geom_bar(stat = "identity", color = "white") +
  coord_polar(theta = "y", start = 0)+
  xlim(0.5, 2.5) + labs(title = "Approval of President Obama's Position by Issue", x = "", y = "")


