<!DOCTYPE html>
<html lang="en">
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
<script src="//code.jquery.com/jquery-1.12.0.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
</head>

<title>Alexandria</title>

<body>
<div id="header">
<h1></h1>
</div>
 
<div id="content" class="container">
     
  <fieldset>
    <legend>Add User</legend>
  <form name="user" action="add.html" method="post">
    Firstname: <input type="text" name="firstname" /> <br/>
    Lastname: <input type="text" name="lastname" />   <br/>
    <input type="submit" value="   Save   " />
  </form>
  </fieldset>
  <br/>
  <table class="datatable">
    <tr>
        <th>Firstname</th>  <th>Lastname</th>
    </tr>
    <#list model["userList"] as user>
    <tr>
        <td>${user.firstname}</td> <td>${user.lastname}</td>
    </tr>
    </#list>
  </table>
 
</div>  
</body>
</html>  