Thermostat starts at 20 degrees DONE
You can increase the temperature with an up function DONE
You can decrease the temperature with a down function DONE
The minimum temperature is 10 degrees DONE
If power saving mode is on, the maximum temperature is 25 degrees DONE
If power saving mode is off, the maximum temperature is 32 degrees DONE
Power saving mode is on by default DONE
You can reset the temperature to 20 with a reset function DONE
You can ask about the thermostat's current energy usage: < 18 is low-usage, < 25 is medium-usage, anything else is high-usage. DONE

(In the challenges where we add an interface, low-usage will be indicated with green, medium-usage indicated with black, high-usage indicated with red.)

## Domain model for 3 user stories
subject    Message 
degree     up   (increasing the temperature)
           down (decreasing the temperature)

## powersaving MODE ON AND OFF DOMAIN
subject    message
(max.temp up to 25)  powersave on (by default)  
(max.temp up to 32)  powersave off  

-----------------------------------------------------------------------------------

## Thermostat: interface
HTML Elements : 
button for up
button for down 
button for PSON
button for PSOFF
button for RESET
display Text for curret.temperature
display Test PowersavingMode




