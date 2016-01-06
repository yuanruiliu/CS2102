$(document).ready(function() {
	alert("get footer");
	var client,offset;
    client = document.documentElement.clientHeight;
    offset = $('body').height();
	if (client - offset > 0) {
		$('#footer').css({'position':'absolute','bottom':0});
	}
});
