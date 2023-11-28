#!/bin/bash

# Function to display help
display_help() {
  echo "Usage: replace.sh -f|-p|-w pattern_from pattern_to"
  echo "  -f: Find occurrences of pattern_from and show matching lines"
  echo "  -p: Preview changes (no actual modification)"
  echo "  -w: Write changes to files"
  echo "  -h: Display help"
  echo ""
  echo "Example:"
  echo "  ./replace.sh -f \"http://molnia.pro\""
  echo "  ./replace.sh -p \"http://molnia.pro\" \"https://molnia.artilekt.ru\""
  echo "  ./replace.sh -w \"http://molnia.pro\" \"https://molnia.artilekt.ru\""
  echo "  ./replace.sh -h"
  # exit 0
}
# debug_opts(){
# }

while getopts ":f:p:w:h" opt; do
  case $opt in
    f) action="find" ;;
    p) action="preview" ;;
    w) action="write" ;;
    h) display_help ;;
    \?) echo "Invalid option: -$OPTARG" >&2 ; exit 1 ;;
  esac
done

# shift $((OPTIND-1))


# Check for the correct number of arguments
if [ "$1" != "-f" ] && [ "$1" != "-h" ] && [ "$#" -ne 3 ]; then
  echo "Ошибка: ожидалось 3 аргумента (первый аргумент не -f и аргументов не -3)"
      echo "Error: Expected exactly two arguments (pattern_from and pattern_to)"
    echo ""
    echo "Аргументов: $#, вместо 3"
    echo "Remaining arguments: $@"
    echo "  \$0 = $0"
    echo "  \$1 = $1"
    echo "  \$2 = $2"
    echo "  \$3 = $3"
    echo ""
    # exit 1

  display_help
  exit 1
elif [ "$1" = "-h" ] && [ "$#" -ne 1 ]; then

  echo "Ошибка: ожидалось 2 аргумента (первый аргумент -f и аргументов не 2)"
    echo "Error: Expected exactly two arguments (pattern_from and pattern_to)"
    echo ""
    echo "Аргументов: $#, вместо 2"
    echo "Remaining arguments: $@"
    echo "  \$0 = $0"
    echo "  \$1 = $1"
    echo "  \$2 = $2"
    echo "  \$3 = $3"
    echo ""
    # exit 1

  display_help
  exit 1
elif [ "$1" = "-f" ] && [ "$#" -ne 2 ]; then
  echo "Ошибка: ожидалось 2 аргумента (первый аргумент -f и аргументов не 2)"
    echo "Error: Expected exactly two arguments (pattern_from and pattern_to)"
    echo ""
    echo "Аргументов: $#, вместо 2"
    echo "Remaining arguments: $@"
    echo "  \$0 = $0"
    echo "  \$1 = $1"
    echo "  \$2 = $2"
    echo "  \$3 = $3"
    echo ""
    # exit 1

  display_help
  exit 1
fi

pattern_from="$2"
pattern_to="$3"

case $action in
  "find")
    # echo $pattern_from $pattern_to
    # grep -Erl --include="*.js" --include="*.php" "$pattern_from" . | xargs sed "s%$pattern_from%$pattern_to%g" | grep -E "$pattern_from"
    grep -Er --include="*.js" --include="*.php" "$pattern_from" .
    ;;
  "preview")
    grep -Erl --include="*.js" --include="*.php" "$pattern_from" . | xargs sed -r "s%$pattern_from%$pattern_to%g" | grep -E "$pattern_to"
    ;;
  "write")
    # grep -Erl --include="*.js" --include="*.php" "$pattern_from" . | xargs sed -i "s%$pattern_from%$pattern_to%g" | grep -E "$pattern_to"
    grep -Erl --include="*.js" --include="*.php" "$pattern_from" . | xargs sed -i "" -E "s%$pattern_from%$pattern_to%g" | grep -E "$pattern_to"
    ;;
esac
