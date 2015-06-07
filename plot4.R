##  ---------------------------------------------------------------------------
## Explotarory Data Analysis Course Assignment 1 
## plot4.R  Script for the first plot of the course Assignment 1
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

# We plot the 4th plot in a png file named plot4.png, not in the screen 

png(file="plot4.png")

# we initialize the 2x2 canvas for plotting

par(mfrow=c(2,2))


# We plot the 4 plots as described in the assignment


with(newpower, {
    plot(Time,Global_active_power, type="l", ylab="Global Active Power", xlab="")
    plot(Time,Voltage, type="l", ylab="Voltage", xlab="datetime")
    plot(Time,Sub_metering_1, ylab="Energy Sub metering", xlab="", type="n")
	with(newpower, points(Time,Sub_metering_1,col="black", type="l"))
	with(newpower, points(Time,Sub_metering_2,col="red", type="l"))
	with(newpower, points(Time,Sub_metering_3,col="blue", type="l"))
	legend("topright", bty="n",col=c("black","red","blue"), legend= c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), pch="________")
   plot(Time,Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime")
})



dev.off()


