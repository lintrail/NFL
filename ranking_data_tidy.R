library(dplyr)
library(tidyr)

# Read in original data set
rankings_df <- read_csv("ap_final_ranks.csv")

# Making the data tidy
rankings_df_college <- ap_final_ranks %>% 
  select(Rank, ends_with("poll")) %>% 
  gather(Year, College, -Rank )

rankings_df_record <- ap_final_ranks %>% 
  select(Rank, ends_with("Record")) %>% 
  gather(Year, Record, -Rank)

# Deleting prefix & suffix of observations in Year variables 
rankings_df_college$Year <- gsub(pattern = ".final.AP.poll", replacement = "", x = rankings_df_college$Year)
rankings_df_college$Year <- gsub(pattern = "X", replacement = "", x = rankings_df_college$Year)

rankings_df_record$Year <- gsub(".Record", "", rankings_df_record$Year)
rankings_df_record$Year <- gsub("X", "", rankings_df_record$Year)

# Merging College df and Record df into one df
rankings_df <- left_join(rankings_df_college, rankings_df_record, by = c("Rank", "Year"))

# Change " / " to " - " for all Year observations
rankings_df$Record <- gsub("/", "-", rankings_df$Record)

head(rankings_df)
tail(rankings_df)



