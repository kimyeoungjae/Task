<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl"
	crossorigin="anonymous">
<style>
body {
	background-color: #6c757d;
}

table {
	height: 100%;
	color: white;
}

table tr {
	border: 1px solid black;
	background-color: black;
}

#object {
	height: 100%;
}


</style>

</head>
<body>
<body onload="printClock()">

<% String rs = request.getParameter("rs"); %>

	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<div class="container-fluid">
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo01"
				aria-controls="navbarTogglerDemo01" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarTogglerDemo01">

				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li><span
						style="width: 500px; height: 100px; line-height: 45px; color: #666; font-size: 30px; text-align: center;"
						id="clock">> </span></li>

				</ul>
				<form class="d-flex">
					<ul class="navbar-nav me-auto mb-2 mb-lg-0">
						<li class="nav-item"><a class="nav-link" href="#">관제페이지</a></li>
						<li class="nav-item"><a class="nav-link" href="#">이전페이지</a></li>
					</ul>
					<span class="navbar-toggler-icon mr-2 my-2"></span>
				</form>
			</div>
		</div>
	</nav>

	<div class="container-fluid mx-0">
		<div class="row mx-0 my-3">
			<div class="col-8 mx-0">
				<div class="ratio ratio-16x9">
					<iframe src="https://www.youtube.com/embed/zpOULjyy-n8?rel=0"
						title="YouTube video"></iframe>
				</div>
			</div>
			<div class="col-2">
				<table style="border: 1px solid black; text-align: center;"
					class="col-12">
					<tr>
						<td><button onclick="change0()">전체카메라</button></td>
					</tr>
					<tr>
						<td><button onclick="change1()">카메라1</button></td>
					</tr>
					<tr>
						<td><button onclick="change2()">카메라2</button></td>
					</tr>
					<tr>
						<td><button onclick="change3()">카메라3</button></td>
					</tr>
				</table>

			</div>

			<div class="col-2">
				<form action="Controller" method="post" id = "object">
					<table style="border: 1px solid black; text-align: center;"	class="col-12">
						<input class="cameranum" type="hidden" name="camera" value="0">
						<input class="objectnum" type="hidden" name="object" value="0">
						<tr>
							<td><input type="submit" value="전체 개체" onclick="objectcg0()"></td>
						</tr>
						<tr>
							<td><input type="submit" value="1번 개체" onclick="objectcg1()"></td>
						</tr>
						<tr>
							<td><input type="submit" value="2번 개체" onclick="objectcg2()"></td>
						</tr>
						<tr>
							<td><input type="submit" value="3번 개체" onclick="objectcg3()"></td>
						</tr>
						<tr>
							<td><input type="submit" value="4번 개체" onclick="objectcg4()"></td>
						</tr>
					</table>
			</div>
			</form>
		</div>

	</div>
	
	<div class="container-fluid mx-0">
		<div class="row">
			<div class="col-12">
				<% if(rs==null){ %>				
				<img class="img-fluid p-3" src="./img/save.1.1.png" alt="">
			<% }else{%>
				<img class="img-fluid p-3" src="./img/save.<%=rs %>.png" alt="">
				<%} %>
			</div>
		</div>
	</div>





	<!-- Optional JavaScript; choose one of the two! -->



	<!-- Option 1: Bootstrap Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0"
		crossorigin="anonymous"></script>

	<!-- Option 2: Separate Popper and Bootstrap JS -->

	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.6.0/dist/umd/popper.min.js"
		integrity="sha384-KsvD1yqQ1/1+IA7gi3P0tyJcT3vR+NdBTt13hSJ2lnve8agRGXTTyNaBYmCR/Nwi"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.min.js"
		integrity="sha384-nsg8ua9HAw1y0W1btsyWgBklPnCUAFLuTMS2G72MMONqmOymq585AcH49TLBQObG"
		crossorigin="anonymous"></script>

	<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>

	<script>
		function printClock() {

			var clock = document.getElementById("clock"); // 출력할 장소 선택
			var currentDate = new Date(); // 현재시간
			var calendar = currentDate.getFullYear() + "-"
					+ (currentDate.getMonth() + 1) + "-"
					+ currentDate.getDate() // 현재 날짜
			var amPm = 'AM'; // 초기값 AM
			var currentHours = addZeros(currentDate.getHours(), 2);
			var currentMinute = addZeros(currentDate.getMinutes(), 2);
			var currentSeconds = addZeros(currentDate.getSeconds(), 2);

			if (currentHours >= 12) { // 시간이 12보다 클 때 PM으로 세팅, 12를 빼줌
				amPm = 'PM';
				currentHours = addZeros(currentHours - 12, 2);
			}

			if (currentSeconds >= 50) {// 50초 이상일 때 색을 변환해 준다.
				currentSeconds = '<span style="color:#de1951;">'
						+ currentSeconds + '</span>'
			}
			clock.innerHTML = calendar + "  " + currentHours + ":"
					+ currentMinute + ":" + currentSeconds
					+ " <span style='font-size:15px;'>" + amPm + "</span>"; //날짜를 출력해 줌

			setTimeout("printClock()", 1000); // 1초마다 printClock() 함수 호출
		}

		function addZeros(num, digit) { // 자릿수 맞춰주기
			var zero = '';
			num = num.toString();
			if (num.length < digit) {
				for (i = 0; i < digit - num.length; i++) {
					zero += '0';
				}
			}
			return zero + num;
		}

		function change0() {
			$('iframe').attr("src",
					"https://www.youtube.com/embed/zpOULjyy-n8?rel=0")
			$('.cameranum').attr("value", "0")

		}

		function change1() {
			$('iframe')
					.attr("src", "https://www.youtube.com/embed/IdDgLLllxDE")
			$('.cameranum').attr("value", "1")

		}

		function change2() {
			$('iframe')
					.attr("src", "https://www.youtube.com/embed/sIzlBUIqhCk")
			$('.cameranum').attr("value", "2")

		}

		function change3() {
			$('iframe')
					.attr("src", "https://www.youtube.com/embed/AITuNQSCR6k")
			$('.cameranum').attr("value", "3")

		}
		function objectcg0() {
			$('.objectnum').attr("value", "0")

		}
		function objectcg1() {
			$('.objectnum').attr("value", "1")

		}
		function objectcg2() {
			$('.objectnum').attr("value", "2")

		}
		function objectcg3() {
			$('.objectnum').attr("value", "3")

		}

		function objectcg4() {
			$('.objectnum').attr("value", "4")

		}
		
		
	</script>

</body>
</html>