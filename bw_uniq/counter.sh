################################################################################
#                                                                              #
#                                                                              #
#           ./counter.sh journal_uniq_csv journal_year                         #
#                                                                              #
#                                                                              #
################################################################################
declare -a arr
let i=0

#while IFS=$'\n' read -r line_data; do arr[i]="${line_data}"; ((++i)); done < companies_uniq.csv
readarray -t arr < companies_uniq.csv

while (( ${#arr[@]} > i )); do cat business_week_year_abstract.csv | grep -iow "${arr[i]}" | uniq -c; ((++i)); done; i=0 
