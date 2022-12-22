#1)
#a
data_frame <- data.frame(Respondents= (1:20), 
              Sex= c(2, 2, 1, 2, 2, 2, 2, 2, 2, 2, 1, 2, 2, 2, 2, 2, 2, 2, 1, 2), 
              Fathers_occupation= c(1, 3, 3, 3, 1, 2, 3, 1, 1, 1, 3, 2, 1, 3, 3, 1, 3, 1, 2, 1),
              Persons_at_home= c(5, 7, 3, 8, 5, 9, 6, 7, 8, 4, 7, 5, 4, 7, 8, 8, 3, 11, 7, 6), 
              Siblings_at_school= c(6, 4, 4, 1, 2, 1, 5, 3, 1 ,2, 3, 2, 5, 5, 2, 1, 2, 5, 3, 2),
              Types_of_houses= c(1, 2, 3, 1, 1, 3, 3, 1, 2, 3, 2, 3, 2, 2, 3, 3, 3, 3, 3, 2))
data_frame

#b
summary(data_frame)
# The summary displayed the min, 1st Qu., median, mean, 3rd Qu., and max
# The data has both male and female respondents, fathers occupation, persons at home, and siblings at school

#c
#No, siblings at school has 2.95 mean

#d
subset(data_frame[1:2, ])

#e
subset(data_frame[3:5, 2:4])

#f
library(dplyr)
types_houses <- select(data_frame, Types_of_houses)
types_houses

#g
respondents_and_father <- subset(data_frame[c(1:20),c(1:3)])
respondents_and_father
male_only <- respondents_and_father[data_frame$Sex == '1',]
male_only
#There is no male respondent with a father that is a farmer

#h
data1 <- subset(data_frame[c(1:20),c(1,2,5)])
data1
female_only <- data1[data_frame$Sex == '2',]
female_only
call <- data_frame[,5] >= 5
call
sum(call)
data1[call,]
#There are 5 female respondents that have greater than or equal to 5 number of siblings attending school

#2)
df = data.frame(Ints=integer(),Doubles=double(), Characters=character(), Logicals=logical(),
                Factors=factor(), stringsAsFactors=FALSE)
print("Structure of the empty dataframe:")
print(str(df))

#a
#The results it displayed whats inside the data frame which are empty, 0 obs. of 5 variables
#Instead of displaying <0 rows> (or 0-length row.names) it displayed:
#data.frame: 0 obs. of 5 variables:
#$Ints     : int 
#$Doubles   : num 
#$Characters: chr 
#$Logicals  : logi 
#$Factors   : Factor w/ 0 levels: 
#NULL
#Due to print(str(df)) it displayed the varibles of the dataset in vertical with the following functions

#3)
#The title of the bar graph is sentiments of tweets per day. It has a legend at the right side, red for negative, yellow for neutral, and blue for positive 
#In day 1 July 14, 2020 the negative sentiments almost reach 2,500
#In day 2 July 15, 2020 the negative sentiments sky rocketed to 4,000+(plus)
#In day 3 and 4 negative sentiments went down around 3,000 plus
#Then day 5 it went down again to 2,000 plus then went up at day 6
#The graph is mostly negative sentiments from day 1 to 6