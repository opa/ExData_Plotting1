### Bruce Pezzlo 7 Dec  2015
### Coursera MOOC John Hopkins University: Exploritory Data

# plot 1 - histogram
# see read_datafile.R for notes ... this source imports data for all plots

source('read_datafile.R')

#load data
power_data <- read_data()

# Open png device
if (!DEBUG) png( filename= 'plot1.png', 
                 width= pic_size, 
                 height= pic_size, 
                 units= "px", 
                 pointsize= 12, 
                 bg= "white",  
                 res= NA
                 )


# plot frequency histogram
hist( power_data$Global_active_power, 
      main='Global Active Power', 
      xlab='Global Active Power (kilowatts)', 
      col='red'
      )

# Turn off device
if (!DEBUG) dev.off()
