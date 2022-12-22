library(wordcloud)
library(plotly)
library(tm)
library(dplyr)
library(RColorBrewer)
library(ggplot2)
library(twitteR)

# SETUP CREDENTIALS.
CONSUMER_KEY <- "eJDFmNbcF5J0tyWeHMVQXfSu3"
CONSUMER_SECRET <- "JJ7NU0919jp0PiPy2rUlUd9kNbHILLtMmhKjT4euDabesoiatl"
ACCESS_TOKEN <-  "1605820141249658880-6WuSKAKUe0g8QLUzVxBjLo3GZJBL4H"
ACCESS_SECRET <-  "03jmA42JLcDNScDg73vHedmk1Icxz7qiVg2X13PssMfnx"

setup_twitter_oauth(consumer_key = CONSUMER_KEY,
                    consumer_secret = CONSUMER_SECRET,
                    access_token = ACCESS_TOKEN,
                    access_secret = ACCESS_SECRET)


# EXTRACTING TWEETS.
leaguetweets <- searchTwitter("#LeagueOfLegends", n=10000, lang="en", since="2022-11-25", until="2022-12-2", retryOnRateLimit = 120)
leaguetweets

# CONVERTING LIST DATA TO DATA FRAME.
leaguetweetsDF <- twListToDF(leaguetweets)

# SAVE DATA FRAME FILE.
save(leaguetweetsDF,file = "leagueTweetsDF.Rdata")

# LOAD DATA FRAME FILE.
load(file = "leagueTweetsDF.Rdata")

# CHECKING FOR MISSING VALUES IN A DATA FRAME.
sap_data <- sapply(leaguetweetsDF, function(x) sum(is.na(x)))
sap_data

#Tweets
# SUBSETTING USING THE dplyr() PACKAGE.
tweets <- leaguetweetsDF %>%
  select(screenName,text,created, isRetweet) %>% filter(isRetweet == FALSE)
tweets

# GROUPING THE DATA CREATED. 
tweets %>%  
  group_by(1) %>%  
  summarise(max = max(created), min = min(created))

crt_data <- tweets %>%  mutate(Created_At_Round = created %>% round(units = 'hours') %>% as.POSIXct())
crt_data

mn <- tweets %>% pull(created) %>% min()
mn 
mx <- tweets %>% pull(created) %>% max()
mx

# Plot on tweets by time using the library(plotly) and ggplot().
plt_data <- ggplot(crt_data, aes(x = Created_At_Round)) +
  geom_histogram(aes(fill = ..count..)) +
  theme(legend.position = "right") +
  xlab("Time") + ylab("Number of tweets") + 
  scale_fill_gradient(low = "midnightblue", high = "aquamarine4")

plt_data %>% ggplotly()

#==============
#Retweets

sub_tweets <- leaguetweetsDF %>%
  select(screenName,text,created, isRetweet) %>% filter(isRetweet == TRUE)
sub_tweets


sub_tweets %>%  
  group_by(1) %>%  
  summarise(max = max(created), min = min(created))

crt2 <- sub_tweets %>%  mutate(Created_At_Round = created %>% round(units = 'hours') %>% as.POSIXct())
crt2

mn <- sub_tweets %>% pull(created) %>% min()
mn 
mx <- sub_tweets %>% pull(created) %>% max()
mx

# Plot on tweets by time using the library(plotly) and ggplot().
plt_data <- ggplot(crt2, aes(x = Created_At_Round)) +
  geom_histogram(aes(fill = ..count..)) +
  theme(legend.position = "right") +
  xlab("Time") + ylab("Number of tweets") + 
  scale_fill_gradient(low = "midnightblue", high = "aquamarine4")

plt_data %>% ggplotly()
