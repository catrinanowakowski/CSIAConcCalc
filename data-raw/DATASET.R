## Load the dataset
df_runinfo <- read.csv(hear::hear("data-raw", "runinfo.csv"))

usethis::use_data(df_runinfo, overwrite = TRUE)
