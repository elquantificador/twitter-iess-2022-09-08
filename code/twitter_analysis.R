library(tidyverse)
library(tm)
library(qdap)
library(wordcloud)
library(RColorBrewer)
library(rgdal)
library(rtweet)
library(rmapshaper)

# First of all, remember to set the correct working directory
load("../data/tweets_iess_list.RData") # load initial data

# --------------------------------------------
# ------------- FREQUENT WORDS ---------------
# --------------------------------------------

# Function for cleaning the text
clean_text <- function(text) {
  new_text <- tolower(text)
  new_text <- str_remove_all(new_text,"http\\S*") # delete urls
  new_text <- str_remove_all(new_text,"@\\S*") # delete @'s
  new_text <- str_remove_all(new_text, '[:emoji:]') # delete emojis
  new_text <- str_replace_all(new_text,"[[:punct:]]", " ") # remove punctuation
  new_text <- str_replace_all(new_text,"[[:digit:]]", " ") # delete numbers
  new_text <- str_replace_all(new_text,"\\s[a-z]{1}\\s", " ") # delete 1 char words (1st time)
  new_text <- str_replace_all(new_text,"\\s[a-z]{1}\\s", " ") # delete 1 char words (2nd time)
  new_text <- str_replace_all(new_text,"[\\s]+", " ") # delete extra spaces
  return(new_text)
}

twt_txt <- tweets_iess$text # extract tweets text from tweets_iess
twt_txt <- clean_text(twt_txt) # clean text using clean_text() function
twt_txt <- removeWords(twt_txt, stopwords("es")) # remove Spanish stopwords

# Create a vector of custom stop words
custom_stopwds <- c("iessec","iess", "iessknows", "va", "si", "solo",
                    "decir", "hace","hacer", "parte" ,"sino", "igual", "iess_knows",
                    "u ", "f ", "fu ", "ser", " u ", " u")

# Remove custom stop words
twt_txt <- removeWords(twt_txt, custom_stopwds)

# Convert text into text corpus
twt_corpus <- twt_txt %>% 
  VectorSource() %>% 
  Corpus()

# Extract term frequencies for the top 20 words
termfreq_clean <- freq_terms(twt_corpus, 20)

# Correct not desired characters
termfreq_clean <- filter(termfreq_clean, WORD!=c("u", "f", "fu"))

# ------------------------------------
# ------------- MAX RT ---------------
# ------------------------------------

# Extract max retweet count tweet´s url
max_rt <- tweets_iess %>% slice_max(retweet_count)
max_rt <- max_rt[[7]][[1]][5]
max_rt <- max_rt[[1]][[6]]

# ------------------------------------
# --------------- MAP ----------------
# ------------------------------------

# Extract geo-coordinates from tweets_iess to append as new columns
iess_geo <- lat_lng(tweets_iess)

# Omit rows with missing geo-coordinates in data frame
iess_geo <- na.omit(iess_geo[,c("lng", "lat")])

colnames(iess_geo)[1] = "long" # change "lng" to "long"
iess_geo <- as_tibble(iess_geo)

# longitud conditions for outliers
long_condition <- subset(iess_geo, long < -81.07861 | long > -75.19098)

# remove longitudinal outliers
iess_geo <- anti_join(iess_geo,long_condition)

# latitude conditions for outliers
lat_condition <- subset(iess_geo, lat < -5.015210 | lat > 1.456722)

# remove latitudinal outliers
iess_geo <- anti_join(iess_geo,lat_condition)

# group coordinates by frequency creating a new freq variable
iess_geo <- iess_geo %>%  
  group_by(long, lat) %>% 
  summarise(freq = n())

shp <- readOGR("../data", "provincias") # load ECU shapefile
shp <- ms_simplify(shp, keep=0.15) # simplify polygons
df <- fortify(shp)

# --------------------------------------
# --------------- PLOTS ----------------
# --------------------------------------

# ------------- FREQUENT WORDS ---------------
# Bar plot of frequent terms
bar_plt <- ggplot(termfreq_clean, aes(x = reorder(WORD, -FREQ), y = FREQ)) + 
  geom_bar(stat = "identity", fill = "#09A4CC") + 
  theme_bw() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  ggtitle('Palabras frecuentes') + theme(plot.title = element_text(hjust = 0.5)) +
  xlab('Palabra')+ ylab('Frecuencia') +
  theme(panel.grid.major = element_blank(),panel.grid.minor = element_blank())
ggsave("../images/bar_plot.png", bar_plt, width = 7, height = 4) # save fig

# Create word cloud with 6 colors and max 50 words
png(file="../images/wordcloud.png") # initialize save fig
# Wordcloud fig:
wordcloud(twt_txt, max.words = 50,
          colors = brewer.pal(10, "Dark2"), 
          scale=c(4,1), random.order = FALSE)
dev.off() # close save fig

# --------------- MAP ----------------
# Plot EC map with locations from where most tweets are posted
map <- ggplot(df, aes(x = long, y = lat, group = group)) +
  geom_polygon(colour = "grey", size = 0.25, fill = "lightblue", alpha = 0.4, aes(group = group)) + coord_sf() +
  geom_point(data = iess_geo, aes(x = long, y = lat, group = NULL, size = freq>1), colour = "darkcyan") +
  theme(panel.background = element_blank(), panel.grid.major = element_blank(),
        axis.text.x = element_blank(), axis.ticks.x = element_blank(),
        axis.text.y = element_blank(), axis.ticks.y = element_blank(),
        legend.position = "none") +
  xlab(element_blank()) + ylab(element_blank()) + labs(size = "Cantidad de tweets")
ggsave("../images/map.png", map, width = 7, height = 6) # save fig
