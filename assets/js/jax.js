$.ajax({
	url: '/getuserinfo',
	method: 'GET'
}).then(function(data){ 
	alert(data.user_id);
	var span_username = $('#uname');
	span_username.text(data.user_id);
	$('username').append(span_username) ;
});


// var user_info = {
// 	user_id: req.session.userid,
// 	user_email: req.session.email
// }
