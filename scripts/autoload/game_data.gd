# This project is licensed under the Artistic-2.0 license.
# See the LICENSE file in the project root for more information.
extends Node

var version = "0.0.0"

const NEWS_API = "https://static.tonybark.com/news/dressup.json"

var top = null
var bottom = null
var underwear = null
var accessory = null

enum characters {
	ZACK,
	ANTHONY
}
