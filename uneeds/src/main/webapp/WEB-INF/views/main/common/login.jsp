<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!-- login 사용 페이지 head 아래, jquery도 추가할 것-->
<!-- 
<meta name="google-signin-scope" content="profile email">
<meta name="google-signin-client_id" content="412414727668-s6eej5gc6l0emtej7ccvr949oo2l68hg.apps.googleusercontent.com">
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
<script src="https://apis.google.com/js/platform.js?onload=init" async defer></script>
<script	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
 -->
<!-- MODAL CONTROLL BUTTON -->

<div class="logDiv">
	
	<!-- login div -->
	<div class="loginDiv">
		<!-- 구글 -->
		<div class="g-signin2" data-onsuccess="onSignIn" data-theme="dark"></div>
		<!-- 페북 --><!-- 로그아웃 버튼 자동생성 -->
		<div id="status"></div>
		<div class="fb-login-button" data-size="large"
			data-button-type="login_with" data-show-faces="false"
			data-auto-logout-link="true" data-use-continue-as="false"></div>
	</div>
	<div class="loginDiv">
		<!-- 네이버 -->
		<div id="naver_id_login"></div>
		<!-- 카카오 로그인 -->
		<a id="kakao-login-btn"></a>
	</div>
	<!-- logout div -->
	<div class="logOutDiv">
		<a href="#">${id} ( ${site} )</a>
		<a href="#" onclick="totalLogout();">로그아웃</a>
	</div>


</div>

<script>
	
	//로그인 확인
	if('${login}'=='logined'){
		$(".loginDiv").addClass("display-none");
		$(".logOutDiv").removeClass("display-none");
	}else{
		$(".loginDiv").removeClass("display-none");
		$(".logOutDiv").addClass("display-none");
	}
	
	//통합 로그아웃
	function totalLogout(){
		if('${site}'=='kakao'){
			klogout();
		}else if('${site}'=='naver'){
			naverlogout();
		}else if('${site}'=='google'){
			signOut();
		}else if('${site}'=='facebook'){
			fblogout();
		}
		//세션 지우기
		setTimeout(function(){
			location.href = "/uneeds/logout";
		}, 1000);
		
	}
	
	
	//구글
	function onSignIn(googleUser) {
		// Useful data for your client-side scripts:
		var profile = googleUser.getBasicProfile();
		console.log("ID: " + profile.getId()); // Don't send this directly to your server!
		console.log('Full Name: ' + profile.getName());
		console.log('Given Name: ' + profile.getGivenName());
		console.log('Family Name: ' + profile.getFamilyName());
		console.log("Image URL: " + profile.getImageUrl());
		console.log("Email: " + profile.getEmail());
		console.log("profile: " + JSON.stringify(profile));
		// The ID token you need to pass to your backend:
		var id_token = googleUser.getAuthResponse().id_token;
		console.log("ID Token: " + id_token);
		// 로그인 요청
		
		if('${login}'!='logined'){
			send_login(select_id(profile.getEmail()), "google");
		}
		
		
	};
	// 구글 로그아웃
	function signOut() {
		var auth2 = gapi.auth2.getAuthInstance();
		auth2.signOut().then(function() {
			$("body").append("<iframe id='logoutIframe' class='display-none;'></iframe>");
			$("#logoutIframe").attr("src", "https://accounts.google.com/logout");
			console.log('User signed out.');
		});
	}
	
	//페북
	window.fbAsyncInit = function() {
		FB.init({
			appId : '1250201825110378',
			autoLogAppEvents : true,
			xfbml : true,
			version : 'v3.0'
		});
		//페북 로그인
		FB.login(function(response) {
		    if (response.authResponse) {
		    	console.log('Welcome!  Fetching your information.... ');
		    	FB.api('/me', function(response) {
		     		console.log('Good to see you, ' + response.name + '.');
		    	});
		    } else {
		    	console.log('User cancelled login or did not fully authorize.');
		    }
		}, {scope: 'public_profile, email'});
		FB.getLoginStatus(function(response) {
		    statusChangeCallback(response);
		});
	};
	
	
	
	//페북 로그인 버튼
	(function(d, s, id) {
		var js, fjs = d.getElementsByTagName(s)[0];
		if (d.getElementById(id)) {
			return;
		}
		js = d.createElement(s);
		js.id = id;
		js.src = "https://connect.facebook.net/ko_KR/sdk.js";
		fjs.parentNode.insertBefore(js, fjs);
	}(document, 'script', 'facebook-jssdk'));

	function statusChangeCallback(response) {
		console.log('statusChangeCallback');
		console.log(response);
		// The response object is returned with a status field that lets the
		// app know the current login status of the person.
		// Full docs on the response object can be found in the documentation
		// for FB.getLoginStatus().
		if (response.status === 'connected') {
			// Logged into your app and Facebook.
			fb_info();
			
		} else {
			// The person is not logged into your app or we are unable to tell.
			// document.getElementById('status').innerHTML = 'Please log '+ 'into this app.';
		}
	}
	//페북 값 받아오기
	function fb_info() {
		console.log('Welcome!  Fetching your information.... ');
	    FB.api('/me', {fields: 'email,name'}, function(response) {
			console.log('Successful login for: ' + response.name+", "+response.email+"(facebook)");
			//document.getElementById('status').innerHTML = 'Thanks for logging in, ' + response.name + '!';

			//로그인 요청
			if('${login}'!='logined'){
				send_login(select_id(response.email), "facebook");
			}
	    });
	}
	//페북 로그아웃
	function fblogout() { 
        FB.logout(function(response) {
          // user is now logged out
        });
    }
	
	//네이버 로그인
	var naver_id_login = new naver_id_login("dhxVzayDoaI1Ff2KDolt",
				"http://192.168.0.61:8080/uneeds/book/");
	var state = naver_id_login.getUniqState();
	naver_id_login.setButton("white", 2, 40);
	naver_id_login.setDomain("192.168.0.61:8080/");
	//naver_id_login.setPopup();
	naver_id_login.init_naver_id_login();
	naver_id_login.get_naver_userprofile("naverState();");
	function naverState(){
		//로그인 요청
		send_login(select_id(naver_id_login.getProfileData('email')), "naver");
	}
		
	/* 네이버 로그아웃 */
	function naverlogout() {
		// 로그아웃 아이프레임
		$("body").append("<iframe id='logoutIframe' class='display-none;'></iframe>");
		$("#logoutIframe").attr("src", "http://nid.naver.com/nidlogin.logout");
	}
	
	// 카카오
	// 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init('b45576e5990ea9f2ee92793cf38b63c0');
   
	// 카카오 로그인 버튼을 생성합니다.
    Kakao.Auth.createLoginButton({
		container : '#kakao-login-btn',
		success : function(authObj) {
			// 로그인 성공시, API를 호출합니다.
			Kakao.API.request({
				url : '/v1/user/me',
				success : function(res) {
					console.log(JSON.stringify(res.kaccount_email));
					console.log(JSON.stringify(res.id));
					console.log(JSON.stringify(res.properties.profile_image));
					console.log(JSON.stringify(res.properties.nickname));
					
					//로그인 요청
					send_login(select_id(res.kaccount_email), "kakao");
				},
				fail : function(error) {
					alert(JSON.stringify(error));
				}
			});
		},
		fail : function(err) {
			alert(JSON.stringify(err));
		}
	});
    
	function klogout() {
		Kakao.Auth.logout(function(response){
			console.log('카카오 로그아웃: '+response);
			//location.href="http://localhost:8080/uneeds/login";
			$("body").append("<iframe id='logoutIframe' class='display-none;'></iframe>");
			$("#logoutIframe").attr("src", "http://developers.kakao.com/logout");
		});
	}
	
	
	//로그인 요청
	function send_login(id, site){
		
		$.ajax({
			type : 'POST',
			url : "/uneeds/login",
			data : {"id":id, "site":site},
			success : function(data){
				//console.log("login..."+data);
			},
			dataType: "text",
			complete: function(data){
				console.log("logined");
				window.location = "";
			}
		});
	}
	//이메일 앞부분 return
	function select_id(id){
		return id.split("@")[0];
	}
</script>