library(tidyverse)
library(stemtools)


data(trust, package = "stemtools")

# stem_summarise ----------------------------------------------------------
stem_summarise(data = trust, item = government)

stem_summarise(data = trust, item = government,
               weight = W)

stem_summarise(data = trust, item = government,
               weight = W,
               group = eu_index)

stem_summarise(data = trust, item = government,
               weight = W,
               group = eu_index,
               return_n = TRUE)

## The same, but numerical
stem_summarise(data = trust, item = age,
               weight = W,
               group = eu_index,
               return_n = TRUE)

## Collapsing categories
stem_summarise(data = trust, item = government,
               weight = W,
               collapse_item = list(Agree = c("Definitely Agree", "Rather Agree"),
                                    Disagree = c("Definitely Disagree", "Rather Disagree")))

stem_summarise(data = trust, item = government,
               weight = W,
               group = eu_index,
               collapse_item = list(Souhlasí = c("Definitely Agree", "Rather Agree"),
                                    "Něco mezi" = "Neither Agree nor Disagree",
                                    Nesouhlasí = c("Definitely Disagree", "Rather Disagree")),
               collapse_group = list("Pro EU" = "Likes EU",
                                     "Neutrální/Proti EU"  = c("Neutral", "Dislikes EU"),
                                     "Bez Názoru" = "Doesn't Know"))

# Plotting ----------------------------------------------------------------
## Theme
theme_set(theme_stem(legend.position = "bottom"))

## Palettes
stem_palettes("modern")
"#35978F" "#80CDC1" "#B0C89F" "#DFC27D" "#BF812D"

stem_palettes("bluered_light")
"#2166AC" "#92C5DE" "#E8DC99" "#F4A582" "#B2182B"

stem_palettes("gruvbox")
"#fb4934" "#b8bb26" "#83a598" "#fabd2f" "#d3869b" "#8ec07c" "#fe8019"

## The big plotting function
stem_plot(data = trust, item = police)

stem_plot(data = trust, item = police,
          label_accuracy = 1,
          label_scale = 100)

stem_plot(data = trust, item = police,
          label_accuracy = 1,
          label_scale = 100,
          caption = TRUE)

stem_plot(data = trust, item = police,
          label_accuracy = 1,
          label_scale = 100,
          caption = TRUE,
          label_suffix = "%")

tem_plot(data = trust, item = police,
         label_accuracy = 1,
         label_scale = 100,
         caption = TRUE,
         label_suffix = "%",
         item_wrap = 15)

stem_plot(data = trust, item = police,
         label_accuracy = 1,
         label_scale = 100,
         caption = TRUE,
         label_suffix = "%",
         item_wrap = 15,
         group = eu_index,
         weight = W)

stem_plot(data = trust, item = police,
          label = FALSE,
          label_accuracy = 1,
          label_scale = 100,
          caption = TRUE,
          label_suffix = "%",
          item_wrap = 15,
          group = eu_index,
          weight = W,
          geom = geom_pointrange)


## Wrappers
stem_plot_bar(data = trust, item = police, weight = W)
stem_plot_bar(data = trust, item = police, group = eu_index, weight = W)
stem_plot_bar(data = trust, item = police, group = eu_index, weight = W, item_wrap = 15)

stem_plot_barstack(data = trust, item = police, weight = W)


stem_plot_battery(data = trust, items = c(police, army, eu, government))
stem_plot_battery(data = trust, items = c(police, army, eu, government),
                  order_by = c("Definitely Agree", "Rather Agree"))
stem_plot_battery(data = trust, items = c(police, army, eu, government),
                  collapse_item = list(Agree = c("Definitely Agree", "Rather Agree"),
                                       Disagree = c("Definitely Disagree", "Rather Disagree")),
                  order_by = c("Definitely Agree", "Rather Agree"))

stem_plot_multiselect(data = trust, items = starts_with("biggest_concern"), weight = W)
stem_plot_multiselect(data = trust, items = starts_with("biggest_concern"), weight = W,
                      backround_fill = "tomato",
                      backround_alpha = 0.4)
