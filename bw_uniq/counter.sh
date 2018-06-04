################################################################################
#                                                                              #
#                                                                              #
#           ./counter.sh companies_uniq_csv journal_year                       #
#                                                                              #
#                                                                              #
################################################################################
companies_uniq_csv=$1
journal_year=$2

journal_year_extension="${journal_year##*.}"
journal_year_string="${journal_year%.*}"

journal=$(echo $journal_year_string | sed -E -e 's/(.*)_(.*)/\1/')
year=$(echo $journal_year_string | sed -E -e 's/(.*)_(.*)/\2/')

function format_to_csv () {

  #echo "$1";
  count_wo_spaces=$(echo "$1" | sed -E -e 's/\s+/,/g'); #| awk -F, '{print $2" : " $3}');
  # echo "$count_wo_spaces" # > $journal"_"count.csv
  count=$(echo "$count_wo_spaces" | awk -F, '{print $2","$3}' OFS=",");
  echo "$journal,$year,$count" >> $journal"_"count.csv;
}

declare -a companies
let i=0

#while IFS=$'\n' read -r line_data; do arr[i]="${line_data}"; ((++i)); done < companies_uniq.csv
readarray -t companies < $companies_uniq_csv

while (( ${#companies[@]} > i )); do 
  company_count=$(cat $journal_year | grep -iow "${companies[i]}" | uniq -c);
  [[ ! -z "$company_count" ]] && format_to_csv "$company_count";
  ((++i)); 
done; i=0 


echo "journal: $journal"
echo "year: $year"

# echo $journal_year_string

