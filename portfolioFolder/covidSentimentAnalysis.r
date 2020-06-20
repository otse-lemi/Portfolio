library(NLP)
library(twitteR)
library(syuzhet)
library(tm)
library(SnowballC)
library(topicmodels)
library(ROAuth)
library(ggplot2)
library(stringi)

consumer_key<- "rKK3f6p8llbf6KZhfF2YznWNX"
consumer_secret<- "hO5u9diqg3iXb8K47vkgm5lIGxhv6hbWBh26CfoHubp7wu51Ul"
access_token<- "797962668-YWGKv8pjFVb7Jl38OAKjxf8LW3pJKDhE5etggcdw"
access_secret<- "jsJ1dE5BaqJkryf6PXE74SccrhKCHaSzIiDk60VL7qVnD"
setup_twitter_oauth(consumer_key, consumer_secret, access_token,access_secret)

#get tweets by location
aloc<- availableTrendLocations()
aloc

aloc[aloc$name == "Lagos",]
trend<- getTrends(woeid = aloc[aloc$name == "Lagos", 3])
trend

tweets_covid<-searchTwitter(trend[47,1], n=3000, lang="en")

#convert the tweets to dataframe
covid_tweets<- twListToDF(tweets_covid)

#extract tweets to text
covid_text<-covid_tweets$text


####preprocess the text
#convert all text to lower case
covid_text<- tolower(covid_text)
#replace blank space ("rt)
covid_text<- gsub("rt", "", covid_text)
#replace @Username
covid_text <- gsub("@\\w+", "", covid_text)
### Remove punctuation
covid_text <- gsub("[[:punct:]]", "", covid_text)
### Remove links
covid_text <- gsub("http\\w+", "", covid_text)
### Remove tabs
covid_text <- gsub("[ |\t]{2,}", "", covid_text)
### Remove blank spaces at the beginning
covid_text <- gsub("^ ", "", covid_text)
### Remove blank spaces at the end
covid_text <- gsub(" $", "", covid_text)
### Remove carriage returns and new lines
covid_text <- gsub("[\r\n]", "", covid_text)
### Remove stop words
stopWords <- stopwords("en")
covid_text <- unlist(covid_text)[!(unlist(covid_text) %in% stopWords)]
#remove blank spaces at the beginning

####sentiments analysis####

mysentiment_covid <- get_nrc_sentiment(covid_text)

Sentimentscores_covid <-data.frame(colSums(mysentiment_covid[,]))

names(Sentimentscores_covid) <- "Score"
Sentimentscores_covid <- cbind("sentiment"=rownames(Sentimentscores_covid),Sentimentscores_covid)
rownames(Sentimentscores_covid)<-NULLt


ggplot(data=Sentimentscores_covid,aes(x=sentiment,y=Score))+geom_bar(aes(fill=sentiment),stat = "identity")+
  theme(legend.position="none")+
  xlab("Sentiments")+ylab("scores")+ggtitle("Sentiments of what people are tweeting about Covid-19")

### Summarise Sentiment to Positive & Negative
positive <- c(0)
negative <- c(0)
for(i in 1:nrow(Sentimentscores_covid)) {
  if(Sentimentscores_covid[i, 1] %in% c('joy', 'trust', 'positive')) {
    positive <- positive + Sentimentscores_covid[i, 2]
  }
  else {
    negative <- negative + Sentimentscores_covid[i, 2]
  }
}

simple_sentiment_covid <- data.frame(sentiments=c("positive", "negative"), scores=c(positive, negative))

ggplot(data=simple_sentiment_covid,aes(x=sentiments,y=scores))+geom_bar(aes(fill=sentiments),stat = "identity")+
  theme(legend.position="none")+
  xlab("Sentiments")+ylab("scores")+ggtitle("Sentiments of what people are tweeting about Covid-19")

#convert covid_tweets dataframe to csv
covid_txt<- write.csv(covid_text, "C:/Users/user/Documents/Otse/raw.csv", row.names=FALSE)

csvFile = open(covid_text, 'a' ,encoding='utf-8')
df.to_csv(csvFile, mode='a', columns=COLS, index=False, encoding="utf-8")