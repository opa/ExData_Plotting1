### Bruce Pezzlo 7 Dec  2015
### Coursera MOOC John Hopkins University: Exploritory Data

# plot 3 - histogram
# see read_datafile.R for notes

source('read_datafile.R')

#load data
power_data <- read_data()

# Open png device
if (!DEBUG) png(filename='plot2.png')

# create single-line chart
plot( power_data$datetime, # x-axis
      power_data$Global_active_power,  # y-axis
      ylab= 'Global Active Power (kilowatts)', 
      xlab= '', 
      type= 'l' # 'l' for line type chart
      )

# Turn off device
if (!DEBUG) dev.off()
