<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<title>Home</title>
	<link type="text/css" rel="stylesheet" href="resources/css/style.css">
	<script type="text/javascript" src="resources/js/OuterJavaScript.js"></script>
	<script type="text/javascript">
		self.location = "/board/list";
	</script>
</head>
<body>
	<header>
		<h1 align="center">나는야 루피!</h1>
	</header>
	<nav>
		<div>
			<img alt="아이유" src="resources/img/iu.jpg" height="400" width="300">
			<br/>
			<audio src="resources/audio/MamiSon_Loveis.mp3" controls="controls"></audio>
		</div>
	</nav>
	<br/>
	<section>
		<article>
			<video autoplay="autoplay" muted="muted" controls="controls" width="500" >
				<source src="resources/video/bandicam 2022-01-21 02-18-52-772.mp4">
				<source src="resources/video/bandicam 2022-01-21 02-18-52-772 -.webm">
			</video>
		</article>
	</section>
	<br/>
	<footer>
		<div>
			<form action="exUploadPost" method="post" enctype="multipart/form-data">
				<input type="file" name="files" multiple><br/>
				<input type="submit">
			</form>
		</div>
	</footer>
</body>
</html>
