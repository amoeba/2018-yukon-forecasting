# read in in-season data to date
# for some combinations of mu and s, calculate the RSS

library(dplyr)
library(readr)


calculate_fit_rss <- function(mu, s) {
  logi_fun <- function(x, mu, s) { 1 / (1 + exp(-((x - mu)/s))) }
  
  
  inseason <- read_csv("data/inseason.csv") %>% 
    mutate(ccpue = cumsum(cpue))
  
  xrange <- -10:50
  logistic <- data.frame(day = xrange,
                         cpue_modeleded = logi_fun(xrange, mu, s))
  
  today <- tail(inseason, n = 1)$day
  ccpue <- tail(inseason, n = 1)$ccpue
  final_ccpue <- ccpue / (logistic[logistic$day == today, "cpue_modeleded"])
  
  estimated <- inseason
  estimated$pccpue_estimated <- estimated$ccpue / final_ccpue
  
  # Trim to fit
  estimated %>% 
    left_join(logistic, by = "day") %>% 
    mutate(r = cpue_modeleded - pccpue_estimated) %>% 
    summarize(rss = sum(r^2))
}

candidates <- crossing(mu = 15:19, s = 4:6)
candidates %>% 
  purrr::pmap(~ bind_cols(tibble(mu = .x, s = .y), calculate_fit_rss(.x, .y))) %>% 
  bind_rows() %>% 
  arrange(rss) -> scores

library(ggplot2)

ggplot(scores, aes(x = mu, y = s, size = rss)) +
  geom_point()
