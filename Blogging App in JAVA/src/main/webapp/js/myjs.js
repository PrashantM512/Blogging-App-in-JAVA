function doLike(pid, uid) {
    console.log("Like button clicked for pid: " + pid + ", uid: " + uid);
    const d = {
        pid: pid,
        uid: uid,
        operation: 'like'
    }
    $.ajax({
        url: "LikeServlet",
        data: d,
        success: function(data, textStatus, jqXHR) {
            console.log("AJAX success function called");
            console.log("Response data: " + data);
             console.log("trimed data: " + data.trim());
            if(data.trim() == 'true') {
				console.log("inside if");
                let c = $(".like-counter-"+pid).html();
                console.log("old likes: "+c);
                c++;
                console.log("New like count: " + c);
                $(".like-counter-"+pid).html(c);
            }
        },
        error: function(data, textStatus, errorThrown) {
            console.log("AJAX error function called");
            console.log("Error data: " + data);
        }
    });
    $(".likebutton").hide();
  $(".unlikebutton").show();
}


function UnLike(pid, uid) {
    console.log("unlike button clicked for pid: " + pid + ", uid: " + uid);
    const d = {
        pid: pid,
        uid: uid,
        operation: 'unlike'
    }
    $.ajax({
        url: "LikeServlet",
        data: d,
        success: function(data, textStatus, jqXHR) {
            console.log("AJAX success function called");
            console.log("Response data: " + data);
             console.log("trimed data: " + data.trim());
            if(data.trim() == 'true') {
				console.log("inside if");
                let c = $(".like-counter-"+pid).html();
                console.log("old likes: "+c);
                c--;
                console.log("New like count: " + c);
                $(".like-counter-"+pid).html(c);
            }
        },
        error: function(data, textStatus, errorThrown) {
            console.log("AJAX error function called");
            console.log("Error data: " + data);
        }
    });
    $(".unlikebutton").hide();
  $(".likebutton").show();
}


