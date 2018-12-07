$(document).ready(()=>{
    if(!!$.cookie('token') && $.cookie('token') != "null"){
        $('#login-status').text("logout");
        $('#login-status').attr("href", "logout.html");
    }
});