$(document).ready(function(){
  $("#search_btn").click(function() { 
     var property_type = $('#property_type').val();
     var min_budget = $('#min_budget').val();
     var max_budget = $('#max_budget').val();
     var looking_country = $('#looking_country').val();
     var looking_city = $('#looking_city').val();
     
     if(min_budget <= 0){
       alert("Minimum budget can't less than zero");
       return false; 
     }
      if(max_budget <= 0){
       alert("Maximum budget can't less than zero");
       return false; 
     }
      if(looking_city <= 0){
       alert("Looking city can't blank");
       return false; 
     }
     $.ajax({
       type: "get",
       data: {looking_city:looking_city, min_budget:min_budget, max_budget:max_budget  },
       url: "search_properties/search_property",
       success: function(data){
         $('.search_form').html(data);
         }
     });
   });

  $("#seach_property").autocomplete({
      source: function(request, response) {
        return $.ajax({
          url: "/search_properties/search_property_by_city",
          dataType: "json",
          data: {
            city: request.term
          },
          success: function(data) {
            return response($.map(data, function(item) {
              return {
                label: item.address,
                value: item.address
              };
            }));
          }
        });
      }
    });       
});
