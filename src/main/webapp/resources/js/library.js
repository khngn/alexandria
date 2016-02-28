/**
 * Author: K.H.Nguyen
**/
$(document).ready(function() {
	$('button[id^="find-checkout-btn#"]').click(function(event) {
		event.preventDefault();
		var personId = this.id.substring(this.id.lastIndexOf('#') + 1);
		findBooksOf(personId);
	});
});

function findBooksOf(personId) {
	$.ajax({
		type : "POST",
		contentType : "application/json",
		url : "api/findBooksByPersonId",
		data : personId,
		dataType : 'json',
		timeout : 100000,
		success : function(data) {
			console.log("AJAX SUCCESS: ", JSON.stringify(data));
			displayBooks(data);
		},
		error : function(e) {
			console.log("AJAX ERROR: ", e);
		},
		done : function(e) {
			console.log("AJAX DONE: ", e);
		}
	});
};

function displayBooks(books) {
	// use Mustache js to render html
	var template = '<thead><tr><th>Title</th><th>Author</th><th>ISBN</th></tr></thead>'
		+ '{{#.}}<tr><td>{{title}}</td><td>{{author}}</td><td>{{isbn}}</td></tr>{{/.}}';
	$('table[id="checkout-tbl"]').html(Mustache.render(template, books));
};