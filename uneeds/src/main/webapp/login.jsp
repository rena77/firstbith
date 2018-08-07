<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="wrap">
		<!-- 스킵네비게이션 : 웹접근성대응-->
		<div id="u_skip">
			<a href="#content" onclick="document.getElementById('content').tabIndex=-1;document.getElementById('content').focus();return false;"><span>본문으로 바로가기</span></a>
		</div>
		<!-- //스킵네비게이션 -->
		<!-- header -->
		<div id="header">
			<h1>
				<a href="http://www.naver.com" class="sp h_logo" onclick="nclks('log.naver',this,event)">Uneeds</a> 
			</h1>
		</div>
		<!-- //header -->
		
		<!-- container -->
		<div id="container">
			<!-- content -->
			<div id="content">
					<fieldset class="login_form">
						<legend class="blind">로그인</legend>
						<div class="input_row" id="id_area">
							<span class="input_box">
								<input type="text" id="id" name="id" accesskey="L" placeholder="아이디" class="int" maxlength="41" value="">
							</span>
						</div>
						<div class="input_row" id="pw_area">
							<span class="input_box">
								<input type="password" id="pw" name="pw" placeholder="비밀번호" class="int"
									maxlength="16" onkeypress="capslockevt(event);getKeysv2();"
									onkeyup="checkShiftUp(event);"
									onkeydown="checkShiftDown(event);">
							</span>
							<div class="ly_v2" id="err_capslock" style="display: none;">
								<div class="ly_box">
									<p>
										<strong>Caps Lock</strong>이 켜져 있습니다.
									</p>
								</div>
								<span class="sp ly_point"></span>
							</div>
						</div>
						
						<div class="error" id="err_empty_pw" style="display: none;">비밀번호를 입력해주세요.</div>
						<input type="submit" title="로그인" alt="로그인" value="로그인" class="btn_global" onclick="nclks('log.login',this,event)">
						<div class="check_info">
							<div class="login_check">
								<span class="login_check_box">
								<input type="checkbox" id="login_chk" name="nvlong" class="" value="off" onchange="savedLong(this);nclks_chk('login_chk', 'log.keepon', 'log.keepoff',this,event)">
									<label for="login_chk" id="label_login_chk" class="sp">로그인
										상태 유지</label>
								</span>
								<div class="ly_v2" id="persist_usage" style="display: none;">
									<div class="ly_box">
									</div>
									<span class="sp ly_point"></span>
								</div>
							</div>
						</div>
					</fieldset>
				<div class="position_a">
					<div class="find_info">
						<a target="_blank" href="https://nid.naver.com/user/help.nhn?todo=idinquiry" onclick="try{nclks('log.searchid',this,event)}catch(e){}">아이디 찾기</a>
						<span class="bar">|</span>
						<a target="_blank" href="https://nid.naver.com/nidreminder.form" onclick="try{nclks('log.searchpass',this,event)}catch(e){}">비밀번호 찾기</a>
						<span class="bar">|</span>
						<a target="_blank" href="https://nid.naver.com/user/join.html?lang=ko_KR" onclick="try{nclks('log.registration',this,event)}catch(e){}">회원가입</a>
					</div>
				</div>
				<!-- tg-lang -->
			</div>
			<!-- //content -->
		</div>
		<!-- //container -->
		<!-- footer -->
		<div id="footer">
			<ul>
				<li><a target="_blank" href="http://www.naver.com/rules/service.html" onclick="nclks('fot.agreement',this,event)">이용약관</a></li>
				<li><strong><a target="_blank" href="http://www.naver.com/rules/privacy.html" onclick="nclks('fot.privacy',this,event)">개인정보처리방침</a></strong></li>
				<li><a target="_blank" href="http://www.naver.com/rules/disclaimer.html" onclick="nclks('fot.disclaimer',this,event)">책임의 한계와 법적고지</a></li>
				<li><a target="_blank" href="https://help.naver.com/support/service/main.nhn?serviceNo=532" onclick="nclks('fot.help',this,event)">회원정보 고객센터</a></li>
			</ul>

			<address>
				<em><a target="_blank" href="http://www.navercorp.com"
					class="logo" onclick="nclks('fot.naver',this,event)"><span
						class="blind">naver</span></a></em><em class="copy">Copyright</em> <em
					class="u_cri">©</em> <a target="_blank"
					href="http://www.navercorp.com" class="u_cra"
					onclick="nclks('fot.navercorp',this,event)">NAVER Corp.</a> <span
					class="all_r">All Rights Reserved.</span>
			</address>
		</div>
		<!-- //footer -->

	</div>
	<script type="text/javascript"
		src="https://nid.naver.com/login/js/common.all.js?141216">
		
	</script>
	<script type="text/javascript">
		var disp_stat = "20";
		var session_keys = "";
		var pc_keyboard_close = "<span class=\"sp\">PC 키보드 닫기</span>";
		var pc_keyboard_open = "<span class=\"sp\">PC 키보드 보기</span>";
		var view_char = "한글 보기";
		var view_symbol = "특수기호 보기";

		addInputEvent('id', 'id_area');
		addInputEvent('pw', 'pw_area');

		initSmartLevel();
		var login_chk = $('login_chk');
		if (login_chk.attachEvent) {
			login_chk.attachEvent("onchange", function() {
				persist_usage();
			});
		} else if (login_chk.addEventListener) {
			login_chk.addEventListener("change", function() {
				persist_usage();
			}, false);
		}
		function persist_usage() {
			var login_chk = $("login_chk");
			if (login_chk.checked == true) {
				show("persist_usage");
				hide('onetime_usage');
				view_onetimeusage = false;
			} else {
				hide("persist_usage");
			}
		}
		var view_onetimeusage = false;
		function viewOnetime() {
			if (view_onetimeusage) {
				hide('onetime_usage');
				view_onetimeusage = false;
			} else {
				hide("persist_usage");
				show('onetime_usage');
				view_onetimeusage = true;
			}
		}
		try {
			if (navigator.appVersion.toLowerCase().indexOf("win") != -1) {
				$('id').style.imeMode = "disabled";
				document.msCapsLockWarningOff = true;
			}
		} catch (e) {
		}
		try {
			if ($('id').value.length == 0) {
				$('id').focus();
			} else {
				$('pw').focus();
			}
		} catch (e) {
		}
	</script>
	<script type="text/javascript"
		src="https://nid.naver.com/login/js/common.util.js"></script>
	<script type="text/javascript">
		lcs_do();
	</script>
	<script type="text/javascript">
		var nsc = "nid.login_kr";
	</script>
	<script type="text/javascript" src="/login/js/bvsd.0.51.0.min.js"></script>
	<script type="text/javascript">
		var porperties = {
			keyboard : [ {
				id : "id",
			}, {
				id : "pw",
				secureMode : true
			} ]
		};
		bvsd = new sofa.Koop(porperties);

		function confirmAlterSubmit() {
			var id = $("id");
			var pw = $("pw");
			var encpw = $("encpw");

			if (id.value == "") {
				show("err_empty_id");
				hide("err_empty_pw");
				hide("err_common");
				id.focus();
				return false;
			} else if (pw.value == "") {
				hide("err_empty_id");
				show("err_empty_pw");
				hide("err_common");
				pw.focus();
				return false;
			}
			try {
				$("ls").value = localStorage.getItem("nid_t");
			} catch (e) {
			}
			try {
				$("bvsd").value = bvsd.f();
			} catch (e) {
				if ($("bvsd") != null) {
					$("bvsd").value = e.message;
				}
			}
			return encryptIdPw();
		}
	</script>
	<div id="nv_stat" style="display: none;">20</div>
</body>
</html>