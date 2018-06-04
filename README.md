# yt

cat companies.csv | sed -E -e 's/, /,/g' | sed -E -e 's/,/\n/g' | sed -E -e 's/\s+$//g' | sed -E -e 's/ Inc.//g' | sed -E -e 's/ Inc//g' | sort | uniq  > companies_uniq.csv

for company in ${a[@]}; do grep -io "$company" abstracts.txt | uniq -ic; done
