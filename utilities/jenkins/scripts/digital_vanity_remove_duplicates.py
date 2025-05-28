import subprocess
import sys

vanity_source_file = sys.argv[1]
vanity_duplicate_check_file = sys.argv[2]

# Open the duplicate check file
duplicate_fp = open(vanity_duplicate_check_file, 'r')

# Read the contents of source vanity file
with open(vanity_source_file, 'r') as vanity_fp:
    vanity_file_contents = vanity_fp.read()

count = 0

# Search for duplicates and remove the line from vanity source using sed command
for line in duplicate_fp:
    count += 1
    search_string = ('"(?i)^/' + line + '$"').replace("\n", "")
    if count % 500 == 0:
        print ("Current line : {}".format(line.replace("\n", "")))
        print ("Number of lines processed : {}".format(count))
    if search_string in vanity_file_contents:
        sed_input = "\|" + search_string + "|d"
        subprocess.run(["sed", "-i", sed_input, vanity_source_file])

# Close the duplicate check file
duplicate_fp.close()