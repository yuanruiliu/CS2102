$(document).ready(function() {
    $.getJSON('/tutorial/service/main/hotshops', function(data) {
        addRestaurantListToPage(data);
    })        
});

function addRestaurantListToPage(data) {
    var count = 0;
    $('#restaurant_list_1').html("");
    $('#restaurant_list_2').html("");
    $.each(data, function(index, obj) {
        var li = $('<li />');
        var a = $('<a />').appendTo(li);

        var img,h2,p;
        img = $('<img />');
        h2 = $('<h2 />');
        p = $('<p />');
        $.each(obj, function(key, val) {
            switch (key) {
                case "id":
                    a.attr("href","/tutorial/service/store/"+val);
                    img.attr("src","/tutorial/misc/image/restaurant/"+val+".jpeg");
                    img.attr("height",60);
                    break;
                case "name":
                    h2.text(val);
                    break;
                case "address":
                    p.html("Address: "+val);
                    break;
                case "category":
                    p.html(p.html()+"<br/>Category: "+val);
                    break;
                default:
                    break;
            }
        });

        img.appendTo(a);
        h2.appendTo(a);
        p.appendTo(a);
        if (count<5) {
            li.appendTo($('#restaurant_list_1'));
        } else if (count<10) {
            li.appendTo($('#restaurant_list_2'));
        }
        count++;
    });
}