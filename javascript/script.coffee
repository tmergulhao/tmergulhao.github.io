---
---

# scale.fix.js

metas = document.getElementsByTagName('meta')

if navigator.userAgent.match(/iPhone/i)
  meta.content = "width=device-width, minimum-scale=1.0, maximum-scale=1.0" for meta in metas when meta.name is 'viewport'
  document.addEventListener("gestureStart", gestureStart, false)

gestureStart = () ->
  meta.content = "width=device-width, minimum-scale=0.25, maximum-scale=1.6" for meta in metas when meta.name is 'viewport'
  return

$('h3')
	.click () ->
		$ @
			.children '.hidden'
				.removeClass 'hidden'
	.hover () ->
		$ @
			.children '.hidden'
				.removeClass 'hidden'

$ '.gif img'
	.click () ->
		imgElement = $(@)
		src = imgElement.attr 'src'
		imgElement.attr 'src', ' '
		imgElement.attr 'src', src
		return
