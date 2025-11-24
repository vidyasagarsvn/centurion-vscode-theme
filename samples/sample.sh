#!/bin/bash
# Bash shell script sample demonstrating all token types and syntax

# Comments
# Single line comment

: '
Multi-line comment using colon and single quotes
This is another way to create multi-line comments
'

# Variables
variable_name="value"
CONSTANT_NAME="CONSTANT_VALUE"
_private_var="private"
var123="can contain numbers"

# Numeric variables
num=42
negative=-100
float=3.14159

# Strings
single_quote='single quoted string'
double_quote="double quoted string"
no_quote=unquoted_string
escape_string="escaped\nstring"
raw_string=$'raw\nstring with escape'

# String interpolation
name="World"
greeting="Hello, $name"
complex="${name}_extended"
command_sub=$(echo "command substitution")
arithmetic=$((10 + 5))

# Arrays
array=(1 2 3 4 5)
array2=([0]="first" [1]="second")
associated_array=()

# Array operations
${array[@]}
${array[0]}
${#array[@]}  # Array length

# Command execution
echo "Output"
ls -la
result=$(pwd)
echo $result

# Here documents
cat <<EOF
This is a here document.
It preserves formatting and
can span multiple lines.
EOF

cat <<'EOF'
This is a here document with no variable expansion.
$variable is not expanded
EOF

# Functions
simple_function() {
    echo "Hello from function"
}

function_with_args() {
    local arg1=$1
    local arg2=$2
    echo "$arg1 $arg2"
}

function_with_return() {
    return 42
}

# Conditionals
if [ $num -eq 42 ]; then
    echo "Number is 42"
elif [ $num -lt 50 ]; then
    echo "Number is less than 50"
else
    echo "Number is 50 or more"
fi

# Test conditions
if [[ $variable_name == "value" ]]; then
    echo "String match"
fi

# Comparison operators
[ $num -eq 42 ]    # Equal
[ $num -ne 42 ]    # Not equal
[ $num -lt 50 ]    # Less than
[ $num -le 50 ]    # Less than or equal
[ $num -gt 30 ]    # Greater than
[ $num -ge 30 ]    # Greater than or equal

# String comparisons
[[ $name == "World" ]]
[[ $name =~ ^W ]]  # Regex match
[[ -z $empty_var ]]    # Is empty
[[ -n $variable_name ]] # Is not empty

# File tests
[ -f "$file" ]     # Is regular file
[ -d "$dir" ]      # Is directory
[ -e "$path" ]     # Exists
[ -x "$script" ]   # Is executable
[ -r "$file" ]     # Is readable
[ -w "$file" ]     # Is writable
[ -s "$file" ]     # Is not empty

# Logical operators
[ $num -gt 30 ] && echo "And"
[ $num -lt 20 ] || echo "Or"
[ ! $num -eq 0 ] && echo "Not"

# Case statement
case $1 in
    start)
        echo "Starting service"
        ;;
    stop)
        echo "Stopping service"
        ;;
    restart)
        echo "Restarting service"
        ;;
    *)
        echo "Unknown command"
        ;;
esac

# Loops
for i in {1..5}; do
    echo "Count: $i"
done

for i in $(seq 1 5); do
    echo "Number: $i"
done

for file in *.txt; do
    echo "File: $file"
done

# C-style for loop
for ((i=0; i<5; i++)); do
    echo "Index: $i"
done

# While loop
counter=0
while [ $counter -lt 5 ]; do
    echo "Counter: $counter"
    ((counter++))
done

# Until loop
count=0
until [ $count -eq 5 ]; do
    echo "Count: $count"
    ((count++))
done

# Break and continue
for i in {1..10}; do
    if [ $i -eq 3 ]; then
        continue
    fi
    if [ $i -eq 7 ]; then
        break
    fi
    echo $i
done

# String operations
str="Hello World"
${str:0:5}           # Substring
${str: -5}           # Last 5 characters
${str/World/Bash}    # Replace
${str/l/L}           # Replace first
${str//l/L}          # Replace all
${str^^}             # Uppercase
${str,,}             # Lowercase

# Parameter expansion
${variable:-default}         # Default value
${variable:=default}         # Assign default
${variable:+alternate}       # Alternate value
${#variable}                 # String length
${!prefix*}                  # Variable names

# Arithmetic operations
echo $((10 + 5))
echo $((10 - 5))
echo $((10 * 5))
echo $((10 / 5))
echo $((10 % 3))
echo $((2 ** 3))

# Let command
let result=10+5
let num++
let num--

# Numeric comparison
if (( num > 5 )); then
    echo "Greater"
fi

# Floating point arithmetic
echo "scale=2; 10 / 3" | bc

# Read input
read -p "Enter name: " user_name
read -s -p "Enter password: " password
read -a array -p "Enter array: "

# Command substitution
current_date=$(date)
backup_dir=backup_$(date +%s)

# Process substitution
diff <(sort file1.txt) <(sort file2.txt)

# Pipes and redirection
grep "pattern" file.txt | sort | uniq
cat input.txt > output.txt
cat input.txt >> output.txt
cat < input.txt > output.txt
command 2> error.txt
command 2>&1
command &> all_output.txt

# Error handling
set -e  # Exit on error
set -u  # Exit on undefined variable
set -o pipefail

trap 'echo "Error on line $LINENO"' ERR

# Function with error handling
safe_function() {
    if ! cd "$1"; then
        echo "Failed to change directory" >&2
        return 1
    fi
}

# Subshell
(cd /tmp && pwd)
result=$( (command1 && command2) || command3 )

# Variable scope
global_var="global"

nested_function() {
    local local_var="local"
    echo $global_var
}

# Exporting variables
export PATH="$PATH:/custom/path"
export LANG=en_US.UTF-8

# Command line arguments
$0              # Script name
$1, $2, ...     # Arguments
$#              # Number of arguments
$*              # All arguments as single string
$@              # All arguments as separate strings
$?              # Exit status of last command
$$              # Process ID
$!              # Process ID of last background job

# Options and getopts
while getopts "f:v" opt; do
    case $opt in
        f) file="$OPTARG" ;;
        v) verbose=true ;;
        \?) echo "Invalid option" ;;
    esac
done

# Comments with special syntax
# TODO: Implement this feature
# FIXME: Fix the bug
# NOTE: Important information
# HACK: Quick workaround

# Main execution
main() {
    echo "Script started"
    simple_function
    echo "Script ended"
}

# Call main
main "$@"
