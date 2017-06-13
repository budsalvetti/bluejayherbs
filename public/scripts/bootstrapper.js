require(['../config'],function(config){
	require(['bootstrap','angular','app'],function(bootstrap,angular,app){
		angular.bootstrap(document, [app.name]);
	});
});