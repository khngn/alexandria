<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>MyLib</title>

<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/css/scrolling-nav.css">
<link rel="stylesheet" href="resources/css/theme.css">

<link href='https://fonts.googleapis.com/css?family=Merriweather'
	rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Open+Sans'
	rel='stylesheet' type='text/css'>

</head>

<!-- The #page-top ID is part of the scrolling feature - the data-spy and data-target are part of the built-in Bootstrap scrollspy function -->

<body id="page-top" data-spy="scroll" data-target=".navbar-fixed-top">

	<!-- Navigation -->
	<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
		<div class="container">
			<div class="navbar-header page-scroll">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-ex1-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand page-scroll" href="#page-top">MyLib</a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse navbar-ex1-collapse">
				<ul class="nav navbar-nav">
					<!-- Hidden li included to remove active class from about link when scrolled up past about section -->
					<li class="hidden"><a class="page-scroll" href="#page-top"></a>
					</li>
					<li><a class="page-scroll" href="#members">Members</a></li>
					<li><a class="page-scroll" href="#books">Books</a></li>
					<li role="presentation" class="dropdown">
						<a class="dropdown-toggle" data-toggle="dropdown" href="#"
						role="button" aria-haspopup="true" aria-expanded="false">More <span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a class="page-scroll" data-toggle="modal"
									data-target="#addPersonModal"><span class="glyphicon glyphicon-plus" aria-hidden="true">&#160;</span>New member</a>
								</li>
							</ul>
					</li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container -->
	</nav>

	<!-- Intro Section -->
	<section id="intro" class="intro-section">
		<div class="container">
			<div class="jumbo-intro">Hello :)</div>
		</div>
	</section>

	<!-- About Section -->
	<section id="members" class="members-section">
		<div class="container">
			<div class="row ">
				<#list model["persons"] as person>
				<div class="col-lg-4 col-sm-6 member-tile-wrapper">
					<div class="member-tile w3-card-8">
						<div class="member-name">${person.name}</div>
						<div class="member-phone">${person.phoneNumber}</div>
						<div class="member-email">${person.email}</div>
						<div class="pull-right member-find-books-btn">
							<button id="find-checkout-btn#${person.id}" type="button"
								class="btn btn-sm btn-default" data-toggle="modal"
									data-target="#memberBooksModal">
								<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
								Find
							</button>
						</div>
					</div>
				</div>
				</#list>
			</div>

			<table id="checkout-tbl"
				class="table table-striped table-hover table-condensed">
			</table>
			
			<div class="modal fade" id="memberBooksModal" tabindex="-1"
				role="dialog" aria-labelledby="memberBooksModalLabel">
				<div class="modal-dialog modal-lg" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<h4 class="modal-title" id="memberBooksModalLabel">Member's Books</h4>
						</div>

						<div class="modal-body">
							<div id="member-books-container" class="row">
							<#list model["books"] as book>
							<div class="col-lg-4 col-sm-6">
								<div class="row spacer-bottom">
									<div class="col-lg-4 col-sm-6">
										<img src="${book.coverSrc}" alt="${book.title}"
											title="${book.title}" class="img-responsive">
									</div>
									<div class="col-lg-8 col-sm-6">
										<div class="book-title">${book.title}</div>
										<div>
											<span class="by">by</span>&#160;<span class="book-author">${book.author}</span>
										</div>
										<div class="book-isbn spacer-top">ISBN: ${book.isbn}</div>
									</div>
								</div>
							</div>
							</#list>
							</div>
						</div>

						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">Close</button>
						</div>
					</div>
				</div>
			</div>
			
			<div class="modal fade" id="addPersonModal" tabindex="-1"
				role="dialog" aria-labelledby="addPersonModalLabel">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<h4 class="modal-title" id="addPersonModalLabel">New Member</h4>
						</div>

						<form id="add-person-form" name="person" action="addPerson"
							method="post">
							<div class="modal-body">
								<div class="form-group">
									<label for="name">Name</label> <input type="text"
										class="form-control" id="name" name="name" placeholder="John Smith">
								</div>
								<div class="form-group">
									<label for="phoneNumber">Phone Number</label> <input
										type="text" class="form-control" id="phoneNumber"
										name="phoneNumber" placeholder="0400 123 123">
								</div>
								<div class="form-group">
									<label for="email">Email</label> <input type="text" id="email"
										name="email" class="form-control" placeholder="john.smith@email.com">
								</div>
							</div>

							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">Cancel</button>
								<input id="submit-person-btn" type="submit"
									class="btn btn-primary" value="Submit">
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- Books Section -->
	<section id="books" class="books-section">
		<div class="container">
			<#list model["books"] as book>
			<div class="row book-bottom-spacer">
				<div class="col-md-2 col-sm-3">
					<img src="${book.coverSrc}" alt="${book.title}"
						title="${book.title}" class="img-responsive book-cover">
				</div>
				<div class="col-md-10 col-sm-9">
					<div class="book-title">${book.title}</div>
					<div>
						<span class="by">by</span>&#160;<span class="book-author">${book.author}</span>
					</div>

					<div class="book-isbn spacer-top">ISBN: ${book.isbn}</div>

					<p class="book-summary-text spacer-top">${book.summary}</p>
				</div>
			</div>
			</#list>
		</div>
	</section>
	
	

	<script src="resources/js/jquery.min.js"></script>
	<script src="resources/js/bootstrap.min.js"></script>
	<script src="resources/js/jquery.easing.min.js"></script>
	<script src="resources/js/scrolling-nav.js"></script>
	<script src="resources/js/mustache.min.js"></script>
	<script src="resources/js/library.js"></script>
</body>

</html>