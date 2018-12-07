$('#form').submit(callback);

function callback(event){
    event.preventDefault();
    let get_url = $(this).attr("action");
    var form_data = $('#form').serialize();

    jQuery.ajax({
        url: get_url + '?' + form_data,
        type: "DELETE",
        data: form_data,
        dataType: "JSON"
    }).done((data, textStatus, jqXHR) => {
        if(data.status == 405){
            alert("login first");
            window.location.replace("/~s20131517/project/login.html");
        }
        if(data.status == 500){
            alert("cannot find any query function");
        }
        if(data.status == 200){
            let child = '<p>delete successful</p>';
            $('.result').append(child);
        }
        else{
            console.log(data.status);
        }
    });
}
