import os
import datetime

def check_older_objects(directory_paths, file_age_minutes, log_file_location):
    # Get the current date and time
    now = datetime.datetime.now()
    
    # Get the date
    date_str = now.strftime("%Y-%m-%d")
    
    # log file location
    log_file_location = log_file_location + "file_processing_monitor_" + date_str + ".log"

    # Iterate over the list of directory paths
    for directory_path in directory_paths:
        # Count the number of files in the directory
        num_files = len([f for f in os.listdir(directory_path) if os.path.isfile(os.path.join(directory_path, f))])
        
        # Break if the directory is empty
        if len(os.listdir(directory_path)) == 0:
            break
        # Get the timestamp for the oldest file in the directory
        oldest_file_timestamp = datetime.datetime.fromtimestamp(min(os.path.getmtime(os.path.join(directory_path, f)) for f in os.listdir(directory_path)))

        # Check if the age of the oldest file in the directory exceeds the specified age
        file_age_threshold = now - datetime.timedelta(minutes=file_age_minutes)

        if oldest_file_timestamp < file_age_threshold:
            # Count the number of files older than the specified age
            num_old_files = len([f for f in os.listdir(directory_path) if os.path.isfile(os.path.join(directory_path, f)) and (now - datetime.datetime.fromtimestamp(os.path.getmtime(os.path.join(directory_path, f)))) > datetime.timedelta(minutes=file_age_minutes)])

            # Write to the log file
            with open(log_file_location, "a") as log_file:
                log_file.write(f"{now} - ALERT: File_Processing_Stuck - Number of files older than {file_age_minutes} minutes in {directory_path}: {num_old_files}\n")
        else:
            # Write to the log file
            with open(log_file_location, "a") as log_file:
                log_file.write(f"{now} - Number of Files in {directory_path}: {num_files}. The oldest file in {directory_path} is not older than {file_age_minutes} minutes.\n")


def check_file_count_error_folder(folder_locations, threshold, log_file_location):
    # Get the current date and time
    now = datetime.datetime.now()
    
    # Get the date
    date_str = now.strftime("%Y-%m-%d")
    
    # log file location
    log_file_location = log_file_location + "file_processing_monitor_" + date_str + ".log"
    
    for location in folder_locations:
        file_count = len(os.listdir(location))
        if file_count >= threshold:
            # Write to the log file
            with open(log_file_location, "a") as log_file:
                log_file.write(f"{now} - ALERT: Files_in_Error_Folder - Number of files in Error Folder {location}: {file_count}\n")
           
# Call the function check_older_objects to check for files older than X minutes in specific directory
# Path is an array, you can add multiple directories
# log directory location is 3rd parameter
# check_older_objects(["/home/ec2-user/test","/home/ec2-user/test1"], 10, "/home/ec2-user/test/log/") --> This will check for files older than 10 minutes in "/home/ec2-user/test","/home/ec2-user/test1" directory and write log to "/home/ec2-user/test/log/"

check_older_objects(["/mnt/efs/data/insurance/batch/stage"], 10, "/root/fb_monitor/log_time/")
check_older_objects(["/mnt/efs/data/insurance/batch/incoming/hermes/vendorreply"], 300, "/root/fb_monitor/log_time/")
check_older_objects(["/mnt/efs/data/insurance/batch/outgoing/mnl/xml", "/mnt/efs/data/insurance/batch/outgoing/mnl/zip"], 3600, "/root/fb_monitor/log_time/")


# Call the function check_file_count_error_folder to check for files in "Error" directory
# Path is an array, you can add multiple directories
# threshold is second parameter, set this to alert when number of files in error folder more than threshold
# log directory location is 3rd parameter
# check_file_count_error_folder(["/home/ec2-user/error1","/home/ec2-user/error2"], 1, "/home/ec2-user/test/log/") --> This will check for files more than equal to one in "/home/ec2-user/error1","/home/ec2-user/error2" directory and write log to "/home/ec2-user/test/log/"

check_file_count_error_folder(["/mnt/efs/data/insurance/batch/error/"], 0, "/root/fb_monitor/log_count/")