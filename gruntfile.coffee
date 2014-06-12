# ---------------------------------
# IMPORTS
# ---------------------------------
globals = require './grunt/globals'
utils   = require './grunt/utils'

# helper methods
# converts an array of EVEN length to a hash/key object.
# useful for the sass compile as <% %> coffee syntax is out of scope when executed inside Gruntfile.coffee
helpers =
  arrayToHash: (array)->
    i = 0
    hash = {}
    while i < array.length
      hash[ array[i] ] = array[i+1]
      i+=2

    hash

module.exports = (grunt) ->

  grunt.initConfig
    pkg: grunt.file.readJSON("package.json")
    
    banners:
      credits: "/**\n * method7 <%= pkg.name %>-<%= pkg.version %> <%= grunt.template.today('dd/mm/yyyy') %>\n * @author: <%= pkg.authors %>\n **/\n"

    # watch for changes in files
    watch:
      files: [
        'gruntfile.coffee'
        'grunt/*.coffee'
        'source/json/*'
        'source/templates/*.html'
        'source/coffee/*.coffee'
        'source/coffee/**/*.coffee'
        'source/js/*.js'
        'source/**/*.scss'
        'source/sass/default.scss'
      ]
      tasks: ['devtasks'] 

    # percolator compile coffee files.
    percolator:
      app:
        source: 'source/coffee'
        output: 'deploy/static/js/app.js'
        main: 'app.coffee' # use app.coffee to extend applocation
        compile: true
      helper:
        source: 'source/coffee'
        output: 'deploy/static/js/helpers.js'
        main: 'helpers.coffee' # use helpers.coffee to store handlebars helper methods and jQuery functions
        compile: true
            
    # compile handlebars templates - http://danburzo.ro/grunt/chapters/handlebars/
    handlebars: 
      options:
        namespace: '<%= pkg.name %>.templates'
        processName: (filePath) ->
          return filePath.replace(/^source\/templates\//, '').replace(/\.html$/, '')
      all: 
        files:
          "deploy/static/js/templates.js": ["source/templates/**/*.html"]

    # compile sass
    sass:
      dist:
        options:
          noCache: true
        files:
          'deploy/static/css/style.css': 'source/scss/default.scss'

    # concat vendors
    #concat:
      #vendors:
        #src: ['source/vendors/*.js'],
        #dest: 'deploy/static/js/vendors.js'
    
    # concat vendors
    concat:
      vendors:
        files: helpers.arrayToHash [
          # output path
          "deploy/static/js/vendors.js",[
            # vendor files
            "source/vendors/jquery-1.11.0.min.js"
            "source/vendors/underscore-min.js"
            "source/vendors/backbone.min.js"
            "source/vendors/handlebars.runtime-v1.3.0.js"
            "source/vendors/modernizr-v2.7.1.js"
            "source/vendors/bootstrap/affix.js"
            "source/vendors/bootstrap/alert.js"
            "source/vendors/bootstrap/button.js"
            "source/vendors/bootstrap/carousel.js"
            "source/vendors/bootstrap/collapse.js"
            "source/vendors/bootstrap/dropdown.js"
            "source/vendors/bootstrap/tab.js"
            "source/vendors/bootstrap/transition.js"
            "source/vendors/bootstrap/scrollspy.js"
            "source/vendors/bootstrap/modal.js"
            "source/vendors/bootstrap/tooltip.js"
            "source/vendors/bootstrap/popover.js"


          ] ]

    # minify css
    cssmin:
      add_banner:
        options:
          banner: "<%= banners.credits %>"
        files: [
          "deploy/static/css/style.min.css": "deploy/static/css/style.css"]

    # uglify javascript
    uglify:
      options:
        banner: "<%= banners.credits %>"
        mangle: true
      my_target:
        files: [
          'deploy/static/js/app.min.js': ['deploy/static/js/app.js'],
          'deploy/static/js/vendors.min.js': ['deploy/static/js/vendors.js']
        ]
    
    # copy files
    copy:
      main:
        expand: true
        cwd: 'source/json/'
        src: '**'
        dest: 'deploy/static/json/'
        flatten: false
        filter: 'isFile'

    # clean files
    clean: ["deploy/static/json"]

# list of grunt tasks to run on dev or deploy

  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-sass'
  grunt.loadNpmTasks 'grunt-contrib-concat'
  grunt.loadNpmTasks 'grunt-contrib-uglify'
  grunt.loadNpmTasks 'grunt-contrib-cssmin'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-coffee-percolator'
  grunt.loadNpmTasks 'grunt-contrib-handlebars'
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-contrib-clean'

  # develop the site
  grunt.registerTask 'default', =>
    grunt.task.run 'version-output'
    grunt.task.run 'devtasks'
    grunt.task.run 'watch'
  
  # deploy the site
  grunt.registerTask 'deploy', =>
    grunt.task.run 'deploytasks'

  grunt.registerTask 'version-output', ()->
    utils.generateVersioningOutput @async()
    null

  # Tasks
  grunt.registerTask 'devtasks',[ 'clean','concat:vendors', 'copy', 'handlebars', 'percolator', 'sass']
  grunt.registerTask 'deploytasks', ['version-output', 'concat:vendors', 'percolator', 'sass', 'concat:vendors', 'uglify', 'cssmin']