$(document).ready(function(){
  $('#search_form').onSubmit(function() { 
      $.ajax({
          type: 'POST',
           url: 'search_properties_path'
          data: { property_type: property_type, min_budget: min_budget },
      }).success(function(data){
        if (data.length==0){
          alert("hello"); 
        }
       else{
       alert("Hello in else")  
      }
     });
  });
});
