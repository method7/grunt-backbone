class AppData
  @app: ->
    return (window || document).appview

  @VIEW_DATA: (view) ->
    data = null
    if view is 'home'
      data = 
        title: 'My First Post'
        date: '10/10/2013'
    else 
      console.log 'AppData.viewData data missing'
    return data

  @HOME_DATA: ->
    data = 
      title: 'My First Post'
      date: '10/10/2013'
    return data

  @HEADER_DATA: ->
    data = 
      nav: [
        {
          title: "Header 1"
          url: '/'
        }
        {
          title: "Header 2"
          url: 'page2'
        }
        {
          title: "Header 3"
          url: 'page3'
        }
        {
          title: "Header 4"
          url: 'page4'
        }
        {
          title: "Header 5"
          url: 'page5'
        }
      ]
    return data

  @NAV_DATA: ->
    data = 
      nav: [
        {
          title: "First post"
        }
        {
          title: "Second post"
          url: 'page2'
        }
        {
          title: "Third post"
          url: 'page3'
        }
        {
          title: "Fourth post"
          url: 'page4'
        }
        {
          title: "Fith post"
          url: 'page5'
        }
      ]
    return data

  @FOOTER_DATA: ->
    data = 
      nav: [
        {
          title: "Footer 1"
          url: '/'
        }
        {
          title: "Footer 2"
          url: 'page2'
        }
        {
          title: "Footer 3"
          url: 'page3'
        }
        {
          title: "Footer 4"
          url: 'page4'
        }
        {
          title: "Footer 5"
          url: 'page5'
        }
      ]
    return data