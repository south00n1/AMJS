<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.mypage_home_title {
	margin: 0px;
	margin-bottom: 10px;
	padding-bottom: 15px;
	border-bottom: 2px solid #E2E2E2;
}
.mypage_home_content {
	margin: 0px;
	text-align: center;
}
.mypage_home_subtitle {
	color: #27375C;
}
    * {
    font-family: 'GmarketSansMedium';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
/**
 * Tabs
 */
.tabs {
  display: flex;
  flex-wrap: wrap;
}

.tabs label {
  order: 1;
  display: block;
  padding: 1rem 2rem;
  margin-right: 0.2rem;
  cursor: pointer;
  background: #FFF;
  font-weight: bold;
  transition: background ease 0.2s;
}

.tabs .tab {
  order: 99;
  flex-grow: 1;
  width: 100%;
  display: none;
  padding: 1rem;
  background: #fff;
}

.tabs input[type=radio] {
  display: none;
}

.tabs input[type=radio]:checked + label {
	color:white;
  background: #27375C;
}

.tabs input[type=radio]:checked + label + .tab {
  display: block;
}

@media (max-width: 45em) {
  .tabs .tab,
.tabs label {
    order: initial;
  }

  .tabs label {
    width: 100%;
    margin-right: 0;
    margin-top: 0.2rem;
  }
}
/**
 * Generic Styling
*/


#box-section1 {
  margin-top:100px;  
  display:flex;
  justify-content: center;
}

.box1 {
  height:100px;  
  width:200px;
  float:left;
  border-radius:8px;
  padding:20px;
  text-align:center;
  display:flex;
  flex-direction: column;
  transition: all 0.2s linear;
  cursor:pointer;
}
.box-header {
  display:flex;
  flex:1;
  flex-direction:column;
  justify-content: center;
  letter-spacing:1.5px;
  font-family: 'Roboto-Light', sans-serif;
  font-weight:100; 
}
.box-content {
  display:flex;
  flex:4;
  flex-direction: column;
  justify-content: center;
  align-items:center;
  font-size:45px;
  letter-spacing:1px;
  margin-top:-40px;
}
.box-footer {
  display:flex;
  flex:1;
  justify-content: center;
  align-items: center;
}

.price {
  font-size:2.2em;
  position:relative;
  
}
.dollar {
  position:absolute;
  font-size:20px;
  font-weight:100;
  font-family: 'Roboto-Light', sans-serif;
  top:-8px;
  right:0;
  letter-spacing:0.5px;
}
.price-details {
  font-size:14px;
  width:100%; 
  font-weight:100;
  
}

.box1.box-purple {
  background:#8893D3;
}
.box1.box-blue {
  background:#73B7DE;
  z-index:1;
}
.box1.box-darkpurple {
  background:#B697F5;
  z-index:2;
}

.box1-blue {
  transform: scale(1.05);
  box-shadow: 2px 2px 16px 1px #487894;
}
.box1:hover {
  transform: scale(1.09);
}
</style>
</head>
<body>
		<div class="col-11 mypage_home_title">
			<h4 class="mypage_home_subtitle">${sessionScope.name }님의 마이페이지입니다.</h4>
		</div>
		<div class="col-11 mypage_home_content" style="display: flex; flex-direction: row;">
		<!--  
			<div style="width:33.3%">
			<b>작성글</b> : ${count1 }개<br>
			<b>작성댓글</b> : ${count2 }개<br>
			<b>작성문의글</b> : ${count3 }개
			</div>
			<div style="width:33.3%">
			<b>예매한 전시회</b> : ${count4 }개
			</div>
			<div style="width:33.3%">
			<b>좋아요</b> : ${count5 }개<br>
			<b>찜</b> : ${count6 }개<br>
			<b>공감</b> : ${count7 }개
			</div>
		-->
		<div class="tabs">
		  <input type="radio" name="tabs" id="tabone" checked="checked">
		  <label for="tabone">Tab One</label>
		  <div class="tab">
		  
		  <div id="box-section1" style="padding: auto;">
		    <div class="box1 box-purple">
		      <div class="box-header">
		        Standard
		        <hr width="10%"/>
		      </div><!-- box-header-->
		      <div class="box1-content"> 
		         Free
		      </div><!-- box-content -->
		    </div><!-- box -->
		    
		    <div class="box1 box-blue">
		      <div class="box-header">
		        Pro
		        <hr width="10%"/>
		      </div><!-- box-header-->
		      <div class="box-content"> 
		        <div class="price">19 <span class="dollar">$</span></div>        
		        <div class="price-details">/ Month</div>
		      </div><!-- box-content -->
		    </div><!-- box -->
		    
		    <div class="box1 box-darkpurple">
		      <div class="box-header">
		        Team
		        <hr width="10%"/>
		      </div><!-- box-header-->
		      <div class="box-content"> 
		        <div class="price">14<span class="dollar">$</span></div>        
		        <div class="price-details">/ Month</div>
		      </div><!-- box-content -->
		    </div><!-- box -->
		  </div>
		  
		  </div>
		  
		  <input type="radio" name="tabs" id="tabtwo">
		  <label for="tabtwo">Tab Two</label>
		  <div class="tab">
		    <h1>Tab Two Content</h1>
		    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
		  </div>
		  
		  <input type="radio" name="tabs" id="tabthree">
		  <label for="tabthree">Tab Three</label>
		  <div class="tab">
		    <h1>Tab Three Content</h1>
		    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
		  </div>
		</div>
		</div>
</body>
</html>