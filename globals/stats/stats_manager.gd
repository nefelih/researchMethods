extends Node

signal stats_updated

var current_stat : int = 50
var max_stats : int = 100
var time_passed : int = Time.get_ticks_msec()
var current_time : int = Time.get_ticks_msec()


func connection():
	current_time = time_passed
	current_stat = max_stats
	stats_updated.emit(current_stat)
	#reset shader, or see how to make it not horrible lol
		
	if (current_stat < 0):
		print("GAME OVER, complete disconnection")
		#create some sort of black out thing/renav to beginning, or depending on interviews add in a quote
	
func disconnection():
	
	#use time function to make this continually decrease current_stat to < 0 unless connection is called
	pass
