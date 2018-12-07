$("#form").submit(callback);

function callback(event){
    event.preventDefault();
    var form_data = $(this).serialize();

    jQuery.ajax({
        url: "auth",
        type: "GET",
        data: form_data,
        dataType: "JSON",
    }).done((data, textStatus, jqXHR) => {
        if(data.msg === "successful"){
            $.cookie("token", jqXHR.getResponseHeader('Authorization'));
            $.cookie("id", data.id);
            let child = '<p class=isLogin> Successfuly Login </p>';
            let child2 = '<a href="/~s20131517/project"> return home </a>'
            $('.isValidate').append(child);
            $('.isValidate').append(child2);
        }
        else {
            let child = '<p class=isLogin> Id or password is not valid </p>';
            $('.isValidate').append(child);
        }
    });
}