<!DOCTYPE html>
<html lang="en">
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
	integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7"
	crossorigin="anonymous">
<link rel="stylesheet" href="resources/css/theme.css">
<script src="//code.jquery.com/jquery-1.12.0.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"
	integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS"
	crossorigin="anonymous"></script>
<script src="resources/js/mustache.min.js"></script>
<script src="resources/js/library.js"></script>
</head>

<title>Alexandria</title>

<body>
	<div id="content" class="container">
		<h1 class="heading-banner">Alexandria</h1>
		<div class="row">
			<div class="col-lg-6">
				<h3>Persons</h3>
				<table class="table table-striped table-hover table-condensed">
					<thead>
						<tr>
							<th>Name</th>
							<th>Phone Number</th>
							<th>Email</th>
							<th>Checkout</th>
						</tr>
					</thead>
					<tbody>
						<#list model["persons"] as person>
						<tr>
							<td>${person.name}</td>
							<td>${person.phoneNumber}</td>
							<td>${person.email}</td>
							<td><button id="find-checkout-btn#${person.id}"
									type="button" class="btn btn-sm btn-default">
									<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
									Find
								</button></td>
						</tr>
						</#list>
					</tbody>
				</table>
				<button id="add-person-btn" type="button" class="btn btn-primary"
					data-toggle="modal" data-target="#addPersonModal">
					<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
					Add Person
				</button>
			</div>
			<div class="col-lg-6">
				<h3>Checkout</h3>
				<table id="checkout-tbl"
					class="table table-striped table-hover table-condensed">
				</table>
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
						<h4 class="modal-title" id="addPersonModalLabel">Add Person</h4>
					</div>

					<form id="add-person-form" name="person" action="addPerson"
						method="post">
						<div class="modal-body">
							<div class="form-group">
								<label for="name">Name</label> <input type="text"
									class="form-control" id="name" name="name" placeholder="Name">
							</div>
							<div class="form-group">
								<label for="phoneNumber">Phone Number</label> <input type="text"
									class="form-control" id="phoneNumber" name="phoneNumber"
									placeholder="Phone Number">
							</div>
							<div class="form-group">
								<label for="email">Email</label> <input type="text" id="email"
									name="email" class="form-control" placeholder="Email">
							</div>
						</div>

						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">Close</button>
							<input id="submit-person-btn" type="submit"
								class="btn btn-primary" value="Submit">
						</div>
					</form>
				</div>
			</div>
		</div>
		<hr>
		<h3>Books</h3>
		<table class="table table-striped table-hover table-condensed">
			<thead>
				<tr>
					<th>Title</th>
					<th>Author</th>
					<th>ISBN</th>
				</tr>
			</thead>
			<tbody>
				<#list model["books"] as book>
				<tr>
					<td>${book.title}</td>
					<td>${book.author}</td>
					<td>${book.isbn}</td>
				</tr>
				</#list>
			</tbody>
		</table>
	</div>
	<div class="bottom-spacer"></div>
</body>
</html>
