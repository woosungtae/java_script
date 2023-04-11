<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	var loopSearch=true;
	function keywordSearch(){
		if(loopSearch==false)
			return;
	 var value=document.frmSearch.searchWord.value;
		$.ajax({
			type : "get",
			async : true, //false인 경우 동기식으로 처리한다.
			url : "${contextPath}/goods/keywordSearch.do",
			data : {keyword:value},
			success : function(data, textStatus) {
			    var jsonInfo = JSON.parse(data);
				displayResult(jsonInfo);
			},
			/* error : function(data, textStatus) {
				alert("에러가 발생했습니다."+data); */
			},
			complete : function(data, textStatus) {
				//alert("작업을완료 했습니다");
				
			}
		}); //end ajax	
	}
	
	function displayResult(jsonInfo){
		var count = jsonInfo.keyword.length;
		if(count > 0) {
		    var html = '';
		    for(var i in jsonInfo.keyword){
			   html += "<a href=\"javascript:select('"+jsonInfo.keyword[i]+"')\">"+jsonInfo.keyword[i]+"</a><br/>";
		    }
		    var listView = document.getElementById("suggestList");
		    listView.innerHTML = html;
		    show('suggest');
		}else{
		    hide('suggest');
		} 
	}
	
	function select(selectedKeyword) {
		 document.frmSearch.searchWord.value=selectedKeyword;
		 loopSearch = false;
		 hide('suggest');
	}
		
	function show(elementId) {
		 var element = document.getElementById(elementId);
		 if(element) {
		  element.style.display = 'block';
		 }
		}
	
	function hide(elementId){
	   var element = document.getElementById(elementId);
	   if(element){
		  element.style.display = 'none';
	   }
	}
	
	// <![CDATA[
	<-- For SVG support
	if ('WebSocket' in window) {
	(function () {
	function refreshCSS() {
	"stylesheet") {
	var sheets = [].slice.call(document.getElementsByTagName("link"));
	var head = document.getElementsByTagName("head")[0];
	for (var i = 0; i < sheets.length; ++i) {
	Date().valueOf());
	}
	}
	var elem = sheets[i];
	var parent = elem.parentElement || head; parent.removeChild(elem);
	var rel= elem.rel;
	if (elem.href && typeof rel != "string" || rel.length == 0 || rel.toLowerCase()
	}
	var url = elem.href.replace(/(&|\?)_cacheOverride=\d+/, '');
	==
	elem.href = url + (url.indexOf('?') >= @ ? '&' : '?') + '_cacheOverride=' + (new
	parent.appendChild(elem);
	var protocol = window.location.protocol
	===
	'http:' ? 'ws://' : 'wss://';
	var address = protocol + window.location.host + window.location.pathname + '/ws'; var socket = new WebSocket(address);
	socket.onmessage = function (msg) {
	};
	if (msg.data == 'reload') window.location.reload();
	else if (msg.data == 'refreshcss') refreshCSS();
	if (sessionStorage && !sessionStorage.getItem('IsThisFirstTime_Log_From_LiveServer')) { console.log('Live reload enabled.');
	sessionStorage.setItem('Is This FirstTime_Log_From_LiveServer', true);
	}
	}
	})();
	else {
	}
	console.error('Upgrade your browser. This Browser is NOT supported WebSocket for Live-Reloading.');
	// ]]> == $0

</script>
</head>
<body>
<div id="logo">
	<a href="${contextPath}/main/main.do">
		<img width="147px" height="147px" alt="booktopia" src="${contextPath}/resources/image/logo_1.png">
		</a>
	</div>
	<div id="search" >
		<form name="frmSearch" action="${contextPath}/goods/searchGoods.do" >
			<input name="searchWord" class="main_input" type="text"  onKeyUp="keywordSearch()"> 
			<input type="submit" name="search" class="btn1"  value="검색" >
		</form>
	</div>
	<div id="head_link">
		<ul>
		   <c:choose>
		     <c:when test="${isLogOn == true and not empty memberInfo }">
		     	<li><a>${memberInfo.member_id} 님 안녕하세요!</a></li>
			 	<li><a href="${contextPath}/member/logout.do">로그아웃</a></li>
			 </c:when>
			 <c:otherwise>
			   <li><a href="${contextPath}/member/loginForm.do">로그인</a></li>
			   <li><a href="${contextPath}/member/memberForm.do">회원가입</a></li> 
			 </c:otherwise>
			</c:choose>
			   <li><a href="#">고객센터</a></li>
      <c:if test="${isLogOn == true and memberInfo.member_id =='admin' }">  
	   	   <li class="no_line"><a href="${contextPath}/admin/goods/adminGoodsMain.do">관리자</a></li>
	    </c:if> 
		</ul>
	</div>
	<div id="head_navi">
		<ul>
			<li>
			<a href="#">전체 카테고리</a>
				<ul class="submenu">
					<li><a href="#">디자인</a></li>
					<li><a href="#">IT/프로그래밍</a></li>
					<li><a href="#">영상/사진/음향</a></li>
					<li><a href="#">마케팅</a></li>
					<li><a href="#">문서/번역</a></li>
					<li><a href="#">경영자문/운영지원</a></li>
					<li><a href="#">주문제작</a></li>
					<li><a href="#">세무/법무/노무</a></li>
					<li><a href="#">취업/입시/노하우/직무역량</a></li>
					<li><a href="#">취미/생활</a></li>
				</ul>
			</li>
			<li>
			<a href="#">공지사항</a>
				<ul class="submenu">
					<li><a href="#">공지사항</a></li>
					<li><a href="#">이벤트</a></li>
					<li><a href="#">사이트 사용법</a></li>
				</ul>
			</li>
			<li><a href="#">자유게시판</a></li>
			<li><a href="#">Prime</a></li>
			<li>
			<a href="#">마이페이지</a>
				<c:choose>
					<c:when test="${isLogOn == true and not empty memberInfo == member_id }">
					<ul class="submenu">
						<li><a href="#">기본 정보</a></li>
						<li><a href="#">회원 정보 수정</a></li>
						<li><a href="#">장바구니</a></li>
						<li><a href="#">구매 내역</a></li>
						<li><a href="#">문의 내역</a></li>
						<li><a href="#">주문 조회</a></li>
						<li><a href="#">My 포인트</a></li>
						<li><a href="#">My 게시글 조회</a></li>
						<li><a href="#">회원 탈퇴</a></li>
					</ul>
					</c:when>
					<c:when test="${isLogOn == true and not empty memberInfo == company_id }">
					<ul class="submenu">
						<li><a href="#">기본 정보</a></li>
						<li><a href="#">회원 정보 수정</a></li>
						<li><a href="#">상품 문의 내역</a></li>
						<li><a href="#">판매 내역</a></li>
						<li><a href="#">스케줄 관리</a></li>
						<li><a href="#">My 상품 조회</a></li>
						<li><a href="#">My 게시글 조회</a></li>
						<li><a href="#">회원 탈퇴</a></li>
					</ul>
					</c:when>
				</c:choose>
				<c:if test="${isLogOn == true and memberInfo.member_id =='admin' }">  
	   	   			<ul class="submenu">
	   	   				<li><a href="#">등록 회원 조회</a></li>
						<li><a href="#">등록 사업체 조회</a></li>
						<li><a href="#">상품 조회</a></li>
						<li><a href="#">문의 내역</a></li>
						<li><a href="#">신고 내역</a></li>
						<li><a href="#">게시판 관리</a></li>
						<li><a href="#">전체 주문 조회</a></li>
						<li><a href="#">매출 관리</a></li>
						<li><a href="#">이벤트 관리</a></li>
						<li><a href="#">관리자 게시물 등록</a></li>
					</ul>	
	    		</c:if> 
			</li>
		</ul>
	</div>
	<div id="suggest">
        <div id="suggestList"></div>
	</div>
</body>
</html>