app.provider("Day",function(){
    this.$get = ['$resource', function($resource){
        var Day = $resource('/api/days',{},{
            'get'   : {method: 'GET', params: {date: '@date'}, format: 'json', isArray: false},
            'getWeek' : {method: "GET", params: {week: "true", date: '@date'}, format: 'json', isArray: true},
            'getThisWeek' : {method: "GET", params: {week: "true"}, format: 'json', isArray: true},
            'getCurrentDate' : {method: "GET", params: {current_date: 'true', format: 'json', isArray: false}}
        });

        return Day;
    }];
});

app.provider("Meeting", function(){
    this.$get = ['$resource', function($resource){
        var Meeting = $resource('/api/meetings/:id',{},{
            'get'   : {method: 'GET', params: {id: "@id"}, format: 'json', isArray: false}
        });

        return Meeting;
    }];
});