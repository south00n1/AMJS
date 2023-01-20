desc god_member_3;
insert into god_member_3
values('master','1234','관리자','',sysdate,'','post','addr1','','phone2','');
insert into god_member_3
values('choe','1234','최선형','',sysdate,'','post','addr1','','phone1','');

desc god_ask_3;
insert into god_ask_3
values(1,'예약 완료 후 결제 수단 변경 가능한가요?','예약','예약 완료했는데 결제 수단을 변경하고 싶어요.','1234',sysdate,'답변완료','',1,'1','','','2','choe');
insert into god_ask_3
values(4,'re: 예약 완료 후 결제 수단 변경 가능한가요?','예약','결제 수단 변경은 마이페이지에서 가능합니다.','1234',sysdate,'답변완료','',1,'2','1','1','','master');
insert into god_ask_3
values(2,'비회원으로 결제한 정보 조회','회원','비회원으로 결제한 정보를 회원 정보에 불러올 수 있을까요?','1234',sysdate,'','',2,'','','','','choe');
insert into god_ask_3
values(3,'이벤트 당첨 안내','기타','이벤트 당첨자 발표일이 언제인가요?','1234',sysdate,'','',3,'','','','','choe');
insert into god_ask_3
values(5,'re: 예약 완료 후 결제 수단 변경 가능한가요?','예약','감사합니다.','1234',sysdate,'답변완료','',1,'3','2','1','','choe');

desc god_faq_3;
insert into god_faq_3 values(1,'회원','아이디, 비밀번호를 잊어버렸어요.','아이디 찾기 
1) 개인회원 
회원 로그인 화면에서 [아이디 찾기]를 클릭 하여 간편찾기(이메일, 전화번호), 휴대폰 인증 또는 아이핀(I-Pin)인증을 통해 확인이 가능합니다. 
2) 법인회원 
법인명, 사업자등록번호를 통하여 확인이 가능합니다. 

비밀번호 찾기
1) 개인회원
회원 로그인 화면에서 [비밀번호 찾기]를 클릭 하여 아이디 와 가입 시 기입한 이메일 주소 또는 휴대폰번호를 입력 하여 임시비밀번호 발급이 가능합니다.
위의 정보로 받을 수 없는 경우 본인인증 후 새 비밀번호로 변경해주세요.
2) 법인회원
회원 아이디, 법인명, 사업자번호 입력 후 확인 > 가입 시 기입한 이메일 주소 또는 휴대폰번호로 임시비밀번호 발급이 가능합니다.
※ 위 경로로 ID 및 비밀번호를 찾을 수 없는 경우에는 고객센터(1544-3800)로 문의하시기 바랍니다.','');
insert into god_faq_3 values(2,'회원','회원가입은 어떻게 하나요?','YES24 화면 우측 상단의 [회원가입]을 클릭한 후, 약관동의 -> 회원구분 및 본인인증 -> 고객정보입력 -> 가입완료의 단계를 거치면 회원가입이 가능합니다.

1. 14세 이상 일반 회원
휴대폰인증 또는 아이핀 인증 후  가입이 가능합니다.

2. 14세 미만 어린이 회원
- 휴대폰 인증
부모님(법정대리인)의 휴대폰번호 입력 후 인증 >가입 정보 입력 시 부모님(법정대리인)본인 확인 인증 및 동의 확인 후 가입이 가능합니다.
- 아이핀 인증
공공IPIN센터에서 은행용 공인인증서, 주민등록확인시스템, 주민 센터 방문을 통해 공공 아이 핀을 발급 받아 가입이 가능합니다.

3. 법인회원 ( 기업, 기관, 학교)
법인명, 사업자등록번호, 대표자명 정보 입력 후 가입 가능하며, 사업자등록번호가 없는 경우 고유번호를 입력 하신 후 가입이 가능합니다.

4.해외 거주 회원
가입을 위한 정보 입력 후 인증메일을 받아 가입이 가능합니다.

※연령인증이 필요한 19금 상품구매나 티켓 예매는 본인인증 (휴대폰인증 또는 아이핀)후에 사용가능합니다.

5.간편회원 가입
본인명의의 휴대폰이나 아이핀이 없는 경우, 수신 가능한 휴대폰 또는 이메일을 통해 가입할 수 있습니다.
-SMS인증
성함과 생년월일, 성별 입력 후 휴대폰번호를 기재하시면 인증번호가 전송됩니다.
인증번호 확인 후 회원가입이 가능합니다.
-이메일인증
성함과 생년월일, 성별 입력 후 이메일주소를 기재하시면 인증메일이 전송됩니다.
인증메일을 통해서 회원가입이 가능합니다.

※ 간편회원 가입의 경우 본인인증 후 YES24 상품구매가 가능합니다.
※ 일부 제휴사를 통한 제휴포인트 적립혜택, 연령인증이 필요한 19금 상품구매나 티켓 예매는 본인인증 (휴대폰인증 또는 아이핀) 후에 사용 가능합니다.','');
insert into god_faq_3 values(4,'회원','회원탈퇴는 어떻게 하나요?','PC 홈페이지 접속 → [마이페이지] 접속 후  정보내역 → 회원탈퇴에서 정보 확인, 탈퇴사유와 비밀번호를 입력 후 회원 탈퇴가 가능합니다.

< 회원정보 및 계좌 내역 삭제 >
회원탈퇴 즉시 회원정보는 모두 삭제되며, 재가입시에도 복원되지 않습니다.
- 삭제되는 정보 : 개인정보, 계좌내역(YES포인트, YES머니, 예치금 등) , YES블로그 계정, YES24 중고샵 판매관리 계정

※ 탈퇴 후 블로그 및 블로그와 연결된 이용기록(ex.상품리뷰)은 모두 삭제되며, 삭제된 데이터는 복구되지 않습니다.
단, 게시판형 서비스에 등록한 게시물은 삭제되지 않고 유지됩니다.

- 회원탈퇴 시 중고샵 판매계정 및 판매자회원 자격이 자동으로 상실됩니다.(주문/정산 중에는 탈퇴불가)
- 회원탈퇴 시 중고매장에서 회원으로 서비스 이용이 불가합니다.

< 1개월간 회원 재 가입 제한 >
회원탈퇴 후, 1개월간은 회원 재가입이 불가능합니다.

< 탈퇴 후 정보보관 >
전자상거래 등에서의 소비자 보호에 관한 법률 제6조에 의거 성명, 주소 등 거래의 주체를 식별할 수 있는 정보에 한하여 서비스 이용에 관한 동의를 철회한 경우에도 이를 보존할 수 있으며, 동법 시행령 제6조에 의거 다음과 같이 거래기록을 보관합니다.
① 표시, 광고에 관한 기록 : 6개월
② 계약 또는 청약철회 등에 관한 기록 : 5년
③ 대금결제 및 재화 등의 공급에 관한 기록 : 5년
④ 소비자의 불만 또는 분쟁처리에 관한 기록 : 3년

< 탈퇴 후 이용제한 >
회원탈퇴 후, YES24 온라인 및 중고매장에서 이벤트 참여, 이용 내역 조회, 상담 및 제반 서비스(반품, 환불, 교환)등이 제한될 수 있으니 이점 양지해주시기 바랍니다.','');
insert into god_faq_3 values(3,'회원','본인 인증 방법에는 어떤 것들이 있나요?','회원가입 방법, 본인 인증 수단, 회원가입 방법에 따른 본인 인증 가능 수단을 안내해 드리겠습니다.
회원가입 방법
-14세 이상 일반회원 : 14세 이상 국내거주 내/외국인 회원
-14세 미만 어린이 회원 : 14세 미만인 국내거주 내/외국인 회원
-법인회원 : 법인실명인증 후 가입한 회원
-해외거주 회원 : 해외에 거주하는 외국인 회원
-실명 인증 회원 : 2012년 08월 18일 이전 주민번호 입력을 통해 실명인증으로 가입한 회원

*14세 미만 어린이 회원의 경우 : 가입 시 법정대리인의 동의 및 본인인증 필요
*법인회원의 경우 : 성인콘텐츠 구매제한
*해외 거주 회원의 경우 : 티켓 예매, 성인콘텐츠 구매제한

본인인증 수단
-휴대폰 본인인증 : 본인 명의 휴대폰 인증을 통한 본인 인증 방법으로 가장 간편하고 일반적인 본인인증 방법
-I-PIN 본인인증
 a.일반 I-PIN : 본인인증 수단이 있는 고객이 발급 받는 I-PIN (I-PIN 발급받기 = http://www.vno.co.kr/ipin3/personal/sub_03.asp )
 b.공공 I-PIN : 본인인증 수단이 업는 고객이 발급 받는 I-PIN (포털 사이트 검색 창 공공 아이핀 검색)
-공공 I-PIN 발급이 불가한 해외거주 내국인 및 해외거주 외국인이 여권을 통해 인증하는 방법 (자세한 문의는 YES24 고객센터 대표번호 1544-3800, 1:1친절상담)','');
insert into god_faq_3 values(5,'티켓','현장 수령으로 예매했는데, 배송으로 변경하고 싶습니다.','티켓 배송이 가능한 상품의 경우 배송비 3,000원을 추가 결제하시면 가능합니다. 단, 공연일 14일 전까지만 배송 신청이 가능하며 특정 할인을 받아 예매하신 경우 배송 신청이 불가할 수 있습니다.','');
insert into god_faq_3 values(6,'티켓','티켓 수령 방법에는 어떤 것이 있나요?','[현장수령]
- 공연 관람 당일 공연장에서 예매 내역 확인 후 공연을 수령하실 수 있습니다.
- 공연 수령을 위해 신분증과 예매내역서를 지참해주시기 바랍니다.
- 특정 할인을 적용 받아 예매한 경우 증빙자료가 요구될 수 있습니다.

[배송]
- 예매완료(결제익일) 기준 4~5일 이내에 배송됩니다. (주말, 공휴일 제외한 영업일 기준)
- 배송료는 3,000원이며 공연일 14일 전 예매 건에 한해 배송접수 가능합니다.
- 단, 할인 받은 예매 혹은 공연 특성상 배송이 불가할 수 있습니다.   

* 공연은 묶음 배송이 불가합니다.
* 상품에 따라 공연 수령 방법에 제한이 있을 수 있습니다.','');
insert into god_faq_3 values(7,'티켓','예매한 티켓의 배송지를 변경할 수 있나요?','티켓 배송이 시작되기 전(발송대기 상태)에는 MY티켓>예매상세내역 에서 직접 변경할 수 있습니다. 배송이 시작된 이후에는 배송지 주소 변경이 불가합니다.','');
insert into god_faq_3 values(12,'티켓','티켓이 반송되었습니다. 어떻게 해야하나요?','티켓 배송 중 고객부재, 수취인 불명 등의 사유로 반송처리 될 수 있습니다. 티켓이 반송된 경우 현장 수령으로 변경되며, 공연 당일 공연장에서 티켓 수령을 위해 예매자 본인 신분증과 예매내역서를 지참해주시기 바랍니다. 
* 배송 반송 처리 시 배송비 환불 불가 합니다.','');
insert into god_faq_3 values(8,'결제','현금영수증은 어떻게 발행하나요?','상품 주문시 <결제하기> 페이지에서 무통장입금(가상계좌), 실시간 계좌이체, 가족계좌, 예치금, YES24상품권 등으로 1원 이상 결제시 현금영수증을 발행할 수 있습니다.(2008년7월1일부터 시행) 
YES머니 및 쿠폰 사용금액 등 비현금성 결제는 포함되지 않으며 위의 결제수단을 복수 이용하여 1원이상 결제해도 현금영수증 발행이 가능합니다.(비회원 구매도 가능)
마이페이지>주문내역/배송조회>상세내역>해당 주문번호 클릭 후 현금영수증 발행 여부를 확인할 수 있고 수정, 재발행 등이 가능합니다.
개인(소득증빙)은 휴대폰번호로, 사업자(지출증빙)은 사업자등록번호로 발행할 수 있으며 개인→타인, 개인→사업자, 사업자→개인 등으로 변경해서 발행할 수 있습니다.

※ 마이페이지 > 주문 내역 / 배송 조회 > 주문 번호 선택 후 상세 내역에서 현금 영수증 발행 내용 확인 및 재발행/ 인쇄/ 출력 등이 가능합니다.
※ 실시간 계좌이체, 가족계좌, 예치금, YES24상품권, 무통장입금의 경우 발송완료 후 48시간 이후 국세청에서 확인이 가능합니다.
※ 현금영수증 발급유효기간(연말정산 가능 기간)은 전년도 12월 이후부터 금년 11월까지 입니다.
※ 무통장입금(가상계좌 포함)으로 결제 후 입금을 하지 않으시면 현금영수증을 발행하셔도 국세청에 신고되지 않아 무효화됩니다.','');
insert into god_faq_3 values(9,'결제','꼭 회원으로 가입해야만 예매가 가능한가요?','회원이 아니어도 비회원으로도 주문이 가능합니다.
* 주문하려는 상품이 단권일 경우
상품 선택 후 [구매하기] 누르면 회원/비회원 주문의 선택창이 뜹니다.
이 중 [비회원 주문]을 선택 후 다음 단계로 진행하면 회원 가입 없이도 주문이 가능합니다.

*주문하려는 상품이 여러권일 경우
상품 검색 후 카트에 담아 카트 화면 하단에 [비회원 주문] 선택 후 다음 단계로 진행하면 회원 가입 없이도 주문이 가능합니다.단, 연령 제한이 있는 상품은 비회원 주문이 불가능합니다

*비회원 주문확인
비회원 주문에 대한 확인은 로그인 화면 하단 [비회원 주문확인]에서 주문번호와 주문시 지정한 비밀번호를 입력하시면 확인이 가능합니다.','');
insert into god_faq_3 values(10,'기타','게시판 글 작성이 안 됩니다.','게시판에서 작성한 글이 게재되지 않는다면, 여러 가지 원인이 있을 수 있습니다.
특정 브라우저와 호환성 문제이거나, OS 호환성 문제일 수 있습니다.
리뷰의 경우에는 팝업 금지를 해둔 경우 글 작성이 안 될 수 있습니다.
다양한 환경에서 글 작성을 시도해 주시길 바라며, 모바일에서도 리뷰 작성이 가능하니 길지 않은 글은 모바일을 이용해보셔도 좋습니다.
동일한 오류 발생 시 고객센터 1:1 문의를 통해 오류 증상, OS, 웹 브라우저 종류 및 버전 캡처 화면을 보내주시면 확인해서 안내드리도록 하겠습니다.','');
insert into god_faq_3 values(11,'기타','작성한 리뷰나 댓글을 수정/삭제할 수 있나요?','●PC
리뷰는 마이페이지 > 나의 리뷰/ 한줄평 > 내가 작성한 리뷰/한줄평탭에서 [상태]버튼을 누른 후 수정/삭제 하실 수 있으며, YES24 블로그> 나의리뷰에서  수정/삭제가 가능합니다.

●모바일
리뷰는 왼쪽 상단 메뉴 > YES블로그 > 내 블로그 > 나의 리뷰 > 기본 카테고리에서 수정 또는 삭제가 가능합니다.

※ 삭제된 리뷰는 다시 복구되지 않습니다. 삭제하실 때는 다시 한번 신중하게 생각해 주세요.
※ <이 주의 리뷰>로 선정된 리뷰는 선정일로부터 3개월간 삭제하실 수 없습니다.','');
commit;