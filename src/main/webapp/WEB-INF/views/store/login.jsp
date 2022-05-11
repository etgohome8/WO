<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Dashboard">
    <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
    <title>워킹오더 관리자 페이지</title>
  
    <!-- Favicons -->
    <link href="resources/assets/images/admin/logo/logo_only.svg" rel="icon">
    <link href="resources/assets/images/admin/apple-touch-icon.png" rel="apple-touch-icon">
  
    <!-- Bootstrap core CSS -->
    <link href="resources/assets/js/admin/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!--external css-->
    <link href="resources/assets/js/admin/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <!-- Custom styles for this template -->
    <link href="resources/assets/css/admin/style.css" rel="stylesheet">
    <link href="resources/assets/css/admin/style-responsive.css" rel="stylesheet">
  
</head>

<body style="background-color: #0A2533;">
  <!-- **********************************************************************************************************************************************************
      MAIN CONTENT
      *********************************************************************************************************************************************************** -->
  <div id="login-page">
    <div class="container">
      <form class="form-login" action="index.store" >
        <h2 class="form-login-heading"><img src="resources/assets/images/admin/logo/logo_white.PNG" style="width:28px">&nbsp; walking order store</h2>
        <div class="login-wrap">
          <input type="text" class="form-control" placeholder="관리번호" style="font-size: 12px;" autofocus>
          <br>
          <input type="password" class="form-control" placeholder="비밀번호" style="font-size: 12px;">
          <label class="checkbox">
            <input type="checkbox" value="remember-me" style="font-size: 12px; margin-top: 2px; margin-left: 0px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;자동로그인
            <span class="pull-right">
            <a data-toggle="modal" href="login.html#myModal" style="font-size: 12px;">비밀번호 찾기</a>
            </span>
            </label>
          <button class="btn btn-theme btn-block" href="index.store" type="submit"><i class="fa fa-lock"></i> 로그인</button>
          <hr>
          
          
        </div>
        <!-- Modal -->
        <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="myModal" class="modal fade" style="margin: 20px auto 0;">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">비밀번호 초기화 요청</h4>
              </div>
              <div class="modal-body">
                <p>이메일을 입력하시면 초기화된 비밀번호를 알려 dream</p>
                <input type="text" name="email" placeholder="Email" autocomplete="off" class="form-control placeholder-no-fix">
              </div>
              <div class="modal-footer">
                <button data-dismiss="modal" class="btn btn-default" type="button">취소</button>
                <button class="btn btn-theme" type="button">전송</button>
              </div>
            </div>
          </div>
        </div>
        <!-- modal -->
      </form>
    </div>
  </div>
  <!-- js placed at the end of the document so the pages load faster -->
  <script src="resources/assets/js/admin/jquery/jquery.min.js"></script>
  <script src="resources/assets/js/admin/bootstrap/js/bootstrap.min.js"></script>
  <!--BACKSTRETCH-->
  <!-- You can use an image of whatever size. This script will stretch to fit in any screen size.-->
  <script type="text/javascript" src="resources/assets/js/admin/jquery.backstretch.min.js"></script>
  <script>
    $.backstretch("img/login-bg.jpg", {
      speed: 500
    });
  </script>
</body>

</html>
