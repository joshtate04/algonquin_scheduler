app.controller("HomeController", ['$scope','$stateParams','Course', 'User',
    function($scope,$stateParams,Course,User) {
        $scope.courses = Course.query();
        $scope.current_user = User.current();
    }
]);