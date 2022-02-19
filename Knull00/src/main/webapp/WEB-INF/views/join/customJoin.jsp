<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin 2 - Bootstrap Admin Theme</title>

    <!-- Bootstrap Core CSS -->
    <link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="/resources/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="/resources/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="/resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <div class="container">
		<div class="row">
			<div class="col-md-4 col-md-offset-4">
				<div class="login-panel panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title" align="center">회원가입</h3>
					</div>
					<div class="panel-body">
						<form role="form" action="/join/customJoin" method="post">
							<fieldset>
								<div class="form-group">
									<input class="form-control" placeholder="아이디"
										id="userid" name="userid" type="text" autofocus>
								</div>
								<div class="form-group">
									<input class="form-control" placeholder="비밀번호"
										id="userpw" name="userpw" type="password" value="">
								</div>
								<div class="form-group">
									<input class="form-control" placeholder="이름"
										id="username" name="username" type="text">
								</div>
								
								<button type="submit" class="btn btn-lg btn-success btn-block">회원가입</button>
							</fieldset>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
   <script type="text/javascript">
   $(document).ready (function () {
	   $.ajax({
			url : '/join/customJoin',
			type : 'POST',
			success : function (result) {
				console.log(result);
			}
		});
    });	  
  </script>
    </body>
    
    
</html>