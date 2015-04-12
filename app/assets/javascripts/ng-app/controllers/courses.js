app.controller("CoursesController", ['$scope','$stateParams','Course',
    function($scope,$stateParams,Course){
        if($stateParams.id != null)
            $scope.course = Course.get({}, {id: $stateParams.id});

        $scope.courses = Course.query();
    }
]);