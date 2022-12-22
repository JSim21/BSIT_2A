install.packages("tm")
install.packages("tidytext")
install.packages("plotly")
install.packages("wordcloud")
install.packages("RColorBrewer")
install.packages("dplyr")
install.packages("wordcloud2")
install.packages("syuzhet")
install.packages("magrittr")
install.packages("stringr")
install.packages("twitteR")
install.packages("rtweet")



library(wordcloud)
library(plotly)
library(tm)
library(dplyr)
library(RColorBrewer)
library(ggplot2)
library(twitteR)
library(rtweet)

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
data_tweets <- searchTwitter("#Japan -filter:retweets", n=10000, lang="en", 
                             since="2022-12-14", until="2022-12-21", 
                             retryOnRateLimit = 120)
data_tweets

# CONVERTING LIST DATA TO DATA FRAME.
tweetsDF <- twListToDF(data_tweets)
class(tweetsDF)
names(tweetsDF)
View(tweetsDF)
head(tweetsDF)[1:5]
head(tweetsDF$text)[1:5]

# SAVE DATA FRAME FILE.
save(tweetsDF,file = "trendingTweetsDF.Rdata")

# LOAD DATA FRAME FILE.
load(file = "trendingTweetsDF.Rdata")

# CHECKING FOR MISSING VALUES IN A DATA FRAME.
data_chk <- sapply(tweetsDF, function(x) sum(is.na(x)))
data_chk

# SUBSETTING USING THE dplyr() PACKAGE.
tweetsDF2 <- tweetsDF %>%
  select(screenName,text,created,statusSource)
tweetsDF2

# GROUPING THE DATA CREATED. 
tweetsDF2 %>%  
  group_by(1) %>%  
  summarise(max = max(created), min = min(created))

#Adding column for Created at Round data
data_create <- tweetsDF %>%  mutate(Created_At_Round = created %>% round(units = 'hours') %>% as.POSIXct())
data_create

tweetsDF2 %>% pull(created) %>% min() 
tweetsDF2 %>% pull(created) %>% max()

# Plot on tweets by time using the library(plotly) and ggplot().
plt_data <- data_create %>% 
  dplyr::count(Created_At_Round) %>% 
  ggplot(mapping = aes(x = Created_At_Round, y = n)) +
  theme_light() +
  geom_line() +
  xlab(label = 'Date') +
  ylab(label = NULL) +
  ggtitle(label = 'Number of Tweets per Hour')

plt_data %>% ggplotly()

# ===
#pseodu plotting that has a legend
ggplot(data = tweetsDF, aes(x = created)) +
  geom_histogram(aes(fill = ..count..)) +
  theme(legend.position = "right") +
  xlab("Time") + ylab("Number of tweets") + 
  scale_fill_gradient(low = "midnightblue", high = "aquamarine4")

# PLOTTING STATUS SOURCE.
encodeSource <- function(x) {
  if(grepl(">Twitter for iPhone</a>", x)){
    "iphone"
  }else if(grepl(">Twitter for iPad</a>", x)){
    "ipad"
  }else if(grepl(">Twitter for Android</a>", x)){
    "android"
  } else if(grepl(">Twitter Web Client</a>", x)){
    "Web"
  } else if(grepl(">Twitter for Windows Phone</a>", x)){
    "windows phone"
  }else if(grepl(">dlvr.it</a>", x)){
    "dlvr.it"
  }else if(grepl(">IFTTT</a>", x)){
    "ifttt"
  }else if(grepl(">Facebook</a>", x)){  #This looks unreliable...
    "facebook"
  }else {
    "others"
  }
}

#applying encodeSource funtion in the tweetsDF data
tweetsDF2$tweetSource = sapply(tweetsDF$statusSource, 
                               encodeSource)

#Converting to dataframe
data_appSource <- tweetsDF2 %>% 
  select(tweetSource) %>%
  group_by(tweetSource) %>%
  summarize(count=n()) %>%
  arrange(desc(count))

#plotting for tweetSource 
ggplot(tweetsDF2[tweetsDF2$tweetSource != 'others',], aes(tweetSource, fill = tweetSource)) +
  geom_bar() +
  theme(legend.position="none",
        axis.title.x = element_blank(),
        axis.text.x = element_text(angle = 45, hjust = 1)) +
  ylab("Number of tweets") +
  ggtitle("Tweets by Source")

# Accounts that tweeted from the trentopic Japan.
data_appScreen <- tweetsDF2 %>%
  select(screenName) %>%
  group_by(screenName) %>%
  summarize(count=n()) %>%
  arrange(desc(count)) 

#convert to Corpus
namesCorpus_data <- Corpus(VectorSource(data_appScreen$screenName))  #using ScreenName
class(data_appScreen$screenName)

cls <- class(VectorSource(data_appScreen$screenName))
cls

str(namesCorpus_data)

class(namesCorpus_data)

nms <- namesCorpus_data
nms


# Wordcloud for the screenNames.
word_pal <- brewer.pal(8, "Dark2")
pal_word <- word_pal[-(1:4)]
set.seed(123)

par(mar = c(0,0,0,0), mfrow = c(1,1))

wordcloud(words = namesCorpus_data, scale=c(3,0.5),
          max.words=10000,
          random.order=FALSE,
          rot.per=0.5,
          use.r.layout=TRUE,
          colors=pal_word)
