---
---

dsv = d3.dsv ";", "text/plain"

# show = () ->
# 	console.log graphData
# 	return

dsv "{{ "/assets/graphing.csv" | prepend: site.baseurl }}", (error, data) ->

	prev =
		y12011: 0
		y22011: -50
		y12012: 0
		y22012: -50
		y12013: 0
		y22013: -50
		y12014: 0
		y22014: -50
	separationV = 50

	makePoint = (d) ->
		"C" + d.x1 + "," + d.y1 + " " + d.x2 + "," + d.y2 + " " + d.x + "," + d.y + " "

	pathData = data
		.filter (d) -> d["2011"] != ""
		.map (a, i, as) ->
			return {
				url: a["Fanpage"]
				university: a["Universidade"]
				name: a["Federação"]
				2011: +a["2011"]
				2012: +a["2012"]
				2013: +a["2013"]
				2014: +a["2014"]
			}
		.sort (a, b) ->
			if a["2011"] > b["2011"] # a é menor que b em algum critério de ordenação
				return -1;
			if a["2011"] < b["2011"] # a é maior que b em algum critério de ordenação
				return 1;
			return 0;
		.map (a, i, as) ->
			point =
				url: a.url
				university: a.university
				name: a.name
				y12011: prev["y22011"] + separationV
				y22011: prev["y22011"] + separationV + a["2011"]
				y12012: prev["y22012"] + separationV
				y22012: prev["y22012"] + separationV + a["2012"]
				y12013: prev["y22013"] + separationV
				y22013: prev["y22013"] + separationV + a["2013"]
				y12014: prev["y22014"] + separationV
				y22014: prev["y22014"] + separationV + a["2014"]
			prev = point
			return prev
		.map (a, i, as) ->

			# BEGIN PATH
			string = "M" + 0 + "," + a["y12011"] + " "

			# MAKE POINT 0
			string += makePoint
				x: 0
				y: a["y12011"]
				x1: 0
				y1: a["y12011"]
				x2: 0
				y2: a["y12011"]

			# MAKE POINT 1
			string += makePoint
				x: 50
				y: a["y12011"]
				x1: 50
				y1: a["y12011"]
				x2: 50
				y2: a["y12011"]

			# MAKE POINT 2
			string += makePoint
				x: 100
				y: a["y12012"]
				x1: 100
				y1: a["y12012"]
				x2: 100
				y2: a["y12012"]

			# MAKE POINT 3
			string += makePoint
				x: 150
				y: a["y12012"]
				x1: 150
				y1: a["y12012"]
				x2: 150
				y2: a["y12012"]

			# MAKE POINT 4
			string += makePoint
				x: 200
				y: a["y12013"]
				x1: 200
				y1: a["y12013"]
				x2: 200
				y2: a["y12013"]

			# MAKE POINT 5
			string += makePoint
				x: 250
				y: a["y12013"]
				x1: 250
				y1: a["y12013"]
				x2: 250
				y2: a["y12013"]

			# MAKE POINT 6
			string += makePoint
				x: 300
				y: a["y12014"]
				x1: 300
				y1: a["y12014"]
				x2: 300
				y2: a["y12014"]

			# MAKE POINT 7
			string += makePoint
				x: 350
				y: a["y12014"]
				x1: 350
				y1: a["y12014"]
				x2: 350
				y2: a["y12014"]

			# MAKE POINT 8 -- TURNOVER
			string += makePoint
				x: 350
				y: a["y22014"]
				x1: 350
				y1: a["y22014"]
				x2: 350
				y2: a["y22014"]

			# MAKE POINT 9
			string += makePoint
				x: 300
				y: a["y22014"]
				x1: 300
				y1: a["y22014"]
				x2: 300
				y2: a["y22014"]

			# MAKE POINT 10
			string += makePoint
				x: 250
				y: a["y22013"]
				x1: 250
				y1: a["y22013"]
				x2: 250
				y2: a["y22013"]

			# MAKE POINT 11
			string += makePoint
				x: 200
				y: a["y22013"]
				x1: 200
				y1: a["y22013"]
				x2: 200
				y2: a["y22013"]

			# MAKE POINT 12
			string += makePoint
				x: 150
				y: a["y22012"]
				x1: 150
				y1: a["y22012"]
				x2: 150
				y2: a["y22012"]

			# MAKE POINT 13
			string += makePoint
				x: 100
				y: a["y22012"]
				x1: 100
				y1: a["y22012"]
				x2: 100
				y2: a["y22012"]

			# MAKE POINT 14
			string += makePoint
				x: 50
				y: a["y22011"]
				x1: 50
				y1: a["y22011"]
				x2: 50
				y2: a["y22011"]

			# MAKE POINT 15
			string += makePoint
				x: 0
				y: a["y22011"]
				x1: 0
				y1: a["y22011"]
				x2: 0
				y2: a["y22011"]

			# END PATH
			string += "Z"

			a.path = string
			return a

	colorScale = d3
		.scale
		.category20()

	width = 500
	height = pathData.reduce (prev, a, i, as) ->
				if a["y22011"] > prev
					prev = a["y22011"]
				if a["y22012"] > prev
					prev = a["y22012"]
				if a["y22013"] > prev
					prev = a["y22013"]
				if a["y22014"] > prev
					prev = a["y22014"]
				return prev
			, 0

	svg = d3
		.select ".graph-1"
		.append "svg"
			.attr "height", height
			.attr "width", width

	svg
		.selectAll "path"
		.data pathData
		.enter()
		.append "path"
		.attr "d", (d) -> d.path
		.attr "fill", (d, i) -> colorScale(i)
		.attr "stroke-width", () -> "2"
		.attr "stroke", (d, i) -> colorScale(i)
		.attr "class", (d) -> d.name
# 			
# 	show()
