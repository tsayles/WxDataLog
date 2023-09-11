#!/bin/bash

# Generate a bash script to fetch temperature and AQI data from specific 
# hardcoded Weather Underground URLs using the lynx command-line web browser.
# - Fetch data from two separate URLs: one for temperature and another for AQI.
# - Extract temperature and AQI values from the fetched content.
# - Continuously log the current UTC timestamp, temperature, and AQI to a daily 
#   CSV file every 15 minutes.
# - If the CSV file for the day doesn't exist, create it and add headers.
# - Output fetched data to the console in addition to logging it to the file.
# - Handle cases where fetched data might be missing or invalid, and provide an 
#   error message in such scenarios.
# - Include a detailed comment header with placeholders for the author's name 
#   and email, and a copyleft reference per the GNU General Public License.
# Author: [Your Name]
# Email: [Your Email]
# Copyleft: This script is free software; you can redistribute it and/or modify 
# it under the terms of the GNU General Public License as published by the Free 
# Software Foundation; either version 2 of the License, or (at your option) any 
# later version.

# Hardcoded Weather Underground station URL
TEMP_URL="https://www.wunderground.com/dashboard/pws/KWAFALLC95"
AQI_URL="https://www.wunderground.com/health/us/wa/fall-city/KWAFALLC79?cm_ven=localwx_modaq"

# Function to fetch temperature and AQI
fetch_data() {
    
    local TEMP_DATA=$(lynx -reload -dump $TEMP_URL | grep -A1 "Current Conditions" | tail -n 1)
    local AQI_DATA=$(lynx -reload -dump $AQI_URL  | grep -A1 "AQI" | head -n 2 | tail -n 1)

    local TEMP=$(echo "$TEMP_DATA" | awk '{print $1}')
    local AQI=$(echo "$AQI_DATA" | awk '{print $1}')

    # Verify the fetched data
    if [[ -z "$TEMP" || -z "$AQI" ]]; then
        echo "Failed to fetch data." >&2
        exit 1
    fi

    echo "$TEMP,$AQI"
}

# Main loop to fetch and log data every 15 minutes
while true; do
    TIMESTAMP=$(date -u +"%Y-%m-%d %H:%M:%S")
    DATA=$(fetch_data)
    FILENAME=$(date -u +"%Y-%m-%d").csv

    # Check if file exists, if not, create with headers
    if [[ ! -f $FILENAME ]]; then
        echo "Timestamp, Temperature, AQI" > $FILENAME
        echo "Timestamp,           Temp, AQI"
    fi

    echo "$TIMESTAMP, $DATA" >> $FILENAME
    echo "$TIMESTAMP, $DATA"

    sleep 900
done

