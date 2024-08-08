"""
File: double_redirect_detector.py
Author: ChatGPT via Adrian Velonis
Description: Detects double redirects in the list of redirects in "variables.tf". Prints the list to the console.
Usage notes: The script expects you to copy+paste the literal list of keys and values in "variables.tf" into "redirect_list.txt"
             Don't copy+paste the other parts of "variables.tf". Also it handles whitespace.
             For now this just tells you what the double redirects are. It doesn't fix them for you.
"""
import re

def find_double_redirects(file_path):
    # Use sets to keep track of keys and redirects
    keys = set()
    redirects = set()
    
    # Regular expression to extract key and website_redirect from each line
    pattern = re.compile(r'{\s*key\s*=\s*"([^"]+)"\s*,\s*website_redirect\s*=\s*"([^"]+)"\s*}')
    
    # Read the file and extract key and website_redirect
    with open(file_path, 'r') as file:
        for line in file:
            match = pattern.match(line.strip())
            if match:
                key, website_redirect = match.groups()
                keys.add(key)
                redirects.add(website_redirect)
    
    # Find double redirects
    double_redirects = keys.intersection(redirects)
    
    # Print the results
    if double_redirects:
        print("Double redirects found:")
        for redirect in double_redirects:
            print(f"- {redirect}")
    else:
        print("No double redirects found.")

# Path to your file
file_path = 'redirect_list.txt'
find_double_redirects(file_path)
