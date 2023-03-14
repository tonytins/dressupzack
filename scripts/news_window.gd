extends Window

@onready var news_list = $News
@onready var http_request = $NewsBtns/HTTPRequest

func _on_HTTPRequest_request_completed(result, response_code, headers, body):
	var test_json_conv = JSON.new()
	test_json_conv.parse(body.get_string_from_utf8())
	var api_request = test_json_conv.get_data()
	
	if api_request["feed"] != null:
		var news_items = api_request["feed"]
		
		for news in news_items:
			news_list.add_item(news)

func _on_SyncBtn_pressed():
	news_list.clear()
	http_request.request(GameData.NEWS_API)
