### Bruce Pezzlo 7 Dec  2015
### Coursera MOOC John Hopkins University: Exploritory Data

# plot 4 - histogram
# see read_datafile.R for notes ... this source imports data for all plots

source('read_datafile.R')

#load data
power_data <- read_data()

# Open png device
if (!DEBUG) png( filename= 'plot4.png',
                 width= pic_size, 
                 height= pic_size, 
                 units= "px", 
                 pointsize= 12, 
                 bg= "white",  
                 res= NA
                )



## create 2 row 2 column table of 4 charts
par( mfrow= c(2,2) )

# Top left - line chart Power x Time
plot( power_data$datetime, 
      power_data$Global_active_power,
      ylab= 'Global Active Power', 
      xlab= '', 
      type= 'l'
      )

# Top right - line chart Voltage x Time
plot( power_data$datetime, 
      power_data$Voltage,
      xlab= 'datetime', 
      ylab= 'Voltage', 
      type= 'l'
      )

# Bottom left
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
        legend= c('Sub_metering_1', 
                  'Sub_metering_2', 
                  'Sub_metering_3'
                  ),
        col= c( 'black', 
                'red', 
                'blue'
                ), 
        lty= 'solid', 
        bty= 'n'
        )

# Bottom right
plot( power_data$datetime, 
      power_data$Global_reactive_power,
      xlab= 'datetime', 
      ylab= 'Global_reactive_power', 
      type= 'l'
      )

# Turn off device
if (!DEBUG) dev.off()
