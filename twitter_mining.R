library(tidyverse)
library(rtweet)

# every week do this
data<-search_tweets(
  q="tea OR milk",
  n=18000,
  include_rts = FALSE,
  lang="en",
  retryonratelimit = TRUE
)
# flatten to combine file
data<-data%>%flatten()
# create csv file from twitter (run it weekly, change date)
# change the name of the file
# if you don't you are going to lose your data!!!

data%>%write_csv("12_10_2021.csv")

#-----------------
# do it when you start completing your assessment (once at the end)
#mergining and opening all csv files
files<-list.files(pattern = "\\.csv$",full.names = TRUE) # read files names with csv
all_data<-map_df(file, ~read_csv(.x)) #open and merge

all_data<-map_df(files, ~read_csv(.x))

# you may have duplicate entries
final_data<-all_data%>%distinct()
