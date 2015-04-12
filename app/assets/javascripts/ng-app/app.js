var app = angular.module("Scheduler",["ngAnimate","ui.router","templates","ngResource","ngRoute"]);
app.config(function ($stateProvider, $urlRouterProvider, $locationProvider) {
    $stateProvider.state('home', {url: '/', templateUrl: 'home.html', controller: 'MainController'});
    $locationProvider.html5Mode({enabled: true, requireBase: false});
});