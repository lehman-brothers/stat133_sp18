## title: make shot charts script
## description: shot charts for the players of the warriors
## input(s): data of shots
## output(s): pdf files containing shot charts

library('jpeg')
library('grid')
library('ggplot2')
library('gridExtra')

# klay thompson
klay_scatterplot <- ggplot(data = thompson)+ 
  geom_point(aes(x = x, y = y, color= shot_made_flag))
klay_scatterplot

court_file <- "../images/nba-court.jpg"
court_image <- rasterGrob(
  readJPEG(court_file),
  width = unit(1, "npc"),
  height = unit(1, "npc")
)


# klay thompson shot chart
klay_shot_chart <- ggplot(data = thompson)+
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Klay Thompson (2016 season)') +
  theme_minimal()
klay_shot_chart

pdf(file = "../images/klay-thompson-shot-chart.pdf", width = 6.5, height = 5)
plot(klay_shot_chart)
dev.off()



# kevin durant shot chart
kevin_shot_chart <- ggplot(data = durant)+
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Kevin Durant (2016 season)') +
  theme_minimal()
kevin_shot_chart

pdf(file = "../images/kevin-durant-shot-chart.pdf", width = 6.5, height = 5)
plot(kevin_shot_chart)
dev.off()



# stephen curry shot chart
stephen_shot_chart <- ggplot(data = curry)+
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Stephen Curry (2016 season)') +
  theme_minimal()
stephen_shot_chart

pdf(file = "../images/stephen-curry-shot-chart.pdf", width = 6.5, height = 5)
plot(stephen_shot_chart)
dev.off()



# draymond green shot chart
draymond_shot_chart <- ggplot(data = green)+
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Draymond Green (2016 season)') +
  theme_minimal()
draymond_shot_chart

pdf(file = "../images/draymond-green-shot-chart.pdf", width = 6.5, height = 5)
plot(draymond_shot_chart)
dev.off()



# andre iguodala shot chart
andre_shot_chart <- ggplot(data = iguodala)+
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Andre Iguodala (2016 season)') +
  theme_minimal()
andre_shot_chart

pdf(file = "../images/andre-iguodala-shot-chart.pdf", width = 6.5, height = 5)
plot(andre_shot_chart)
dev.off()



# facetted shot chart
combo_plot <- grid.arrange(andre_shot_chart, draymond_shot_chart, kevin_shot_chart, klay_shot_chart, stephen_shot_chart)

pdf(file = "../images/gsw-shot-charts.pdf", width = 8, height = 7)
plot(combo_plot)
dev.off()


