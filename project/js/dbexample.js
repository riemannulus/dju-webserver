$("#form").submit(callback);
function callback(event){
    $('#image_container').empty();
    event.preventDefault();
    var get_url = $(this).attr("action");
    var form_data = $(this).serialize();
    console.log(form_data);

    jQuery.ajax({
        url: get_url,
        type: "GET",
        data: form_data,
        dataType: "JSON"
    }).done((data) => {
        if('status' in data){
            if(data.status == 405){
                alert("login first");
                window.location.replace("/~s20131517/project/login.html");
            }
            if(data.status == 500){
                alert("cannot find any query function");
            }
            if(data.status == 200){
                console.log(data);
                if(data.data.length == 0){
                    console.log("anything else");
                    return;
                }
                for(let i = 0; i < data.data.length; i++){
                    let child = '<div class="box">' +
                        '<img src="' + data.data[i].url + '" class="image index' + i +'"/>' +
                        '<p class="image_id"> id: ' + data.data[i].id +'</p>' +
                        '<p class="image_desc"> description: ' + data.data[i].des +'</p>' +
                        '</div>';
                    $('#image_container').append(child);
                }
            }
        }


    });
}

