app.provider("Course",function(){
    this.$get = ['$resource', function($resource){
        var Course = $resource('/api/courses/:id',{},{
            'get'   : { method: 'GET', params: {id: '@id'}, format: 'json', isArray: false },
            update  : { method: "PUT" }
        });

        return Course;
    }];
});