---
---

# Radial Reingold–Tilford Tree
# http://bl.ocks.org/mbostock/4063550

diameter = 500

tree = d3.layout.tree()
    .size [360, diameter / 2 - 3]# - 120]
    .separation (a, b) ->
    	(a.parent == b.parent ? 1 : 2) / a.depth

diagonal = d3.svg.diagonal.radial()
    .projection (d) ->
    	[d.y, d.x / 180 * Math.PI]

d3
	.json "{{ "datacif-cif-prototype.json" | prepend: "/assets/" | prepend: site.baseurl }}", (error, cif) ->
		if error
			throw error

		namespace = undefined

		makeTree = (node, i, siblings) ->
			if node.namespace != undefined
				namespace = node.namespace
			else if namespace != undefined
				node.namespace = namespace

			node.children = ["sections", "chapters", "subchapters", "qualifiers-1", "qualifiers-2", "qualifiers-3", "qualifiers-4"]
				.reduce (prev, a, i, as) ->
					prev = node[a] if node[a] != undefined
					return prev
				, undefined

			node.children.forEach makeTree if node.children != undefined

			return node.children

		cif.children = makeTree cif, 0, undefined

		svg = d3.select ".complexity-graph.cif .fig-canvas"
			.append "svg"
				.attr "viewBox", "0 0 " + diameter + " " + diameter
				.attr "preserveAspectRatio", "xMidYMid meet"
				.append "g"
			    	.attr "transform", "translate(" + diameter / 2 + "," + diameter / 2 + ")"

		nodes = tree.nodes cif
		links = tree.links nodes

		link = svg
			.selectAll ".link"
			.data links
			.enter()
			.append "path"
				.attr "class", "link"
				.attr "d", diagonal

		node = svg
			.selectAll ".node"
			.data nodes
			.enter()
			.append "g"
				.attr "class", (d) ->
					"node namespace-" + d.namespace
				.attr "transform", (d) ->
					"rotate(" + (d.x - 90) + ")translate(" + d.y + ")"

		node
			.append	"circle"
				.attr "r", (d) ->
					lastDigit = (+d.code)%10
					return 2.5 if lastDigit is 9 or lastDigit is 8
					return 3.5
				.attr "class", (d) ->
					return "group" if d.code == undefined
					lastDigit = (+d.code)%10
					return "minor" if lastDigit is 9 or lastDigit is 8

# 		node
# 			.append "text"
# 				.attr "dy", ".31em"
# 				.attr "text-anchor", (d) ->
# 					d.x < 180 ? "start" : "end"
# 				.attr "transform", (d) ->
# 					d.x < 180 ? "translate(8)" : "rotate(180)translate(-8)"
# 				.text (d) ->
# 					d.name

		cif.children.forEach (section, i, sections) ->
			svg = d3.select ".complexity-graph.namespace-" + section.namespace + " .fig-canvas"
				.append "svg"
				    .attr "viewBox", "0 0 " + diameter + " " + diameter
					.attr "preserveAspectRatio", "xMidYMid meet"
					.append "g"
				    	.attr "transform", "translate(" + diameter / 2 + "," + diameter / 2 + ")"

			nodes = tree.nodes section
			links = tree.links nodes

			link = svg
				.selectAll ".link"
				.data links
				.enter()
				.append "path"
					.attr "class", "link"
					.attr "d", diagonal

			node = svg
				.selectAll ".node"
				.data nodes
				.enter()
				.append "g"
					.attr "class", (d) ->
						"node namespace-" + d.namespace
					.attr "transform", (d) ->
						"rotate(" + (d.x - 90) + ")translate(" + d.y + ")"

			node
				.append	"circle"
				.attr "r", (d) ->
					lastDigit = (+d.code)%10
					return 2.5 if lastDigit is 9 or lastDigit is 8
					return 3.5
				.attr "class", (d) ->
					return "group" if d.code == undefined
					lastDigit = (+d.code)%10
					return "minor" if lastDigit is 9 or lastDigit is 8

			return

d3
	.select self.frameElement
	.style "height", diameter - 150 + "px"
