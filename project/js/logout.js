$(document).ready(() => {
    if(cookieCheck()){
        $.cookie('token', null);
        $.cookie('id', null);
        let child = '<a href="index.html">logout successful! return home</a>';
        $('.status').append(child);
    } else {
        let child = '<a href="login.html">login first</a>';
        $('.status').append(child);
    }
});