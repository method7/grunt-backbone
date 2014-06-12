((Handlebars) ->

	Handlebars.registerHelper "plusOne", (number) ->
		return number + 1

	Handlebars.registerHelper "eachfirstlast", (arr, options) ->
	 
		if options.inverse and not arr.length
			return options.inverse(this)
		item = new String(item) if typeof item is 'string'
		arr.map((item, index) ->
			item.$index = index
			item.$first = index is 0
			item.$last = index is arr.length - 1
			options.fn item
		).join ''

	Handlebars.registerHelper "isCarousel", (arr) ->
		if arr and arr.length > 1
			console.log("isCarousel", arr.length)
			return ' carousel'
		else
			return ' heroImage'
		null

	Handlebars.registerHelper "list", (arr, options) ->
		if arr and arr.length > 1
			h = options.hash
			f = 0
			g = arr.length
			while f < g
				atts = ''
				for k of h
					atts += k + '="' + h[k]  + '" '
				f++
			
			ret = '<ul ' + atts + '>'
			i = 0
			j = arr.length
			while i < j
				ret = ret + '<li>' + options.fn(arr[i]) + '</li>'
				i++
			ret + '</ul>'
		else
			ret = ''
			i = 0
			j = arr.length

			while i < j
				ret = ret + options.fn(arr[i])
				i++
			ret


) window.Handlebars


# for serialising form data to js object for posting to: https://www.youtube.com/watch?v=FZSjvWtUxYk
$.fn.serializeObject = ->
	o = {}
	a = @serializeArray()
	$.each a, ->
	if o[@name] isnt `undefined`
		o[@name] = [o[@name]]  unless o[@name].push
		o[@name].push @value or ""
	else
		o[@name] = @value or ""
	return

	o