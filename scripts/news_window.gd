extends WindowDialog

const _NEWS_API = "https://static.tonybark.com/news/dressup.json"

onready var news_list = $News
onready var http_request = $NewsBtns/HTTPRequest

func _on_HTTPRequest_request_completed(result, response_code, headers, body):
	var api_request = parse_json(body.get_string_from_utf8())
	
	if api_request["feed"] != null:
		var news_items = api_request["feed"]
		
		for news in news_items:
			news_list.add_item(news)

func _on_SyncBtn_pressed():
	news_list.clear()
	http_request.request(_NEWS_API)
