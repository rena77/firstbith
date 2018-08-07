<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
  <title>LOGIN</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
</head>


<body >
<div align="center" style="padding-top: 20px;">
	<img src="../resources/main/img/logo2.png" alt="logo2" style="width: 100%;">
</div>
<form action ="loginuneeds" method="post">
	<div style="padding: 20px;">
		<div class="form-group">
	  	<label for="usr">ID</label>
	  	<input type="text" class="form-control" name="usr">
		</div>
	<div class="form-group">
	  	<label for="pwd">Password</label>
	  	<input type="password" class="form-control" name="pwd">
	</div>
</div>
	<div align="center">
		<button type="submit" class="btn btn-primary">LOGIN</button>
		<button type="button" class="btn btn-primary" onclick="location.href='http://localhost:8080/uneeds/join'">JOIN+</button>
</div>
</form>
</body>