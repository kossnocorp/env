module.exports = function (grunt) {
  grunt.initConfig({
    karma: {
      options: {
        basePath: '',
        frameworks: ['mocha', 'sinon-chai'],
        files: [
          { pattern: 'spec/fixtures/**/*.html',
            included: true },

          'bower_components/modula/lib/modula.js',
          'bower_components/jquery/jquery.js',

          'lib/aws/services.coffee',
          'lib/aws/regions.coffee',
          'lib/aws/service_regions.coffee',
          'spec/**/*_spec.coffee'
        ],
        exclude: [],
        reporters: ['progress'],
        port: 9876,
        colors: true,
        autoWatch: true,
        browsers: ['PhantomJS'],
        captureTimeout: 60000,
        singleRun: false,
        coffeePreprocessor: {
          options: {
            bare: false
          }
        }
      },
      dev: {
        reporters: ['dots']
      },
      release: {
        singleRun: true
      },
      ci: {
        singleRun: true,
        browsers: ['PhantomJS']
      }
    }
  });

  grunt.loadNpmTasks('grunt-karma');
};
