/* global requirejs, define*/

'use strict'

requirejs.onError = function(error){
    
    console.log(error);
    throw error;
};

require.config({
    enforceDefine: false,
    xhtml:false,
    waitseconds:15,
    config:{
        text:{
            env:'xhr'
        }
    },
    paths:{
        'bower_components': '../bower_components',
        'config': './config',
        'app': './app',
        'angular': '../bower_components/angular/angular',
        'angular-ui-router': '../bower_components/angular-ui-router/release/angular-ui-router',
        'jquery': '../bower_components/jquery/dist/jquery.min',
        'bootstrap':'../bower_components/bootstrap/dist/js/bootstrap.min'
    },
    shim:{
        'angular':{
            deps: ['jquery'],
            exports: 'angular'
        },
        'bootstrap':{
            deps:['jquery'],
            exports:'bootstrap'
        },
        'angular-ui-router':{
            deps:['angular']
        },
        'app':['angular']
    }});
