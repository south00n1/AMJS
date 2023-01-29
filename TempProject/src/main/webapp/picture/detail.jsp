<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.page-product__category .category-item {
	display: block;
}

.page-product__category .category-item__body {
	display: block;
}

.breadcrumbs__link {
	color: #9B9B9B;
	font-size: 12px;
	font-weight: 400;
	line-height: 14px;
	text-decoration: none;
	position: relative;
}

.breadcrumbs__link:after {
	content: "/";
	margin-left: 5px;
}

.breadcrumbs__link:last-child:after {
	content: none;
}

@media screen and (min-width: 768px) {
	.product-detail {
		display: grid;
		grid-template-columns: 1fr 1fr;
	}
}

.product-gallery {
	max-width: 480px;
	margin: 0 auto;
}

@media screen and (min-width: 768px) {
	.product-gallery {
		max-width: 100%;
	}
}

@media screen and (min-width: 768px) {
	.product-gallery {
		display: flex;
		flex-direction: row-reverse;
	}
}

.product-gallery__view-item img {
	width: 100%;
	height: auto;
}

@media screen and (min-width: 768px) {
	.product-gallery__thumbs {
		margin-right: 10px;
		height: 100%;
	}
}

@media screen and (min-width: 768px) {
	.product-gallery__thumbs-list {
		width: 50px;
		height: 100%;
	}
}

@media screen and (min-width: 1024px) {
	.product-gallery__thumbs-list {
		width: 80px;
	}
}

.product-gallery__thumbs-item img {
	width: 100%;
	height: auto;
}

.product-detail-info__cont {
	margin: 0 auto;
	margin-top: 70px;
}

@media screen and (min-width: 768px) {
	.product-detail-info__cont {
		max-width: 550px;
		padding: 0 0 0 50px;
	}
}

.product-detail-info__category {
	color: #000000;
	font-size: 16px;
	font-weight: 700;
	line-height: 19px;
	text-align: center;
	margin-bottom: 15px;
}

@media screen and (min-width: 768px) {
	.product-detail-info__category {
		text-align: left;
	}
}

.product-detail-info__name {
	color: #000000;
	font-size: 40px;
	font-weight: 600;
	line-height: 36px;
	text-align: center;
	margin-bottom: 15px;
}

@media screen and (min-width: 768px) {
	.product-detail-info__name {
		text-align: left;
	}
}

.product-detail-info__price {
	color: #000000;
	font-size: 16px;
	font-weight: 700;
	line-height: 19px;
	text-align: center;
	margin-bottom: 30px;
}

@media screen and (min-width: 768px) {
	.product-detail-info__price {
		text-align: left;
	}
}

.product-detail-info__desc {
	color: #4A4A4A;
	font-size: 16px;
	font-weight: 400;
	line-height: 25px;
	text-align: justify;
}

.product-detail-info__quantity {
	margin-top: 50px;
}

.product-detail-info__action {
	margin-top: 50px;
}
</style>


</head>
<body>

	<div class="page-product">
		<div class="container">
			<div class="product-detail my-5">
				<div class="product-gallery">
					<div class="product-gallery__view" style="">
						<img src="${vo.image }" alt=""
							style="width: 600px; height: 600px; margin-top: 70px;">
					</div>
				</div>
				<div class="product-detail-info">
					<div class="product-detail-info__cont mx-3"
						">
						<p class="product-detail-info__name">${vo.title }</p>

						<p class="product-detail-info__desc mt-5"
							style="font-size: 0.9rem">
							작가 : <span style="font-size: 0.8rem;">${vo.name}</span><br>
							작품정보 : <span style="font-size: 0.8rem;">${vo.info}</span><br>
							작품코드 : <span style="font-size: 0.8rem">${vo.code }</span><br>
							<hr>
							추천이유 : <span style="font-size: 0.8rem">${vo.content2 }</span>
							<hr>
							큐레이터 노트 : <span style="font-size: 0.8rem">${vo.content }</span>
						</p>

					</div>
				</div>
			</div>
			<div style="display: flex; justify-content: space-between;">
				<div>
					<c:forTokens items="${vo.image2 }" delims="^" var="image" begin="1">
						<img src="${image }" class="mr-2"
							style="display: inline-block; width: 100px; height: 100px;">
					</c:forTokens>
				</div>
				<div>
					<a href="../picture/list.do" class="btn btn-sm"
						style="background-color: #27375C; color: #fff;">목록</a>
				</div>
			</div>
		</div>
	</div>



</body>
</html>