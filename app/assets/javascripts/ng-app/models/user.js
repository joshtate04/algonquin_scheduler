app.provider("User",function(){
    this.$get = ['$resource', function($resource){
        var User = $resource('/api/users/:id',{},{
            'get'   : { method: 'GET', params: {id: '@id'}, format: 'json', isArray: false },
            update  : { method: "PUT", isArray: false },
            current : { method: 'GET', params: {current: true}, format: 'json', isArray: false }
        });

        return User;
    }];
});