##  ---------------------------------------------------------------------------
## Explotarory Data Analysis Course Assignment 1 
## plot2.R  Script for the first plot of the course Assignment 1
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

# We plot the 2nd plot at the screen and in a png file named plot2.png

par(mfrow=c(1,1))

with(newpower,plot(Time,Global_active_power, type="l", ylab="Global Active Power (Kilowatts)", xlab=""))
dev.copy(png,file="plot2.png", width=480, height=480)
dev.off()


