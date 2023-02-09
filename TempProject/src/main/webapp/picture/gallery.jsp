<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html class="no-js">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Go out Gallery</title>
<meta name="description" content="Add a description" />
<meta name="keywords" content="Add keywords" />
<meta name="author" content="Codrops" />
<link rel="shortcut icon" href="../picute/image/favicon.ico">
<link rel="stylesheet" type="text/css" href="../picture/css/default.css" />
<link rel="stylesheet" type="text/css"
	href="../picture/css/component.css" />
<script src="../picture/js/modernizr.custom.js"></script>
<script type="text/javascript">
	var _gaq = _gaq || [];
	_gaq.push([ '_setAccount', 'UA-7243260-2' ]);
	_gaq.push([ '_trackPageview' ]);

	(function() {
		var ga = document.createElement('script');
		ga.type = 'text/javascript';
		ga.async = true;
		ga.src = ('https:' == document.location.protocol ? 'https://ssl'
				: 'http://www')
				+ '.google-analytics.com/ga.js';
		var s = document.getElementsByTagName('script')[0];
		s.parentNode.insertBefore(ga, s);
	})();
</script>
    <style type="text/css">
    * {
    font-family: 'GmarketSansMedium';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
    font-weight: normal;
    font-style: normal;
    font-size: 14px;
}
    </style>

</head>
<body>



	<div class="container">

		<div class="codrops-top clearfix"
			style="margin-top: 5px; margin-left: 5px">
			<span class=""><a href="../main/main.do"><strong>Home</strong></a><a
				href="../picture/list.do"><strong>Exit</strong></a></span>
		</div>
		<!--/ Codrops top bar -->


		<div id="gr-gallery" class="gr-gallery">
			<div class="gr-main">
				<c:forEach var="vo" items="${list }" begin="1" end="10" step="1">
					<figure>
						<div>
							<img src="${vo.image }" alt="img01" />
						</div>
						<figcaption>
							<h2>
								<span>${vo.title }</span>
							</h2>
							<div>
								<p>by ${vo.name }</p>
							</div>
						</figcaption>
					</figure>
				</c:forEach>
			</div>
		</div>
	</div>
	<!-- /container -->

	<script src="../picture/js/jquery.min.js"></script>
	<script src="../picture/js/wallgallery.js"></script>
	<script>
		$(function() {

			Gallery.init({
				layout : [ 3, 2, 3, 2 ]
			});

		});
	</script>
	<script src="../picture/js/demoad.js"></script>
</body>
</html>