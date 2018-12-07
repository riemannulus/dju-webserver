$("#form").submit(callback);

function callback(event){
    event.preventDefault();
    var form_data = $(this).serialize();
    console.log(form_data);

    jQuery.ajax({
        url: "auth",
        type: "POST",
        data: form_data,
        dataType: "JSON",
    }).done((data, textStatus, jqXHR) => {
        if(data.msg === "registered successfully"){
            $.cookie("token", jqXHR.getResponseHeader('Authorization'));
            $.cookie("id", data.id);
            let child = '<p class=isLogin> Successfuly registration </p>';
            let child2 = '<a href="/~s20131517/project"> return home </a>'
            $('.isValidate').append(child);
            $('.isValidate').append(child2);
        }
        else {
            let child = '<p class=isLogin> Your id is duplicated, try again </p>';
            $('.isValidate').append(child);
        }
    });
}