library(dplyr)
library(readr)
library(tidyr)
library(ggplot2)

# Modeled v Estimated
do_calc_modeled_v_estimated <- function(mu, s) {
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
  
  estimated %>% 
    left_join(logistic, by = "day") %>% 
    select(day, pccpue_estimated, cpue_modeleded) %>% 
    gather(type, pccpue, -day)
}

crossing(mu = 17:30, s = 4:6) %>% 
  purrr::pmap(~ do_calc_modeled_v_estimated(.x, .y) %>% mutate(mu = .x, s = .y)) %>% 
  bind_rows() %>% 
  ggplot(aes(day, pccpue, color = type)) +
  geom_line() +
  facet_grid(mu ~ s, scales = "free")

ggsave("refit/figures/visual_refit.pdf", width = 10, height = 30)

# Final CPUE
do_final_cpue <- function(mu, s) {
  logi_fun <- function(x, mu, s) { 1 / (1 + exp(-((x - mu)/s))) }
  
  inseason <- read_csv("data/inseason.csv") %>% 
    mutate(ccpue = cumsum(cpue))
  
  xrange <- -10:50
  logistic <- data.frame(day = xrange,
                         cpue_modeleded = logi_fun(xrange, mu, s))
  
  final_cpue <- data.frame(day = inseason$day,
                           estimate = inseason$ccpue / 
                             (logistic[logistic$day %in% inseason$day,"cpue_modeleded"] / 100))
  
  final_cpue$date <- as.Date(final_cpue$day,
                             format = "%j", 
                             origin = as.Date("2016-05-31"))
  
  final_cpue
}

crossing(mu = 17:30, s = 4:6) %>% 
  purrr::pmap(~ do_final_cpue(.x, .y) %>% mutate(mu = .x, s = .y)) %>% 
  bind_rows() %>% 
  ggplot(aes(day, estimate)) +
  geom_point() +
  geom_line() +
  facet_grid(mu ~ s, scales = "free")

ggsave("refit/figures/visual_refit_finalcpue.pdf", width = 10, height = 30)

