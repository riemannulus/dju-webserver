
function cookieCheck() {
    if(typeof $.cookie('token') === 'undefined'){
        return false;
    }
    return true;
}

function authorized(){
    jQuery.ajax({
        url: 'auth/validate',
        type: "POST",
        dataType: "JSON"
    }).done((data) => {
        if('status' in data){
            if(data.status === 200) return true;
            if(data.status === 405) return false;
        }
    });
}