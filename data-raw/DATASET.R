## Load the dataset
df_runinfo <- read.csv(here::here("data-raw", "runinfo.csv"))

usethis::use_data(df_runinfo, overwrite = TRUE)
