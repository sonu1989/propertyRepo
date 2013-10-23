$("#new_buyer_profile").validate({
  rules:{
    min_budget: "required",
    max_budget: "required",
    looking_country: "required",
    looking_city: "required"
  },
  messages: {
    min_budget: "Please enter your minimum budget",
    max_budget: "Please enter your maximum budget",
    looking_country: "Please enter your looking country",
    looking_city: "Please enter your looking city"
  }
});

$("#new_property_detail").validate({
  rules:{
    area: "required",
    price: "required",
    country: "required",
    state: "required",
    city: "required"
  },
  messages: {
    area: "Please enter property area",
    price: "Please enter property price",
    country: "Please enter country ",
    state: "Please enter state",
    city: "Please enter  city"
  }
});

$("#new_agreement").validate({
  rules:{
    price: "required"
  },
  messages: {
    price: "Please enter property price",
  }
});


$("#new_user").validate({
  rules:{
    first_name: {
      required: true,
      min: 2
    },
    last_name: {
      required: true,
      min: 2
    },
    email: {
      required: true,
      email: true
    },
    mobile: {
      required: true,
      number: true,
      max: 10
    },
    password: "required",
    password_confirmation: "required",
    country: "required",
    state: "required",
    city: "required",
    address: "required",
    zip_code: "required"
  },
  messages: {
    first_name: "Please enter first name",
    last_name: "Please enter last name",
    mobile: "Please enter mobile number",
    password: "Please enter password",
    password_confirmation: "Please enter password confirmation",
    country: "Please enter country ",
    state: "Please enter state",
    city: "Please enter  city",
    address: "Please enter  address",
    zip_code: "Please enter  Zip code"
  }
});

$("#new_user").ready(function(){
  $("#signup_btn").click(function () {
    
      });
    $("#user_mobile").keyup(function () {
       if (!this.value.match(/^([0-9]{0,10})$/)) {
          this.value = this.value.replace(/[^0-9]/g, '').substring(0,10);
      }
    });
     $("#user_zip_code").keyup(function () {
       if (!this.value.match(/^([0-9]{0,6})$/)) {
          this.value = this.value.replace(/[^0-9]/g, '').substring(0,6);
      }
  
  });
});
