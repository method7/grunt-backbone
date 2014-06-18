grunt-backbone
===============

Front end development framework using grunt http://gruntjs.com/, backbone http://backbonejs.org/, Bootstrap http://getbootstrap.com/ coffeeScript http://coffeescript.org/, SaSS http://sass-lang.com/, and Handlebars http://handlebarsjs.com/

Single page apps require careful management otherwise they become very difficult to maintain and extend, a well-considered architecture, modular development and code abstraction are key to efficient development and maintenance.

The goal of this project is to lay out a robust (but not fixed) front-end development framework that can be tailored to suit any particular technological or architectural requirement and aid the software development life cycle through different production environments.

The current features are listed below (more to add?).

##Features
===============
* twitter bootstrap sass/CSS/JS
* backbone.js
* underscore.js
* jQuery.js
* modernizr.js

##Build process includes
===============
* CoffeeScript compiler
* SASS compiler
* handlebars template compiler
* uglify JavaScript 
* minify CSS 
* Clean and Copy
* version output generated from git (to be included in sass/coffee build and release process)

##TODO - not conclusive for sure
===============
* global variables "grunt/globals.coffee"
* DEV/STAGE/DEPLOY tasks separation
* Unit testing
* add version querystring token for dependencies to prevent caching

##Get started
===============
To get going you need node.js http://nodejs.org/  installed with npm (node package manager) https://www.npmjs.org/ and grunt.js http://gruntjs.com/installing-grunt
then simply navigate node console to the root directory where gruntfile.coffee and package.json exist

Type "npm install" and all the requirements should download and install once complete type "grunt" to start the watch process. This will monitor the project and when documents are saved the project will be build and deployed to the /deploy directory.

I have probably missed something critical above... well it is a project very much in development.