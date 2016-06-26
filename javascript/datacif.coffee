---
---

# Radial Reingold–Tilford Tree
# http://bl.ocks.org/mbostock/4063550

diameter = 500

tree = d3.layout.tree()
    .size [360, diameter / 2 - 10]# - 120]
    .separation (a, b) ->
    	(a.parent == b.parent ? 1 : 2) / a.depth

diagonal = d3.svg.diagonal.radial()
    .projection (d) ->
    	[d.y, d.x / 180 * Math.PI]

svg = d3.select "div.complexity-graph.cif"
	.append "svg"
	    .attr "width", diameter
	    .attr "height", diameter # - 150
		.append "g"
	    	.attr "transform", "translate(" + diameter / 2 + "," + diameter / 2 + ")"

d3
	.json "{{ "datacif-cif-prototype.json" | prepend: "assets/" | prepend: site.baseurl }}", (error, cif) ->
		if error
			throw error

		cif.children = cif.sections
		cif.children.forEach (section, i, sections) ->
			section.children = section.chapters
			section.children.forEach (chapter, i, chapters) ->
				chapter.namespace = section.namespace
				if chapter.subchapters != undefined
					chapter.children = chapter.subchapters
					chapter.children.forEach (subchapter, i, subchapters) ->
						subchapter.namespace = section.namespace
						if subchapter['qualifiers-1'] != undefined
							subchapter.children = subchapter['qualifiers-1']

							subchapter.children.forEach (qual1, i, qual1s) ->
								qual1.namespace = section.namespace
								if qual1['qualifiers-2'] != undefined
									qual1.children = qual1['qualifiers-2']

									qual1.children.forEach (qual2, i, qual2s) ->
										qual2.namespace = section.namespace
										if qual2['qualifiers-3'] != undefined
											qual2.children = qual2['qualifiers-3']

											qual2.children.forEach (qual3, i, qual3s) ->
												qual3.namespace = section.namespace
												if qual3['qualifiers-4'] != undefined
													qual3.children = qual3['qualifiers-4']

													qual3.children.forEach (qual4, i, qual4s) ->
														qual4.namespace = section.namespace
														if qual4['qualifiers-4'] != undefined
															qual4.children = qual4['qualifiers-4']
				if chapter['qualifiers-1'] != undefined
					chapter.children = chapter['qualifiers-1']

					chapter.children.forEach (qual1, i, qual1s) ->
						qual1.namespace = section.namespace
						if qual1['qualifiers-2'] != undefined
							qual1.children = qual1['qualifiers-2']

							qual1.children.forEach (qual2, i, qual2s) ->
								qual2.namespace = section.namespace
								if qual2['qualifiers-3'] != undefined
									qual2.children = qual2['qualifiers-3']

									qual2.children.forEach (qual3, i, qual3s) ->
										qual3.namespace = section.namespace
										if qual3['qualifiers-4'] != undefined
											qual3.children = qual3['qualifiers-4']

											qual3.children.forEach (qual4, i, qual4s) ->
												qual4.namespace = section.namespace
												if qual4['qualifiers-4'] != undefined
													qual4.children = qual4['qualifiers-4']

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
			.attr "r", 4.5

# 		node
# 			.append "text"
# 				.attr "dy", ".31em"
# 				.attr "text-anchor", (d) ->
# 					d.x < 180 ? "start" : "end"
# 				.attr "transform", (d) ->
# 					d.x < 180 ? "translate(8)" : "rotate(180)translate(-8)"
# 				.text (d) ->
# 					d.name

		cif.sections.map (section, i, sections) ->
			svg = d3.select "div.complexity-graph.namespace-" + section.namespace
				.append "svg"
				    .attr "width", diameter
				    .attr "height", diameter # - 150
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
				.attr "r", 4.5

d3
	.select self.frameElement
	.style "height", diameter - 150 + "px"
