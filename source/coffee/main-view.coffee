App =
	init: ->
		post =
			title: 'My First Post',
			date: '12/03/2014'

		postTemplate = gruntBuildProject.templates['me'];

		html = postTemplate(post);
		document.querySelector("#body").innerHTML = html;
do App.init