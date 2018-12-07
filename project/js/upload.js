$("#form").submit(callback);
function callback(event){
    event.preventDefault();
    var get_url = $(this).attr("action");

    var formData = new FormData($("#form")[0]);

    jQuery.ajax({
        url: get_url,
        type: "POST",
        encrypt: 'multipart/form-data',
        processData: false,
        contentType: false,
        cache: false,
        data: formData,
    }).done((data) => {
        if('status' in data){
            if(data.status == 405){
                alert("login first");
                window.location.replace("/~s20131517/project/login.html");
            }
            if(data.status == 500){
                alert("cannot find any query function");
            }
            if(data.status == 201){
                console.log(data);
                if(data.data.length == 0){
                    console.log("anything else");
                    return;
                }
                for(let i = 0; i < data.data.length; i++){
                    let child = '<a href="index.html">Upload successful! return home</a>';
                    $('#status').append(child);

                }
            }
        }


    });
}