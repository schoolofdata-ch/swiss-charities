setup:
	sudo dnf install jq nodejs
	npm install json2csv -g

aggregate:
	jq 'reduce .hits as $$s (.results[0]; .hits += $$s)' data/p*.json > data/hits.json
	jq '.hits' data/hits.json > data/data.json
	json2csv -i data/data.json -o data/data.csv -F -f post_id,post_type,post_title,post_date_formatted,permalink,intro_text
