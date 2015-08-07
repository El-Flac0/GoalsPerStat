# helper

goalsPerStat <- function(club='League Average', stat='Shots', loc='Both', metric='meanPoints') {
# subset relevant club
  if (!(club=='League Average')) {
    eplMelt <- filter(eplMelt, grepl(club, Team))
  }
# convert to mean values table
  eplSelect <- eplMelt %>%
    group_by_("Location", stat) %>%
    summarise(meanGoals = mean(Goals), meanPoints = mean(Points))
  eplSelect$Location <- as.factor(eplSelect$Location)
# subset by location
  switch(loc,
       Home = eplSelect <- filter(eplSelect, grepl('home', Location)),
       Away = eplSelect <- filter(eplSelect, grepl('away', Location)),
       Both = eplSelect <- filter(eplSelect, grepl('home|away', Location))
  )
# plot by metric
  g <- ggplot(eplSelect, aes_string(x=stat, y=metric, colour="Location")) + geom_point() + 
    geom_smooth(method=lm, se=FALSE, fullrange=TRUE) + 
    scale_colour_discrete(limits = levels(eplSelect$Location))
  print(g)
}