#import app.appRoutes
#import app.appData
class AppView
	@userAgent: navigator.userAgent
	@isDesktop: !navigator.userAgent.match /(iPhone|iPod|iPad|Android|BlackBerry|BB10|mobi|tablet|opera mini|nexus 7)/i
	@isMobile: if /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(@userAgent) then true else false 
	@isAndroid: if /Android/i.test(@userAgent) then true else false
	@isIos: if /iPhone|iPad|iPod/i.test(@userAgent) then true else false
	

	startup: ->
		#setup the site
		console.log('started :-)')
		
		
		# Start Backbone history a necessary step for bookmarkable URL's
		Backbone.history.start()

		# build the site
		@buildSite()
		null

	buildSite: ->
		
		@buildHeader()
		@buildNav()
		@buildFooter()

		console.log AppView.isIos + ' Header, Nav and footer populated' 
		
		null

	buildHeader: () ->
		headerTemplate = gruntBuildProject.templates["u-link-list"]
		document.querySelector("#header").innerHTML = headerTemplate AppData.HEADER_DATA()

	buildNav: () ->
		navTemplate = gruntBuildProject.templates["o-link-list"]
		document.querySelector("#nav").innerHTML = navTemplate AppData.NAV_DATA()

	buildFooter: () ->
		footerTemplate = gruntBuildProject.templates["u-link-list"]
		document.querySelector("#footer").innerHTML = footerTemplate AppData.FOOTER_DATA()