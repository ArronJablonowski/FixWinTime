# FixWinTime

## Overview
FixTime.bat is a simple batch script designed to set or fix the Windows time, particularly useful when dual-booting between Windows and Linux systems. Linux distributions can 
interfere with the system clock in Windows, leading to inaccurate time settings.

### Purpose
- Automatically configure Windows timezone.
- Synchronize the system clock with a more accurate setting using `w32tm`.

## Usage Instructions
1. **Edit the Script**: Open `FixTime.bat` and uncomment/comment out the desired timezone from the list provided:
    ```batch
    tzutil /s "Mountain Standard Time"
    ```
    
2. **Run the Script**:
   - Double-click the script. It will automatically elevate to admin.
   - If UAC is enabled, you will have to approve it's execution. 

## Supported Timezones
- Eastern Standard Time
- Central Standard Time
- Mountain Standard Time
- Arizona (without Daylight Saving Time)
- Pacific Standard Time
- Alaskan Standard Time
- Hawaiian Standard Time

## Notes
- Ensure you are logged in with administrative privileges to run the script successfully.
- This batch script assumes that your system has network access for time synchronization.
