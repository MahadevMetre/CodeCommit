import pandas as pd
import re
import sys

def main():
    def prRed(skk): print("\033[91m{}\033[00m" .format(skk))
    def prGreen(skk): print("\033[92m{}\033[00m" .format(skk))
    def prYellow(skk): print("\033[93m{}\033[00m" .format(skk))
    def prLightPurple(skk): print("\033[94m{}\033[00m" .format(skk))
    def prPurple(skk): print("\033[95m{}\033[00m" .format(skk))
    def prCyan(skk): print("\033[96m{}\033[00m" .format(skk))
    def prLightGray(skk): print("\033[97m{}\033[00m" .format(skk))
    def prBlack(skk): print("\033[98m{}\033[00m" .format(skk))

    input_file = sys.argv[1]
    output_file = sys.argv[2]
    invalid_from_file = sys.argv[3]
    invalid_to_file = sys.argv[4]
    duplicates_file = sys.argv[5]

    dataframe1 = pd.read_excel(input_file)
    df_dict = dataframe1.to_dict()

    if str(list(df_dict.items())[0][0]) != 'From' or str(list(df_dict.items())[1][0]) != 'To':
        prRed("'From' or 'To' field not found in the excel sheet.")
        sys.exit()

    FromURL = df_dict['From']
    ToURL = df_dict['To']

    allowed_chars = "[^a-zA-Z0-9\&\-\_]"
    start_with_alphanum="^[a-zA-Z0-9]"
    end_with_alphanum="[a-zA-Z0-9]$"
    atleast_one_alphabet="[a-zA-Z]"
    invalid_from_found=False

    with open(invalid_from_file, 'w', newline='\n') as fp:
        fp.write("# start of invalid_from_file\n")
        for key, val in FromURL.items():
            if (re.search(allowed_chars, str(val)) == None and \
            re.search(start_with_alphanum, str(val)) != None and \
            re.search(end_with_alphanum, str(val)) != None and \
            re.search(atleast_one_alphabet, str(val)) != None and \
            str(val) != "nan" and \
            len(str(val)) > 2):
                # prGreen("{} is a valid 'From' format.".format(str(val)))
                pass
            else:
                prRed("{} is an invalid 'From' format.".format(str(val)))
                invalid_from_found=True
                fp.write("%s\n" % str(val))

    if invalid_from_found == True:
        prRed("Invalid entries found in the 'From' field.")
        sys.exit()

    invalid_to_found=False

    with open(invalid_to_file, 'w', newline='\n') as fp:
        fp.write("# start of invalid_to_file\n")
        for (key, value), (key2, value2) in zip(FromURL.items(), ToURL.items()):
            if (("https://" in str(value2) or "http://" in str(value2)) and (" " not in str(value2) and str(value2) != "nan")):
                # prGreen("{} is a valid 'To' URL format.".format(str(value2)))
                pass
            else:
                prRed("{} is an invalid 'To' URL format.".format(str(value2)))
                invalid_to_found=True
                fp.write("%s -> %s\n" % (str(value), str(value2)))

    if invalid_to_found == True:
        prRed("Invalid URL format found in the 'To' field.")
        sys.exit()

    # Check for duplicates in FromURL
    temp_list = []
    result = dict()
    for key, val in FromURL.items():
        if val not in temp_list:
            temp_list.append(val)
            result[key] = val

    if(FromURL == result):
        try:
            Comment = list(df_dict.items())[2][0].strip()
        except IndexError:
            Comment = "Generic comment added by script"

        with open(output_file, 'w', newline='\n') as fp:
            fp.write("# %s\n" % (Comment))
            for (key, value), (key2, value2) in zip(FromURL.items(), ToURL.items()):
                fp.write("rewrite \"(?i)^/%s$\" %s redirect;\n" % (str(value).lower(), str(value2).strip()))
    else:
        set1 = set(FromURL.items())
        set2 = set(result.items())
        difference=sorted(set1 ^ set2)
        with open(duplicates_file, 'w', newline='\n') as fp:
            for val in difference:
                fp.write("%s\n" % str(val[1]))

if __name__ == "__main__":
    main()