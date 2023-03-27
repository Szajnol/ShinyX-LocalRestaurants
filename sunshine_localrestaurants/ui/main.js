$(document).ready(function(){
    $('#pop-info').hide();
    window.addEventListener('message', event => {
        switch (event.data.action) {
            case 'open': {
                $(`#pop-info`).show()
                $(`#info-6`).show()
                break
            }
            case 'close': {
                $(`#pop-info`).hide()
                $(`#info-6`).hide()
                break
            }
        }
    });
    
    $("#info-btn-6").click(function() {
        $.post("https://sunshine_localrestaurants/buy", JSON.stringify({}));
        $(`#pop-info`).hide()
        $(`#info-6`).hide()
        return;
    })


    $("#info-btn-8").click(function() {
        $.post("https://sunshine_localrestaurants/closeui", JSON.stringify({}));
        $(`#pop-info`).hide()
        $(`#info-6`).hide()
        return;
    })

});