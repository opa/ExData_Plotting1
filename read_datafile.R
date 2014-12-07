### Bruce Pezzlo 7 Dec  2015
### Coursera MOOC John Hopkins University: Exploritory Data

### file reading library - reads in the file based upon global setting found below
### read_data function:
        # returns dplyr dataframe
        # reads in a zip file from a setting's url if data file doesn't already exist in working folder
        # filters the data based upon setting's start and end date
        # saves the recordset to the drive for future needs using RDS
        # RDS is R's way of storing a single R object to the hard drive

###### PACKAGE DEPENDENCIES: data.table ; dplyr ; lubridate

#############################################################
### NOTE: hardcoded assumptions here
zip_file_url = "https://d396qusza40orc.cloudfront.net/exdata/data/household_power_consumption.zip"
data_file_name = "household_power_consumption.txt" # default name datafile found inside the zip file
has_header = TRUE
column_seperator = ";"
na_string = "?"
start_date = ymd('2007-02-01')
end_date = ymd('2007-02-02') 
DEBUG <- TRUE ################# SET TO FALSE TO WRITE PNG FILES, TRUE TO SEE PLOTS ON SCREEN
#############################################################  



read_data <- function() {
  
  if (file.exists('archived_data.RDS')) {
    # Load archived version from drive
    power.df <- readRDS('archived_data.rds')
  } else {
    ## derived using regex from the url
    zip_file_name = regmatches( c(zip_file_url), 
                                regexpr("([^/]*)$",
                                        zip_file_url
                                        )
                                )
  
    # Download the data from url
    if ( !file.exists( zip_file_name) ) {
      download.file( url= zip_file_url, 
                    destfile= zip_file_name, 
                    method= "curl")
      unzip( zip_file_name)
    }
    library('data.table')
    # Read data into a temp table then push into a dplyr data table
    power.dt <- read.table( data_file_name, 
                           sep= column_seperator, 
                           header= has_header, 
                           na.strings= na_string #,
                           # colClasses=c( rep( 'character', 2 ), 
                           #            rep( 'numeric', 7 ) 
                           #             )
                           )
    library('dplyr')
    library('lubridate')
    power.df <- tbl_df( power.dt ) # use dplyr's data frame tbl
    rm( power.dt ) #remove the data table from memory to avoid confusion
  
    # use dplyr to format data as needed
    #    dplyr uses this syntax select(), filter(), arrange(), mutate(), and summarize()
    power.df <- power.df %>%
      mutate(date.time= dmy( Date ) + hms( Time ) ,
             weekday= day( date.time )
             ) %>% 
      filter( date.time > start_date , 
             date.time < ( end_date +  new_duration( day= 1) ) # add a day to include the final day in the series (e.g. to midnight that day)
             ) 
    # Save file
    saveRDS(power.df, file='archived_data.RDS')  # Save (archive) cached version of dataset as RDS for faster subsequent calls 
  }
  # return the data to caller
  power.df
}
