$(document).on "turbolinks:load", ->
	$("#winner-display").hide()
	$(".disc.draggable").css("background-color", $(".disc.draggable").data("color"))

	$(".disc.draggable").draggable
		containment: $("body")
		revert: true

	$("#game-board .droppable").droppable
		greedy: true
		accept: ".draggable.disc"
		hoverClass: "droppable-area"
		drop: (event, ui) ->
			color = ui.draggable.data("color")
			occupied_area = null

			for row in [5..0]
				area = $("#area-" + row + "-" + $(this).data("column"))
				
				if not area.hasClass("occupied")
					occupied_area = area
					break

			if occupied_area != null
				$.ajax
					url: "/grids/" + area.data("row") + "/" + area.data("column")
					type: "PATCH"
					dataType: "json"
					success: (data) ->
						occupied_area.addClass("occupied")
						occupied_area.css("background-color", color)
						ui.draggable.data("color", data.current_player_color)
						ui.draggable.css("background-color", data.current_player_color)
						$("#current-player-name").html(data.current_player_name)

						if data.game_winner != null
							$("#disc-container").hide()
							$(".droppable-area").hide()
							$("#winner-display").show()
							$("#winner-name").html(data.game_winner.first_name)