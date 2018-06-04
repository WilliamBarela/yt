################################################################################
#                                                                              #
#                                                                              #
#           ./counter.sh companies_uniq_csv journal_year                       #
#                                                                              #
#                                                                              #
################################################################################
companies_uniq_csv=$1
journal_year=$2

declare -a companies
let i=0

#while IFS=$'\n' read -r line_data; do arr[i]="${line_data}"; ((++i)); done < companies_uniq.csv
readarray -t companies < $companies_uniq_csv

while (( ${#companies[@]} > i )); do cat $journal_year | grep -iow "${companies[i]}" | uniq -c; ((++i)); done; i=0 
