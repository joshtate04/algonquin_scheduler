var app = angular.module("Scheduler",["ngAnimate","ui.router","templates","ngResource","ngRoute",'mgcrea.ngStrap']);

app.config(function ($stateProvider, $urlRouterProvider, $locationProvider) {
    $stateProvider
        .state('home', {
            url: '/', templateUrl: 'home.html', controller: 'HomeController'
        })
        .state('courses',{abstract: true, url: '/courses', templateUrl: "courses/layout.html", controller: "CoursesController"})
        .state('courses.index', {url: '', templateUrl: "courses/index.html", controller: "CoursesController"})
        .state('courses.show',{url: '/:id', templateUrl: 'courses/show.html', controller: "CoursesController"});
    $urlRouterProvider.otherwise('/');

    $locationProvider.html5Mode({enabled: true, requireBase: false});
});