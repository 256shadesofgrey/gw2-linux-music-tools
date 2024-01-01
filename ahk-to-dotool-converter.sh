#!/bin/bash

if [ -z $1 ]; then
  echo "Usage: "$0" input.ahk > output.sh"
  exit
fi

# Print the mandatory first line.
echo "#!/bin/bash"
echo "sleep 3"

# Read input file | use regular numbers instead of numpad |
# convert sleep command from ahk format to bash |
# convert sleep ms to s |
# remove brackets |
# replace keypress with the corresponding dotool command |
# replace keydown with the corresponding dotool command |
# replace keyup with the corresponding dotool command
cat $1 | awk '{sub(/Numpad/, "")}{print}' |
  awk '{sub(/Sleep,/, "sleep")}{print}' |
    awk '{if($1 == "sleep") $2=$2/1000}{print}' |
      awk '{gsub(/(\{|\})/, "")}{print}' |
        awk '{if($1 == "SendInput" && $3 == "") {$1 = "echo key "$2" | dotoolc"; $2 = ""}}{print}' |
          awk '{if($1 == "SendInput" && $3 == "down") {$1 = "echo keydown "$2" | dotoolc"; $2 = ""; $3 = ""}}{print}' |
            awk '{if($1 == "SendInput" && $3 == "up") {$1 = "echo keyup "$2" | dotoolc"; $2 = ""; $3 = ""}}{print}'
