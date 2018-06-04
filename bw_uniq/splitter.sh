################################################################################
#                                                                              #
#                                                                              #
#           ./splitter.sh journal_year_abstract.csv journal_name               #
#                                                                              #
#                                                                              #
################################################################################


year_abstract_csv=$1
journal=$2

for year in $(awk -F^ '{print $1}' $year_abstract_csv | uniq); do
  awk -v year="$year" -F^ '$1==year {print $2}' $year_abstract_csv >> $journal"_"$year.txt
done
