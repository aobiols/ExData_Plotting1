##  ---------------------------------------------------------------------------
## Explotarory Data Analysis Course Assignment 1 
## plot3.R  Script for the first plot of the course Assignment 1
##  ----------------------------------------------------------------------------


#  We check if we have the Dataset for the course project
#  If we do not have it we show and error and that's it,  otherwise we continue

if (!file.exists("household_power_consumption.txt"))	                                                      
        stop ("No Dataset found, please set your Working directory where the household_power_consumption.txt is ")	        
                                                                                                


##  we read the DataSet

power <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings = "?")


# We make the subset with only the 2 days given

newpower <- power[(power$Date=="1/2/2007" | power$Date=="2/2/2007"),]


#  We convert the strings read  to Date and Time 

newpower$Time <- strptime( paste(newpower$Time,newpower$Date), format = "%H:%M:%S %d/%m/%Y")

# We set locale to English to disply day strings in English
Sys.setlocale("LC_TIME", "English")

# We plot the 3rd plot in a png file named plot3.png

# we initialize the canvas for plotting

par(mfrow=c(1,1))
png(file="plot3.png", width=480, height=480)
with(newpower,plot(Time,Sub_metering_1, ylab="Energy sub metering", xlab="", type="n"))

# We plot sub_metering1 in black

with(newpower, points(Time,Sub_metering_1,col="black", type="l"))

# We plot sub_metering2 in red

with(newpower, points(Time,Sub_metering_2,col="red", type="l"))

# We plot sub_metering3 in blue

with(newpower, points(Time,Sub_metering_3,col="blue", type="l"))

# We plot the legend

legend("topright",col=c("black","red","blue"), legend= c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), pch="________")

dev.off()


