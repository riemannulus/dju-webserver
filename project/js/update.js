$("#form1").submit(callback);
$("#form2").submit(callback2);

function callback(event){
    event.preventDefault();
    let get_url = $(this).attr("action");
    let id = $("#data_id").val();

    jQuery.ajax({
        url: get_url + "/" + id,
        type: "GET",
        dataType: "JSON",
    }).done((data, textStatus, jqXHR) => {
        if(data.status == 405){
            alert("login first");
            window.location.replace("/~s20131517/project/login.html");
        }
        if(data.status == 500){
            alert("cannot find any query function");
        }
        if(data.status == 200){
            console.log(get_url + '/' + id);
            $("#resp_id").val(data.data[0].id);
            $("#description").val(data.data[0].des);
            let child = '<img src="' + data.data[0].url + '" class="image"/>';
            $('.image_container').append(child);
        }
    });
}

function callback2(event){
    event.preventDefault();
    let get_url = $(this).attr("action");
    var form_data = $('#form2').serialize();
    console.log(encodeURI(form_data));

    jQuery.ajax({
        url: get_url + '?' + form_data,
        type: "PUT",
        data: {'id': $('#resp_id').val(), 'description': $('#description').val()},
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
            let child = '<p>update successful</p>';
            $('.image_container').append(child);
        }
        else{
            console.log(data.status);
        }
    });
}
