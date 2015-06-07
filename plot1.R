##  ---------------------------------------------------------------------------
## Explotarory Data Analysis Course Assignment 1 
## plot1.R  Script for the first plot of the course Assignment 1
##  ----------------------------------------------------------------------------


#  We check if we have the Dataset for the course project
#  If we do not have it we show and error and that's it,  otherwise we continue

if (!file.exists("household_power_consumption.txt"))	                                                      
        stop ("No Dataset found, please set your Working directory where the household_power_consumption.txt is ")	        
                                                                                                


##  we read the DataSet

power <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings = "?")


# We make the subset with only the 2 days given

newpower <- power[(power$Date=="1/2/2007" | power$Date=="2/2/2007"),]

# We plot the histogram at the screen and in a png file named plot1.png

hist(newpower$Global_active_power, main="Global Active Power", col="red", xlab="Global Active Power(Kilowatts)")
dev.copy(png,file="plot1.png", width=480, height=480)
dev.off()


