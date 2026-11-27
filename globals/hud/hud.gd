extends CanvasLayer

func _ready() -> void:
	StatsManager.stats_updated.connect(_update_stats)
	$Stats.value = 50.0
	print($Stats.value)
	#connect to stats manager, each stat has a base level, based on keywords from interviews affect each stat differently <- later scope things
	#for now, all stats move the same and the reset exists for all of them
	
func _update_stats(new_stats : int) -> void:
	$Stats.value = new_stats
	print("stats value: ", $Stats.value)
	#does not return anything, update all texture progress bars to be max stats when memory object is collected
	
