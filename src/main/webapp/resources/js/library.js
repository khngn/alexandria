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
	var template = '{{#.}}<div class="col-lg-4 col-sm-6"><div class="row spacer-bottom">'
		+'<div class="col-lg-4 col-sm-6"><img src="{{coverSrc}}" alt="{{title}}" class="img-responsive w3-card-8"></div>'
		+'<div class="col-lg-8 col-sm-6"><div class="book-title">{{title}}</div>'
		+'<div><span class="by">by</span>&#160;<span class="book-author">{{author}}</span></div>'
		+'<div class="book-isbn spacer-top">ISBN: {{isbn}}</div>'
		+'</div></div></div>{{/.}}';
	$('#member-books-container').html(Mustache.render(template, books));
};