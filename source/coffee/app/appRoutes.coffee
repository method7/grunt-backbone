# Define routes
AppRouter = Backbone.Router.extend(routes:
	"": "home" # matches http://example.com/
)

# Initiate the router
app_router = new AppRouter
app_router.on "route:home", ->
	console.log "ON HOME"
	# load the view
	$.getJSON("json/home.json", ->
		return
	).done((json) ->
		homeTemplate = gruntBuildProject.templates["article"]
		document.querySelector("#homepage").innerHTML = homeTemplate json.data

	).fail (jqxhr, textStatus, error) ->
		err = textStatus + ", " + error
		console.log "Request Failed: " + err
		return
	return