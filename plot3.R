### Bruce Pezzlo 7 Dec  2015
### Coursera MOOC John Hopkins University: Exploritory Data

# plot 3 - histogram
# see read_datafile.R for notes

source('read_datafile.R')

#load data
power_data <- read_data()

# Open png device
if (!DEBUG) png(filename='plot3.png')



# Make triple-line chart
plot( power_data$datetime, 
      power_data$Sub_metering_1, 
      type='l',
      xlab='', 
      ylab='Energy sub metering'
      )
lines( power_data$datetime, 
       power_data$Sub_metering_2, 
       col='red'
       )
lines( power_data$datetime, 
       power_data$Sub_metering_3, 
       col='blue'
       )
legend( 'topright', 
        legend=c( 'Sub_metering_1', 
                  'Sub_metering_2', 
                  'Sub_metering_3'
                  ) ,
        col= c( 'black', 
                'red', 
                'blue'
                ), 
       lty='solid' # line types
       )

# Turn off device
if (!DEBUG) dev.off()
