#Profiling the data

MyFile <-"Bowler_data.csv"
MyData <- read.csv(file=MyFile, header=TRUE, sep=",")
options(max.print = 12000) 
print(dim(MyData))                         #Excluding the header names of columns - 11118 14 

#Data Cleaning
#Replacing '-' with values with respective to the columns

library(car)           
#This library helps to replace the content element of csv file with required element
#We can use recode function for the changes

MyData$Overs <- recode(MyData$Overs,"c('-')='0'")  
MyData$Mdns <- recode(MyData$Mdns,"c('-')='0'")
MyData$Wkts <- recode(MyData$Wkts,"c('-')='0'")
MyData$SR <- recode(MyData$SR,"c('-')='0'")
MyData$Runs <- recode(MyData$Runs,"c('-')='0'")
MyData$Ave <- recode(MyData$Ave,"c('-')='0.00'")
MyData$Econ <- recode(MyData$Econ,"c('-')='0.00'")

#Make all the changes and store the cleaned dataset in new .csv file
write.csv(MyData, file = "Bowlerdata_cleaned.csv")

#Check if dataset has the above changes
print(head(MyData))

Data<-read.csv("Bowlerdata_cleaned.csv")
library(plyr)
#The plyr library has an inbuilt function called arrange which helps to sort
#the dataset in which ever order required(sorting based on variable specified).
# Sort by Overs
df <- Data
df_sorted <- arrange(df, Overs)
#check if the data has been sorted
head(df_sorted)
write.csv(df_sorted, file = "Bowlerdata_cleaned_sorted.csv")

#Data Visualization

 library(ggplot2)
# 
# a<-ggplot(df_sorted,aes(x=Overs,y=Runs))
# print(a+geom_point()+geom_smooth(method="loess",se=F))
# 
# a<-ggplot(df_sorted,aes(x=Overs,y=Runs))
# print(a+geom_col()+geom_smooth(method="loess",se=F))
# 
#b<-ggplot(df_sorted,aes(x=Overs,y=Wkts))
#print(b+geom_point()+geom_smooth(method="loess",se=F))
# 
# b<-ggplot(df_sorted,aes(x=Overs,y=Wkts))
# print(b+geom_col()+geom_smooth(method="loess",se=F))
# 
# c<-ggplot(df_sorted,aes(x=Overs,y=Mdns))
# print(c+geom_point()+geom_smooth(method="loess",se=T))
# output for lines 57
# Warning messages:
# 1: Removed 1 rows containing non-finite values (stat_smooth). 
# 2: Removed 1 rows containing missing values (geom_point). 

# c<-ggplot(df_sorted,aes(x=Overs,y=Mdns))
# print(c+geom_col()+geom_smooth(method="loess",se=T))
# output for lines 64
# Warning messages:
# 1: Removed 1 rows containing non-finite values (stat_smooth). 
# 2: Removed 1 rows containing missing values (position_stack). 

# d<-ggplot(df_sorted,aes(x=Overs,y=Econ))
# print(d+geom_point()+geom_smooth(method="loess",se=T))
# 
# d<-ggplot(df_sorted,aes(x=Overs,y=Econ))
# print(d+geom_col()+geom_smooth(method="loess",se=T))
#-----------
# e<-ggplot(df_sorted,aes(x=Bowler,y=Econ))
# print(e+geom_point()+geom_smooth(method="loess",se=F)+theme(axis.text.x = element_text(angle = 90, hjust = 1)))
#-----------
#e<-ggplot(df_sorted,aes(x=Bowler,y=Econ))
#print(e+geom_boxplot()+geom_smooth(method="loess",se=T))
#-----------
# f<-ggplot(df_sorted,aes(x=Overs,y=Ave))
# print(f+geom_point()+geom_smooth(method="loess",se=F))
# 
# f<-ggplot(df_sorted,aes(x=Overs,y=Ave))
# print(f+geom_col()+geom_smooth(method="loess",se=F))
# 
# bowlers = df_sorted[apply(df_sorted[c(3)],1,function(z) any(z!=0)),]
# write.csv(bowlers,file = 'only_bowlers.csv')
# head(bowlers)
# 
# e<-ggplot(bowlers,aes(x=Bowler,y=Econ))
# print(e+geom_point()+geom_smooth(method="loess",se=F)+theme(axis.text.x = element_text(angle = 90, hjust = 1)))
# 
# g<-ggplot(bowlers,aes(x=Ground,y=Ave))
# print(g+geom_boxplot()+geom_smooth(method="loess",se=F)+theme(axis.text.x = element_text(angle = 90, hjust = 1)))

#Bar Chart - simple method 
# barplot(table(df_sorted$Overs))
# barplot(table(df_sorted$Overs), xlab = "Number of Overs", 
#         ylab = "Frequency", main = "Bowler's Dataset", col = "lightblue", border = "black")
# barplot(table(df_sorted$Bowler), xlab = "Bowler Name", ylab = "Frequency", main = "Bowler's Dataset", 
#         col = "lightblue", border = "black", space = 1)

#Scatterplot - Simple Method 
#plot(Runs ~ Overs, data = df_sorted, main = "Bowler's dataset")

# bowlers_5 = subset(bowlers,Wkts>=5)
# write.csv(bowlers_5,file = 'bowlers_5_wkts.csv')
# head(bowlers_5)
# 
# h<-ggplot(bowlers_5,aes(x=Bowler,y=Opposition))
# print(h+geom_point(method="loess",se=F)+theme(axis.text.x = element_text(angle = 90, hjust = 1)))
# 
# i<-ggplot(bowlers,aes(x=Opposition,y=Wkts))
# print(i+geom_point()+geom_smooth(method="loess",se=F)+theme(axis.text.x = element_text(angle = 90, hjust = 1)))
# 
# j<-ggplot(bowlers,aes(x=Runs,y=Wkts))
# print(j+geom_boxplot()+geom_smooth(method="loess",se=F))
# 
# k<-ggplot(bowlers,aes(x=Bowler,y=Wkts))
# print(k+geom_point()+geom_smooth(method="loess",se=F)+theme(axis.text.x = element_text(angle = 90, hjust = 1)))


#print(cor(df_sorted$Overs, df_sorted$Econ))
#print(cor(df_sorted$Overs, df_sorted$Ave))
#print(cor(df_sorted$Overs, df_sorted$Runs))
print(cor(df_sorted$Overs, df_sorted$Ave)) #The model will be built for this dataset
#print(cor(df_sorted$Overs, df_sorted$SR))
# set.seed(12000)
linearMod<-lm(df_sorted$Overs~df_sorted$Ave, data=df_sorted)
print(linearMod)
print(summary(linearMod))

