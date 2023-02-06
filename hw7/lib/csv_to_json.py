import csv
import json

csv_file = open("./tambon_chiangmai.csv", "r")
json_file = open("./tambon_chiangmai.json", "w")

reader = csv.DictReader(csv_file)
out = json.dumps([row for row in reader])

json_file.write(out)

csv_file.close()
json_file.close()
