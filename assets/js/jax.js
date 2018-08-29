$.ajax({
	url: '/getuserinfo',
	method: 'GET'
}).then(function(data){
	var p, ob, necc;
	for (var i=0; i<data.length; i++){
		ob = data[i];
		p = $('<p>');
		necc = (ob.neccessity ? 'needed' : 'not needed');
		p.text(ob.item + ' - ' + necc + ' - ' + ob.url + ob.cost);

		$('body').append(p);
	}
});