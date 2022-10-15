#!/bin/bash

# Prints the value to the terminal
echo "Hello User"

# Basic variable declaration
my_string_var="String"
my_number_var=5
my_true_bool_var=True
my_false_bool_var=False

# Basic IF statement structure; notice I'm using the variable with a `$` preceeding it.
if [-z $my_string_var ]
    then
        echo "My Value is TRUE"
    else
        echo "My Value is FALSE"
fi

# Basic FOR LOOP structure
for i in {1..5} # this is a number range from 0 to 5
    do
        echo "Hello number $i!"
    done

# Basic While statement structure
while [ $my_number_var -lt 5 ]
do
   counter=$(( $my_number_var - 1 ))
   echo "$my_number_var"
done

# Get all files ending with '.yml' and then move them into a new directory for '.yml' files
mkdir yaml_files_dir
for $i in $(ls *.yml)
do
    mv $i ./yaml_files_dir/$i
done
