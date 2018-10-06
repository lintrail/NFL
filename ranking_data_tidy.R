library(dplyr)
library(tidyr)
rankings_df <- ap_final_ranks

# Making the data tidy
rankings_df <- ap_final_ranks %>% 
  gather(Year, College, ends_with("poll"), ends_with("Record")) 


# Deleting prefix of observations in Year Variable
rankings_df$Year <- gsub("X", "", rankings_df$Year)

head(rankings_df)
tail(rankings_df)

# Separating the Year column to make observations nice
rankings_df <- rankings_df %>% 
  separate(Year, c("Season", "Year"), "(.final.AP.poll$)")

head(rankings_df)
tail(rankings_df)


# Delete Year variable
rankings_df$Year <- NULL

# Reorder the columns
rankings_df <- rankings_df[,c("Season","Rank","College")]

head(rankings_df)
str(rankings_df)
# Change " / " to " - " for all Record observations
rankings_df$College <- gsub("/", "-", rankings_df$College)

head(rankings_df)
tail(rankings_df)
rankings_df







rankings2_df <- ap_final_ranks %>% 
  gather( Year, College, ends_with("poll")) %>% 
  gather(Season, Record, ends_with("Record"))

head(rankings2_df)
tail(rankings2_df)
str(rankings2_df)
rankings2_df




ap_final_ranks %>% 
  gather(Year, College, -Rank) %>% 
  lapply()
