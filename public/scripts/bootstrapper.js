require(['../config'],function(config){
	require(['bootstrap','angular','angular-bootstrap','app'],function(bootstrap,angular,angular_bootstrap,app){
		angular.bootstrap(document, [app.name]);
	});
});