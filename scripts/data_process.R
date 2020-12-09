if(!require('tidyverse')) install.packages('tidyverse'); library('tidyverse')
if(!require('lubridate')) install.packages('lubridate'); library('lubridate')

process_raw_data = function(){
  files = list.files("raw_data/")
  for(i in files){
    fn <- str_remove(i, ".tsv")
    raw_file <- readr::read_tsv(paste0("raw_data/", i)) %>% 
      janitor::remove_empty() %>% janitor::clean_names()
    
    message(paste0("Saving ", fn, " file..."))
    message("Missing values: ", sum(is.na(raw_file)))
    message("Variables with highest proportion of missing values: ")
    print(raw_file %>% is.na %>% colMeans %>% sort %>% rev() %>% head())
    saveRDS(object = raw_file, file = paste0("./clean_data/", fn, ".rds"))
  }
}