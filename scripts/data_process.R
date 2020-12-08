if(!require('tidyverse')) install.packages('tidyverse'); library('tidyverse')
if(!require('lubridate')) install.packages('lubridate'); library('lubridate')

process_raw_data = function(){
  files = list.files("raw_data/")
  for(i in files){
    bunjil_extract <- readr::read_csv(paste0("raw_data/", i)) %>% 
      janitor::remove_empty() %>% janitor::clean_names()
  }

  message("Saving data files...")
  message("Missing values: ", sum(is.na(bunjil_extract_subset)))
  message("Variables with highest proportion of missing values: ")
  print(bunjil_extract_subset %>% is.na %>% colMeans %>% sort %>% rev() %>% head())
  saveRDS(object = bunjil_extract_subset, file = "./clean_data/bunjil_extract.rds")
}