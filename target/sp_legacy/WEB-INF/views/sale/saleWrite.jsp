<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="../fixed/header.jsp" %>

<style>

    .totalBox {
        height: fit-content;
        position: relative;
        width: 1200px;
        margin: auto;
        margin-bottom: 20px;
        /*margin-top: 20px;*/
        /*background: rgba(255, 0, 0, 0.1);*/
        padding: 20px;
        box-sizing: border-box;
        /*box-shadow:0px 0px 10px rgba(0, 0, 0, 0.2);*/
        /*border-radius: 10px;*/
    }

    .liBox {
        display: flex;
        flex-direction: column;
        border-bottom: 2px solid #f9f9f9;
        /*border-bottom: 2px solid rgb(25, 25, 25);*/
        margin-bottom: 20px;
        padding-bottom: 20px;
    }

    .liBox > * {
        flex: 1;
    }

    #openModalBtn,#unCheckBtn {
        all: unset;
        color: white;
        padding: 10px 30px;
        border-radius: 5px;
        cursor: pointer;
        background-color: #ee8703;
        font-size: 16px;
    }


    .SaleModal {
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        display: flex;
        justify-content: center;
        align-items: center;
        z-index: 20;
    }

    .sale_modal_overlay {
        background-color: rgba(0, 0, 0, 0.6);
        width: 100%;
        height: 100%;
        position: absolute;
    }

    .sale_modal_content {
        background-color: white;
        padding: 50px 100px;
        text-align: center;
        position: relative;
        width: 50%;
        top: 0px;
        border-radius: 10px;
        box-shadow: 0 10px 20px rgba(0, 0, 0, 0.19), 0 6px 6px rgba(0, 0, 0, 0.23);
        overflow-y: auto;
        /* 세로 스크롤이 필요한 경우 스크롤 허용 */
        max-height: 70%;
        /* 모달 창의 최대 높이 설정 */
    }

    #closeModalBtn {
        position: absolute;
        top: 10px;
        /* 원하는 위치로 조정 */
        right: 10px;
        /* 원하는 위치로 조정 */
        background-color: transparent;
        /* 배경색 설정 */
        border: none;
        /* 테두리 제거 */
        cursor: pointer;
        /* 마우스 커서를 포인터로 변경 */
    }

    .sale-table-wrapper {
        overflow-y: auto;
        max-height: 200px;
    }

    .sale-addr-tr:hover {
        background-color: rgba(245, 157, 28, 0.5);
        cursor: pointer;
    }


    #saleSearchInput {
        /* 모달 창의 너비에 맞게 조정 */
        width: 100%;
        padding: 10px;
        /* 내부 여백 설정 */
        margin: 0 auto;
        /* 가운데 정렬 */
    }


    #addrTable {
        width: 100%;
        /* addrTable의 너비를 100%로 설정하여 모달 창에 맞춤 */
    }

    #sale_search_addr {
        margin: 0;
    }

    .SaleHidden {
        display: none;
    }

    /* input text 및 textarea 너비 조절 */
    input[type="text"], input[type="number"] {
        /* 전체 너비에서 여백을 뺀 값으로 설정 */
        /*width: calc(100% - 50px);*/
        width: 100%;
        margin: auto;
        padding: 15px;
        /* 내부 여백 설정 */
        margin-top: 10px;
        resize: none;
    }


    #contents {
        width: 100%;
        height: 40vh;
        margin: auto;
        padding: 20px;
        /* 내부 여백 설정 */
        margin-top: 10px;
        resize: none;
    }

    select {
        margin: auto;
        padding: 5px;
        margin-top: 10px;
        resize: none;
    }

    #loadingOverlay {
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(255, 255, 255, 0.8);
        z-index: 20;
        display: none;
    }

    #loadingSpinner {
        border: 5px solid #f3f3f3;
        border-radius: 50%;
        border-top: 5px solid #ee8703;
        width: 50px;
        height: 50px;
        animation: spin 1s linear infinite;
        position: absolute;
        top: 50%;
        left: 50%;
        margin-top: -25px;
        margin-left: -25px;
    }

    @keyframes spin {
        0% {
            transform: rotate(0deg);
        }
        100% {
            transform: rotate(360deg);
        }
    }

    #loadingMessage {
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        font-size: 20px;
    }

    #uploadResult {
        display: flex;
    }

    #uploadResult > div {
        flex: 0 0 auto; /* 자동 크기, 크기 조정 없음 */
        margin-right: 10px; /* 간격 설정 */
    }

    .btnStyle {
        cursor: pointer;
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        padding: 7px 40px;
    }

    .saleTitleText {
        height: 100px;
        font-weight: 900;
        display: flex;
        -webkit-box-align: center;
        align-items: center;
        border-bottom: 2px solid rgb(25, 25, 25);
        margin-block-end: 20px;
    }

    .rightlocate {
        float: right;
    }

    .material-symbols-outlined {
        font-variation-settings: 'FILL' 0,
        'wght' 400,
        'GRAD' 0,
        'opsz' 20;
    }

    .material-symbols-outlined {
        font-variation-settings: 'FILL' 0,
        'wght' 400,
        'GRAD' 0,
        'opsz' 20
    }

    .font16 {
        font-size: 16px;
        margin-top: 10px;
        margin-left: auto;
    }

    .font10 {
        font-size: 10px;
    }

    .font20{
        font-size: 20px;
    }

    .fontWeight {
        font-weight: 600;
    }

    .font30{
        font-weight: 600;
    }

    .marginTopFont10 {
        margin-top: 10px;
    }


    .li-list {
        display: flex;
        margin-top: 5px;
    }

    .li-list::before {
        content: "- ";
    }

    .fixed-submit {
        width: 100%;
        height: 5.5rem;
        background: #eeeeee;
        box-shadow: rgb(229, 229, 229) 0px -1px 0px 0px;
        left: 0px;
        bottom: 0px;
        z-index:12;
        position: sticky;
    }

    .div-submit {
        display: flex;
        height: 100%;
        -webkit-box-pack: end;
        justify-content: flex-end;
        -webkit-box-align: center;
        align-items: center;
        gap: 14px;
        width: 1159px;
        margin: auto;
    }

    .div-line {
        display: flex;
        gap: 20px;
        margin-top: 5px;
    }

    .dadRxL {
        width: 1200px;
        display: flex;
        height: 100%;
        font-size: 20px;
    }


</style>
<div class="totalBox">
    <div id="loadingOverlay">
        <div id="loadingSpinner"></div>
        <div id="loadingMessage">로딩 중...</div>
    </div>
    <div>
        <form id="writeForm" name="writeForm" method="POST" enctype="multipart/form-data">
            <p class="saleTitleText font30">상품 정보</p>
            <div class="form_section_content">
                <label for="fileItem" class="">이미지 삽입</label>
                <input type="file" id="fileItem" name="uploadFile" style="display: none;" multiple>
            </div>
            <br>
            <div id="uploadResult">
                <c:forEach items="${imglist}" var="img">
                <c:if test="${img.imgtype eq 'r'}">
                <div id='result_card'>
                    <img src="/img/display?fileName=${img.img_full_rt}" id="resizable">
                    <div class='imgDeleteBtn' data-file="${img.img_full_rt}">x</div>
            </div>
            </c:if>
            </c:forEach>
    </div>
    <ul>
        <li class="liBox">
    <p class="font20 marginTopFont10">
        제목</p> <input class="font16" id="title" name="title" type="text" placeholder="판매/나눔글 제목을 입력하세요"
                      value="<c:out value='${Sale.title}' />"
                      minlength="1" maxlength="40"/>
    <span class="font16 rightlocate" id="titleCounter">(0/40)</span>
        </li>
        <li class="liBox">
    <div id="categoryContainer">
        <p class="font20 marginTopFont10 fontWeight">카테고리</p>
        <select id="category1" class="font16">
            <option value="" disabled selected>대분류</option>
            <c:forEach var="category" items="${saleCategory1}">
                <option value="<c:out value='${category.sal_cd}' />"><c:out value='${category.name}'/></option>
            </c:forEach>
        </select>

        <select id="category2" class="font16">
            <option value="category2" disabled selected>중분류</option>
        </select>

        <select id="category3" class="font16">
            <option value="category3" disabled selected>소분류</option>
        </select>

        <p class="font16 marginTopFont10" style="color: orangered;" id="salecategoryMsg">대분류 > 중분류 > 소분류를 선택하세요.</p>
        <span class="font16 marginTopFont10" style="color: red;">선택한 카테고리 : <b><p style="display: inline; color: red;" id="sal_name"></p></b></span>
    </div>
        </li>
        <li class="liBox">
    <div id="pro_s_cdContainer">
        <p class="font20 marginTopFont10 fontWeight">상품상태</p>
        <label>
            <input type="radio" name="pro_s_cd" value="S"/>
            <span class="font18 marginTopFont10">새상품(미사용)</span>
            <span class="font16 fontgraycolor"> 사용하지 않은 새 상품</span>
            <br/>
        </label>
        <label>
            <input type="radio" name="pro_s_cd" value="A"/>
            <span class="font18 marginTopFont10">사용감 없음</span>
            <span class="font16 fontgraycolor"> 사용은 했지만 눈에 띄는 흔적이나 얼룩이 없음</span>
            <br>
        </label>
        <label>
            <input type="radio" name="pro_s_cd" value="B"/>
            <span class="font18 marginTopFont10">사용감 적음</span>
            <span class="font16 fontgraycolor"> 눈에 띄는 흔적이나 얼룩이 약간 있음</span><br>
        </label>
        <label>
            <input type="radio" name="pro_s_cd" value="C"/>
            <span class="font18 marginTopFont10">사용감 많음</span>
            <span class="font16 fontgraycolor"> 눈에 띄는 흔적이나 얼룩이 많이 있음</span><br>
        </label>
        <label>
            <input type="radio" name="pro_s_cd" value="D"/>
            <span class="font18 marginTopFont10">고장/파손 상품</span>
            <span class="font16 fontgraycolor"> 기능 이상이나 외관 손상 등으로 수리/수선 필요</span><br>
        </label>
    </div>
        </li>
        <li class="liBox">
    <div id="trade_s_cdContainer">
        <p class="font20 marginTopFont10 fontWeight">
            거래방법(2개 이하)
        </p>
        <div class="div-line">
        <label>
            <input id="trade_s_cd1" type="checkbox" class="trade_s_cd" value="O"/><span class="font18 marginTopFont10"> 온라인</span>
        </label>
        <label>
            <input type="checkbox" class="trade_s_cd" value="F"/><span class="font18 marginTopFont10"> 직거래</span>
        </label>
        <label>
            <input type="checkbox" class="trade_s_cd" value="D"/><span class="font18 marginTopFont10"> 택배거래</span>
        </label>
        </div>
    </div>
        </li>
        <li class="liBox">
    <p class="font20 marginTopFont10 fontWeight">설명</p>
    <textarea class="font16" name="contents" id="contents" cols="30" rows="10" style="white-space: pre-line;" minlength="1"
              maxlength="2000"
              placeholder="브랜드, 모델명, 구매 시기, 하자 유무 등 상품 설명을 최대한 자세히 적어주세요.
전화번호, SNS 계정 등 개인정보 입력은 제한될 수 있어요.
안전하고 건전한 거래 환경을 위해 과학기술정보통신부, 한국인터넷증흥원과 치즈메이트(주)가 함께합니다."><c:out value='${Sale.contents}'/></textarea>
    <span class="font16 rightlocate" id="contentCounter">(0/2000)</span>
        </li>
        <li class="liBox">
            <p class="font20 marginTopFont10 fontWeight">해시태그<span class="fontgraycolor">(선택)</span></p>
    <input class="font16" type="text" id="hashtagInput" name="tag" value="<c:out value='${Tag}' />"
           placeholder="해시태그를 입력하세요."/>
    <div id="hashtagContainer"></div>
    <ul>
    <li class="li-list font16 marginTopFont10 fontgraycolor">
    <p>태그는 'enter' 또는 '#'으로 구분되며 최대 25자까지 입력할 수 있어요.</p>
    </li>
    <li class="li-list font16 marginTopFont10 fontgraycolor">
    <p>중복 문자는 제외되어 등록되요.</p>
    </li>
    <li class="li-list font16 marginTopFont10 fontgraycolor">
    <p>내 상품을 다양한 태그로 표현해 보세요.</p>
    </li>
    <li class="li-list font16 marginTopFont10 fontgraycolor">
    <p>사람들이 내 상품을 더 잘 찾을 수 있어요.</p>
    </li>
    <li class="li-list font16 marginTopFont10 fontgraycolor">
    <p>상품과 관련 없는 태그를 입력할 경우, 판매에 제재를 받을 수 있어요.</p>
    </li>
    </ul>
    </ul>
    </li>
    <p class="saleTitleText font30">가격</p>
    <li class="liBox">
        <div id="tx_s_cdContainer">
            <p class="font20 marginTopFont10 fontWeight">
                판매/나눔
            </p>
            <div class="div-line">
            <label>
                <input type="radio" class="tx_s_cd" name="tx_s_cd" value="S"/>
                <span class="font18 marginTopFont10">판매</span>
            </label>
            <label>
                <input type="radio" class="tx_s_cd" name="tx_s_cd" value="F"/>
                <span class="font18 marginTopFont10">나눔</span>
            </label>
            </div>
            <p class="font16 marginTopFont10" style="color: red;" id="txMsg">판매, 나눔 중 한 가지를 선택해 주세요.</p>
            </div>
    </li>
    <li class="liBox">
    <p class="font20 marginTopFont10 fontWeight">
        상품가격
    </p>
        <input class="font16" name="price" type="number" placeholder="판매할 가격을 입력해주세요." min="0"
               value="<c:out value='${Sale.price}' />"/>
    <p hidden><input type="radio" name="bid_cd" value="N" checked/> 미사용 </p>
    <p class="proposal font18 marginTopFont10" hidden><input class="proposal" type="radio" name="bid_cd" value="P"/>가격제안받기</p>
    <p class="trade  font18 marginTopFont10" hidden><input class="trade" type="radio" name="bid_cd" value="T"/>나눔신청받기</p>
        <div class="marginTopFont10">
        <input class="btnStyle maincolor" id="unCheckBtn" type="button" value="제안/신청 취소" onclick="unCheckBidCd()" hidden>
        </div>
    </li>
    <li class="liBox">
        <p class="font20 marginTopFont10 fontWeight">상품정가<span class="fontgraycolor">(선택)</span></p>
        <input class="font16" type="number" name="reg_price" placeholder="상품의 정가를 입력해주세요(선택)." min="0"
               value="<c:out value='${Sale.reg_price}' />"/>
    </li>

    <p class="saleTitleText font30">기타</p>
        <button class="maincolor" id="openModalBtn">거래희망 주소 검색</button>
    <li class="liBox">
        <div id="openModal" class="SaleModal SaleHidden">
            <div class="sale_modal_overlay"> <!--모달창의 배경색--></div>
            <div class="sale_modal_content">
                <button id="closeModalBtn">x</button>
                <p class="font30" id="sale_search_addr">주소 검색</p>
                <input class="font16" id="saleSearchInput" type="text" placeholder="동(읍/면/리)을 입력해주세요(enter).">
                <div class="sale-table-wrapper">
                    <table id="addrTable" class="table text-center">
                        <thead>
                        <tr>
                            <th style="width:150px;"><p class="font20 marginTopFont10 fontWeight">행정동코드</p></th>
                            <th style="width:600px;"><p class="font20 marginTopFont10 fontWeight">주소명</p></th>
                        </tr>
                        </thead>
                        <tbody id="addrList"></tbody>
                    </table>
                </div>
            </div>
        </div>
    </li>
    <li class="liBox">
        <p class="font20 marginTopFont10 fontWeight">거래장소
        </p>
            <input class="font16" id="pickup_addr_cd" name="pickup_addr_cd" type="text"
                   value="<c:out value='${Sale.pickup_addr_cd}' />"
                   hidden>
            <input id="pickup_addr_name" name="pickup_addr_name" type="text"
                   value="<c:out value='${Sale.pickup_addr_name}' />" disabled>
    </li>
    <li class="liBox">
        <p class="font20 marginTopFont10 fontWeight">
            거래희망장소<span class="fontgraycolor">(선택)</span>
        </p>
            <input class="font16" type="text" name="detail_addr" placeholder="거래를 희망하는 상세장소를 작성하세요."
                   value="<c:out value='${Sale.detail_addr}' />"/>
    </li>
    <li class="liBox">
    <p class="font20 marginTopFont10 fontWeight">
        브랜드<span class="fontgraycolor">(선택)</span>
    </p>
        <input class="font16" type="text" name="brand" placeholder="브랜드를 작성하세요(선택)." value="<c:out value='${Sale.brand}' />"/>
    </li>
    </form>
</div>
</div>
<div class="fixed-submit">
    <div class="div-submit">
        <input class="btnStyle maincolor font20" type="button" id="submitBtn" value="등록하기"/>
    </div>
</div>
<%@include file="../fixed/footer.jsp" %>


<script>

    const uploadImage = (function () {
        let imginfo = [];

        <c:forEach items="${imglist}" var="img">
        <c:if test="${img.imgtype eq 'r'}">
        imginfo.push(
            {
                "file_rt": "${img.file_rt}",
                "o_name": "${img.o_name}",
                "e_name": "${img.e_name}"
            }
        )
        </c:if>
        </c:forEach>

        return {
            getImgInfo: function () {
                return imginfo;
            }
        };
    })();

    let submitURL = '/sale/insert';

    let category2Check = false; // 중분류 카테고리 유효성 검사를 위한 변수
    let category3Check = false; // 소분류 카테고리 유효성 검사를 위한 변수
    let titlelength = 40; // 제목 글자 수
    let contentslength = 2000; // 내용 글자 수
    let t_contents = []; // tag값 을 담을 배열

    // 로딩 화면 표시
    function showLoading() {
        document.getElementById("loadingOverlay").style.display = "block";
    }

    // 로딩 화면 숨기기
    function hideLoading() {
        document.getElementById("loadingOverlay").style.display = "none";
    }

    // modify인 경우(판매글 수정)
    $(document).ready(async function () {
        showLoading();
        // 현재 URL에서 "modify" 문자열이 포함되어 있는지 확인
        if (window.location.href.indexOf("modify") != -1) {
            // 판매글 제목 글자수 세기
            let titleContent = $("#title").val();
            $('#titleCounter').text("(" + titleContent.length + "/" + titlelength + ")");

            // 판매글 내용 글자수 세기
            let textAreaContent = $("#contents").val();
            $('#contentCounter').text("(" + textAreaContent.length + "/" + contentslength + ")");

            // Sale의 pro_s_cd 값 : 상품상태
            let pro_s_cd = "${Sale.pro_s_cd}";
            $("input[name='pro_s_cd'][value='" + pro_s_cd + "']").prop("checked", true);

            // Sale의 trade_s_cd_1과 trade_s_cd_2 값 : 거래방법
            let trade_s_cd_1 = "${Sale.trade_s_cd_1}";
            let trade_s_cd_2 = "${Sale.trade_s_cd_2}";

            $("input[type='checkbox'][value='" + trade_s_cd_1 + "']").prop("checked", true);
            if (trade_s_cd_2) {
                $("input[type='checkbox'][value='" + trade_s_cd_2 + "']").prop("checked", true);
            }

            // Tag 처리
            let tagValue = "${Tag}";
            createHashtagInput();
            document.getElementById("hashtagInput").addEventListener("input", createHashtagInput);

            // Sale의 tx_s_cd값 : 판매/나눔
            let tx_s_cd = "${Sale.tx_s_cd}";
            if (tx_s_cd === "S") {
                $("#txMsg").text(""); // 메시지 제거
                $("input[name='tx_s_cd'][value='" + tx_s_cd + "']").prop("checked", true);
            } else {
                $("#txMsg").text(""); // 메시지 제거
                $("input[name='tx_s_cd'][value='" + tx_s_cd + "']").prop("checked", true);
                $("input[name='price']").val("");
                $("input[name='price']").attr("placeholder", "나눔글입니다.");
                $("input[name='price']").prop("disabled", true); // 상품 가격 입력란 비활성화
            }

            // Sale의 bid_cd 값 : 가격제시/나눔신청
            let bid_cd = "${Sale.bid_cd}";
            if (bid_cd === "P") {
                $("input[name='bid_cd'][value='" + bid_cd + "']").prop("checked", true);
            } else if (bid_cd === "T") {
                $(".trade").show();
                $("input[name='price']").val("");
                $("input[name='price']").attr("placeholder", "나눔글입니다.");
                $("input[name='price']").prop("disabled", true); // 상품 가격 입력란 비활성화
            }
            $("input[name='bid_cd'][value='" + bid_cd + "']").prop("checked", true);

            // Sale의 category 값
            let sal_i_cd = "${Sale.sal_i_cd}";

            if (sal_i_cd.length == 9) {
                let category1Value = sal_i_cd.substring(0, 3);
                let category2Value = sal_i_cd.substring(0, 6);
                let category3Value = sal_i_cd;
                await setCategory(category1Value, category2Value, category3Value);
            } else if (sal_i_cd.length == 6) {
                let category1Value = sal_i_cd.substring(0, 3);
                let category2Value = sal_i_cd;
                await setCategory(category1Value, category2Value);
            } else {
                let category1Value = sal_i_cd;
                await setCategory(category1Value);
            }

            // "modify" 문자열이 포함되어 있다면 버튼의 텍스트를 "수정하기"로 변경
            $("#submitBtn").val("수정하기");
            submitURL = '/sale/update';
        }

        hideLoading();
    });

    async function setCategory(category1Value, category2Value = null, category3Value = null) {
        $("#category1").val(category1Value).trigger("change");

        try {
            let data = await $.ajax({
                type: "POST",
                url: "/sale/saleCategory2",
                dataType: "json",
                data: {category1: category1Value}
            });

            let category2Select = document.getElementById("category2");
            category2Select.innerHTML = "<option value='' disabled selected>중분류</option>";
            let category3Select = document.getElementById("category3");
            category3Select.innerHTML = "<option value='' disabled selected>소분류</option>";
            console.log("1번 : " + category1Value);
            if (data.length > 0) {
                category2Check = false;
                category3Check = false;
                data.forEach(function (category) {
                    if (category.sal_cd.startsWith(category1Value)) {
                        let option = new Option(category.name, category.sal_cd);
                        category2Select.add(option);
                    }
                });
            } else {
                category2Check = true;
                category3Check = true;
                $("#salecategoryMsg").text("");
            }

            if (category2Value) {
                $("#category2").val(category2Value).trigger("change");
                console.log("2번 리스트 : " + data);
                console.log("2번 선택값 : " + $("#category2 option:checked").text());
                if (category3Value) {
                    let data = await $.ajax({
                        type: "POST",
                        url: "/sale/saleCategory3",
                        dataType: "json",
                        data: {category2: category2Value}
                    });

                    if (data.length > 0) {
                        category3Check = false;
                        data.forEach(function (category) {
                            if (category.sal_cd.startsWith(category2Value)) {
                                let option = new Option(category.name, category.sal_cd);
                                category3Select.add(option);
                            }
                        });
                    } else {
                        category3Check = true;
                        $("#salecategoryMsg").text("");
                    }
                    $("#category3").val(category3Value).trigger("change");
                    console.log("3번 리스트 : " + data);
                    console.log("3번 선택값 : " + $("#category3 option:checked").text());
                }
            }
        } catch (error) {
            console.error("Category Error:", error);
        }
    }

    // write인 경우(판매글 작성)
    window.onload = function () {
        $("#category1").on("change", function () {
            let category1Value = $('#category1').val();
            console.log(category1Value);
            if (category1Value !== "") {
                $.ajax({
                    type: "POST",
                    url: "/sale/saleCategory2",
                    dataType: "json", // 받을 값
                    data: {category1: category1Value},
                    success: function (data) {
                        let category2Select = document.getElementById("category2");
                        category2Select.innerHTML = "<option value='' disabled selected>중분류</option>";
                        let category3Select = document.getElementById("category3");
                        category3Select.innerHTML = "<option value='' disabled selected>소분류</option>";
                        if (data.length > 0) {
                            category2Check = false;
                            data.forEach(function (category) {
                                if (category.sal_cd.startsWith(category1Value)) {
                                    let option = new Option(category.name, category.sal_cd);
                                    category2Select.add(option);
                                }
                            });
                        } else {
                            $("#salecategoryMsg").text("");
                            console.log("기타임");
                            category2Check = true;
                            category3Check = true;
                        }
                    },
                    error: function (xhr, status, error) {
                        alert(xhr.responseText);
                    }
                });
            }
        });

        $("#category2").on("change", function () {
            let category2Value = $('#category2').val();
            if (category2Value !== "") {
                $.ajax({
                    type: "POST",
                    url: "/sale/saleCategory3",
                    dataType: "json",
                    data: {category2: category2Value},
                    success: function (data) {
                        let category3Select = document.getElementById("category3");
                        category3Select.innerHTML = "<option value='' disabled selected>소분류</option>";
                        if (data.length > 0) {
                            category3Check = false;
                            data.forEach(function (category) {
                                if (category.sal_cd.startsWith(category2Value)) {
                                    let option = new Option(category.name, category.sal_cd);
                                    category3Select.add(option);
                                }
                            });
                        } else {
                            $("#salecategoryMsg").text("");
                            category3Check = true;
                        }
                    },
                    error: function (xhr, status, error) {
                        alert(xhr.responseText);
                    }
                });
            }
        });


        // 판매글 제목 처리
        handleInputLimit('#title', '#titleCounter', titlelength, '글자수는 ' + titlelength + '자까지 입력 가능합니다.');
        // 판매글 내용 처리
        handleInputLimit('#contents', '#contentCounter', contentslength, '글자수는 ' + contentslength + '자까지 입력 가능합니다.');

        // 거래방법 선택 최대 2개까지 한도 주기
        $(".trade_s_cd").change(function () {
            let checkedCount = $(".trade_s_cd:checked").length;
            if (checkedCount > 2) {
                $(this).prop("checked", false);
                alert("최대 2개의 거래방법까지 선택할 수 있습니다.");
            }
        });

        // 판매/나눔 선택
        $("input[name='tx_s_cd']").change(function () {
            if ($(this).val() === "S") {
                $(".proposal").show(); // 판매 선택 시 가격제안받기 옵션 보이기
                $(".trade").hide(); // 판매 선택 시 나눔신청받기 옵션 숨기기
                $("input[name='price']").prop("disabled", false); // 상품 가격 입력란 활성화
                $("input[name='price']").attr("placeholder", "판매할 가격을 입력해주세요.");
                $("#txMsg").text(""); // 메시지 제거
            } else if ($(this).val() === "F") {
                $(".proposal").hide(); // 나눔 선택 시 가격제안받기 옵션 숨기기
                $(".trade").show(); // 나눔 선택 시 나눔신청받기 옵션 보이기
                $("input[name='price']").val();
                $("input[name='price']").prop("disabled", true); // 상품 가격 입력란 비활성화
                $("input[name='price']").attr("placeholder", "나눔글입니다.");
                $("#txMsg").text(""); // 메시지 제거
            }
            $("#unCheckBtn").show();
        });

        // ${Tag} 값이 존재하는지 확인
        let tagValue = "${Tag}";
        createHashtagInput(); // 페이지 로드 시에도 input 생성

        // input 요소에 이벤트 리스너 추가
        document
            .getElementById("hashtagInput")
            .addEventListener("input", createHashtagInput);

        // 페이지 로드 시 현재 선택된 대분류 카테고리의 이름을 가져와서 sal_name에 표시
        let category1Name = $("#category1 option:checked").text();
        if (category1Name !== "대분류") {
            $("#sal_name").text($("#category1 option:checked").text());
        }

        $("#saleSearchInput").on("keydown", function (event) {
            // 엔터 키(키 코드 13)가 눌렸는지 확인
            if (event.which === 13 || event.keycode === 13) {
                event.preventDefault(); // 기본 엔터 동작(폼 제출 등)을 막기 위해 추가

                let searchLetter = $(this).val();
                $.ajax({
                    type: "POST",
                    url: "/sale/searchLetter",
                    data: {searchLetter: searchLetter},
                    dataType: "json",
                    success: function (data) {
                        // 검색 결과를 처리하여 addrTable에 추가
                        $("#addrList").empty(); // 기존 내용 초기화
                        if (data.length > 0) {
                            data.forEach(function (addr) {
                                let row = $("<tr class='sale-addr-tr'>");
                                row.append($("<td>").html("<p class='font20 marginTopFont10'>" + addr.addr_cd + "</p>")); // 행정구역 코드
                                row.append($("<td>").html("<p class='font20 marginTopFont10'>" + addr.addr_name + "</p>")); // 주소명
                                $("#addrList").append(row);
                            });
                        } else {
                            $("#addrTable").append("<tr><td colspan='2'>검색 결과가 없습니다.</td></tr>");
                        }
                    },
                    error: function (xhr, status, error) {
                        $("#addrTable").append("<tr><td colspan='2'>검색 결과가 없습니다.</td></tr>");
                        alert("주소 검색에 실패하였습니다.");
                    }
                });
            }
        });

        // 주소를 클릭했을 때의 이벤트 핸들러
        $("#addrList").on("click", "tr", function () {
            // 클릭한 행에서 주소 코드와 주소명을 가져옴
            let addrCode = $(this).find("td:eq(0)").text(); // 첫 번째 td 열의 텍스트 (주소 코드)
            let addrName = $(this).find("td:eq(1)").text(); // 두 번째 td 열의 텍스트 (주소명)

            // pickup_addr input에 선택한 주소 정보를 추가
            $("#pickup_addr_cd").val(addrCode);
            $("#pickup_addr_name").val(addrName);

            // 모달 닫기
            closeModal();
        });

        // 신청을 취소할 때 N 옵션을 선택하도록 설정
        unCheckBidCd = function () {
            $("input[name='bid_cd'][value='N']").prop("checked", true);
        }
    }; // document.ready 종료 부분

    // 대분류 선택 시 선택된 카테고리의 이름을 sal_name에 업데이트
    $("#category1").change(function () {
        $("#salecategoryMsg").text("중분류 > 소분류를 선택하세요.");
        $("#sal_name").text($("#category1 option:checked").text());
        category2Check = false;
        category3Check = false;
    });

    // 중분류 선택 시 대분류 카테고리와 함께 중분류 카테고리의 이름을 sal_name에 업데이트
    $("#category2").change(function () {
        $("#salecategoryMsg").text("소분류를 선택하세요.");
        let category1Name = $("#category1 option:checked").text();
        let category2Name = $("#category2 option:checked").text();
        if (category2Name !== "중분류") {
            $("#sal_name").text(category1Name + " > " + category2Name);
        }
        category2Check = true;
        category3Check = false;
    });

    // 소분류 선택 시 대분류, 중분류 카테고리와 함께 소분류 카테고리의 이름을 sal_name에 업데이트
    $("#category3").change(function () {
        $("#salecategoryMsg").text("");
        let category1Name = $("#category1 option:checked").text();
        let category2Name = $("#category2 option:checked").text();
        let category3Name = $("#category3 option:checked").text();
        if (category3Name !== "소분류") {
            $("#sal_name").text(category1Name + " > " + category2Name + " > " + category3Name);
        }
        category3Check = true;
    });

    // 입력 필드와 관련된 카운터 업데이트 및 제한 처리 함수
    function handleInputLimit(selector, counterSelector, maxLength, alertMessage) {
        $(selector).keyup(function (e) {
            let content = $(selector).val();
            // 글자수 세기
            $(counterSelector).text("(" + content.length + "/" + maxLength + ")");
            // 글자수 제한
            if (content.length > maxLength) {
                // maxLength부터는 타이핑 되지 않도록
                $(this).val(content.substring(0, maxLength));
                // maxLength 넘으면 알림창 뜨도록
                alert(alertMessage);
            }

            // Enter 키 입력 시 기본 동작 취소
            if (e.keyCode === 13) {
                e.preventDefault();
                e.stopPropagation();
            }
        });
    }

    // textarea에서 Enter 키 입력 허용
    $(document).on("keydown", "#contents", function (event) {
        // 현재 포커스된 요소가 textarea인지 확인
        if ($(this).is("textarea")) {
            if (event.keyCode === 13) {
                return; // Enter 키 입력
            }
        }
        // event.preventDefault(); // 그 외의 경우에는 Enter 키의 기본 동작 막기
        if ($(".SaleModal").hasClass("SaleHidden")) {
            // 모달 창이 숨겨져 있을 때만 Enter 키 입력 방지
            if (event.keyCode === 13) {
                event.preventDefault(); // Enter 키의 기본 동작 막기(input 창에서 Enter치면 모달창이 열리기 때문)
            }
        }
    });

    // input에서 Enter 키 입력 허용
    $(document).on("keydown", "input", function (event) {
        // 현재 포커스된 요소가 input인지 확인
        if ($(this).is("input")) {
            if (event.keyCode === 13) {
                event.preventDefault(); // Enter 키의 기본 동작 막기
            }
        }
    });

    // 해시태그 input 생성하는 함수
    function createHashtagInput() {
        let hashtagInput = document.getElementById("hashtagInput").value;
        let hashtags = hashtagInput.split("#").filter(tag => {
            let trimmedTag = tag.trim();
            return trimmedTag.length > 0 && trimmedTag.length <= 25;
        });

        // 기존의 해시태그를 모두 삭제
        let container = document.getElementById("hashtagContainer");
        container.innerHTML = "";

        // 배열 초기화
        let t_contents = [];

        // 각 해시태그를 별도의 input 요소에 추가하여 표시
        hashtags.forEach(function (tag) {
            let trimmedTag = tag.trim();
            if (trimmedTag.length > 0 && trimmedTag.length <= 25) {
                let input = document.createElement("input");
                input.type = "text";
                input.className = "font16";
                input.name = "t_contents";
                input.value = "#" + trimmedTag; // 해시태그 앞에 #을 붙여서 표시
                input.disabled = true; // 입력 불가능하도록 설정
                container.appendChild(input);

                // 해시태그 사이 간격 조절
                // 해시태그의 글자 수에 따라 너비 동적 조절
                input.style.width = (trimmedTag.length + 3) * 1.5 + "vw";

                // 해시태그를 배열에 추가
                t_contents.push("#" + trimmedTag);

                container.appendChild(input);
                container.appendChild(document.createTextNode(" ")); // 각 해시태그 뒤에 공백 추가
            }
        });

        console.log(t_contents); // 디버그를 위해 콘솔에 출력
    }

    // 해시태그 입력 필드에서 Enter 키를 눌렀을 때 해시태그 입력 생성 함수 호출
    document.addEventListener('DOMContentLoaded', function () {
        let hashtagInput = document.getElementById("hashtagInput");
        hashtagInput.addEventListener("keyup", function (event) {
            if (event.key === "Enter") {
                createHashtagInput();
                // 입력 필드에 # 추가
                hashtagInput.value += "#";
                event.preventDefault(); // Enter 키 기본 동작 방지
            }
        });
    });

    const openModalBtn = document.getElementById("openModalBtn");
    const modal = document.querySelector(".SaleModal");
    const overlay = modal.querySelector(".sale_modal_overlay");
    const closeModalBtn = document.getElementById("closeModalBtn");
    const openModal = (event) => {
        event.preventDefault(); // form의 기본 동작을 막음
        modal.classList.remove("SaleHidden");
    }
    const closeModal = () => {
        event.preventDefault(); // form의 기본 동작을 막음
        modal.classList.add("SaleHidden");
    }
    document.addEventListener("keydown", (event) => {
        if (event.key === "Escape" || event.keyCode === 27) {
            closeModal();
        }
    });
    overlay.addEventListener("click", closeModal);
    closeModalBtn.addEventListener("click", closeModal);
    openModalBtn.addEventListener("click", openModal);


    // 등록하기 버튼 누르는 경우
    $("#submitBtn").on("click", function () {
        let no = "${Sale.no}";
        let seller_id = "${Sale.seller_id}";
        let seller_nick = "${Sale.seller_nick}";
        let title = $('input[name="title"]').val(); // 제목
        let pro_s_cd = $('input[name="pro_s_cd"]:checked').val(); // 상품상태
        let contents = $('textarea[name="contents"]').val(); // 설명
        let tx_s_cd = $('input[name="tx_s_cd"]:checked').val(); // 판매/나눔
        let price = 0;
        if (tx_s_cd !== "F") {
            price = $('input[name="price"]').val(); // 가격
        }
        let bid_cd = $('input[name="bid_cd"]:checked').val(); // 가격제시/나눔신청
        let reg_price = $('input[name="reg_price"]').val(); // 상품정가
        let pickup_addr_cd = $('input[name="pickup_addr_cd"]').val(); // 거래장소코드
        let pickup_addr_name = $('input[name="pickup_addr_name"]').val(); // 거래장소
        let detail_addr = $('input[name="detail_addr"]').val(); // 거래희망장소
        let brand = $('input[name="brand"]').val(); // 브랜드
        let addr_cd = "${Sale.addr_cd}"; // 행정구역코드
        let addr_name = "${Sale.addr_name}"; // 주소명
        let group_no = "${Sale.group_no}"; // 이미지

        // category1, category2, category3의 값 추출
        let category1Value = $("#category1").val();
        let category2Value = $("#category2 option:checked").val();
        let category3Value = $("#category3 option:checked").val();
        let category1Text = $("#category1 option:checked").text();
        let category2Text = $("#category2 option:checked").text();
        let category3Text = $("#category3 option:checked").text();

        // 조건에 따라 sal_i_cd 값을 설정
        let sal_i_cd_value;
        let sal_name_value;
        if (category1Value && !category2Value && !category3Value) {
            sal_i_cd_value = category1Value;
            sal_name_value = category1Text;
        } else if (category1Value && category2Value && !category3Value) {
            sal_i_cd_value = category2Value;
            sal_name_value = category2Text;
        } else if (category1Value && category2Value && category3Value) {
            sal_i_cd_value = category3Value;
            sal_name_value = category3Text;
        }

        // trade_s_cd 값 추출
        let trade_s_cd_values = [];
        $(".trade_s_cd:checked").each(function (index, checkbox) {
            trade_s_cd_values.push($(checkbox).val());
        });

        if (!validationForm(title, category1Value, category2Check, category3Check, contents, pro_s_cd, trade_s_cd_values[0], tx_s_cd, price, reg_price)) { // 유효성 검사 통과 못하면 함수 종료
            return false;
        }
        ;

        let sale = {
            "no": no,
            "title": title,
            "pro_s_cd": pro_s_cd,
            "contents": contents,
            "tx_s_cd": tx_s_cd,
            "price": price,
            "bid_cd": bid_cd,
            "reg_price": reg_price,
            "pickup_addr_cd": pickup_addr_cd,
            "pickup_addr_name": pickup_addr_name,
            "detail_addr": detail_addr,
            "brand": brand,
            "sal_i_cd": sal_i_cd_value,
            "sal_name": sal_name_value,
            "addr_cd": addr_cd,
            "addr_name": addr_name,
            "group_no": group_no
        }

        // trade_s_cd 파라미터 설정
        if (trade_s_cd_values.length === 1) {
            sale["trade_s_cd_1"] = trade_s_cd_values[0];
        } else if (trade_s_cd_values.length === 2) {
            sale["trade_s_cd_1"] = trade_s_cd_values[0];
            sale["trade_s_cd_2"] = trade_s_cd_values[1];
        }

        let tagSet = new Set(t_contents);
        let tagList = Array.from(tagSet);

        let tag = {
            "contents": tagList
        }

        let map =
            {
                "sale": sale,
                "tag": tag,
                "imgList": ImageUploader.getImgInfo()
            };


        // jsonData를 JSON 문자열로 변환
        let jsonString = JSON.stringify(map);

        $.ajax({
            type: 'POST',
            url: submitURL,
            // contentType: 'multipart/form-data; charset=utf-8',
            contentType: 'application/json; charset=utf-8',
            data: jsonString,
            dataType: 'text',
            success: function (data) {
                // // 글이 성공적으로 등록되었을 때
                // // data에는 등록된 글의 번호가 반환됨
                // // 반환된 글 번호를 이용하여 리다이렉션할 URL 생성
                // // 새로운 URL로 이동
                window.location.replace(data);
            },
            error: function (xhr, status, error) {
                alert(xhr.responseText);
            }
        });
    })

    function validationForm(title, category1Value, category2Check, category3Check,
                            contents, pro_s_cd, trade_s_cd, tx_s_cd, price, reg_price) {
        if (!title) {
            document.getElementsByName("title")[0].focus();
            document.getElementsByName("title")[0].style.borderColor = 'red';
            alert("제목을 입력하세요.");
            return false;
        } else {
            document.getElementsByName("title")[0].style.borderColor = '';
        }

        if(title.length < 2) {
            document.getElementsByName("title")[0].focus();
            document.getElementsByName("title")[0].style.borderColor = 'red';
            alert("최소 두 글자 이상 작성하세요.");
            return false;
        } else {
            document.getElementsByName("title")[0].style.borderColor = '';
        }

        if (!category1Value) {
            $("#categoryContainer").attr('tabindex', 0).focus();
            $("#categoryContainer").css("backgroundColor", 'rgba(255, 0, 0, 0.1)');
            alert("대분류 상태를 선택하세요.");
            return false;
        }else {
            $("#categoryContainer").css("backgroundColor", '');
        }
        if (!category2Check) {
            $("#categoryContainer").attr('tabindex', 0).focus();
            $("#categoryContainer").css("backgroundColor", 'rgba(255, 0, 0, 0.1)');
            alert("중분류 상태를 선택하세요.");
            return false;
        } else {
            $("#categoryContainer").css("backgroundColor", '');
        }

        if (!category3Check) {
            $("#categoryContainer").attr('tabindex', 0).focus();
            $("#categoryContainer").css("backgroundColor", 'rgba(255, 0, 0, 0.1)');
            alert("소분류 상태를 선택하세요.");
            return false;
        } else {
            $("#categoryContainer").css("backgroundColor", '');
        }


        if (!contents || contents.trim().length === 0) {
            document.getElementsByName("contents")[0].focus();
            document.getElementsByName("contents")[0].style.borderColor = 'red';
            alert("내용을 입력하세요.");
            return false;
        } else {
            document.getElementsByName("contents")[0].style.borderColor = '';
        }

        if(contents.length < 4) {
            document.getElementsByName("contents")[0].focus();
            document.getElementsByName("contents")[0].style.borderColor = 'red';
            alert("최소 네 글자 이상 작성하세요.");
            return false;
        } else {
            document.getElementsByName("contents")[0].style.borderColor = '';
        }

        if (!pro_s_cd) {
            $("#pro_s_cdContainer").attr('tabindex', 0).focus();
            $("#pro_s_cdContainer").css("backgroundColor", 'rgba(255, 0, 0, 0.1)');
            alert("상품 상태를 선택하세요.");
            return false;
        } else {
            $("#pro_s_cdContainer").css("backgroundColor", '');
        }

        if (!trade_s_cd) {
            $("#trade_s_cdContainer").attr('tabindex', 0).focus();
            $("#trade_s_cdContainer").css("backgroundColor", 'rgba(255, 0, 0, 0.1)');
            alert("거래방법을 선택하세요.");
            return false;
        } else {
            $("#trade_s_cdContainer").css("backgroundColor", '');
        }

        if (!tx_s_cd) {
            $("#tx_s_cdContainer").attr('tabindex', 0).focus();
            $("#tx_s_cdContainer").css("backgroundColor", 'rgba(255, 0, 0, 0.1)');
            alert("판매/나눔 중 한 가지를 선택하세요.");
            return false;
        } else {
            $("#tx_s_cdContainer").css("backgroundColor", '');
        }

        if (tx_s_cd === 'S' && !price) {
            document.getElementsByName("price")[0].focus();
            document.getElementsByName("price")[0].style.borderColor = 'red';
            alert("가격을 입력하세요.");
            return false;
        } else if (tx_s_cd === 'S' && price < 0) {
            document.getElementsByName("price")[0].focus();
            document.getElementsByName("price")[0].style.borderColor = 'red';
            alert("음수를 제외한 정확한 가격을 입력하세요.");
            return false;
        } else if (tx_s_cd === 'S' && price == 0) {
            document.getElementsByName("price")[0].focus();
            document.getElementsByName("price")[0].style.borderColor = 'red';
            alert("1원 이상의 가격을 입력하세요.");
            return false;
        } else {
            document.getElementsByName("price")[0].style.borderColor = '';
        }

        if(price > 2100000000) {
            document.getElementsByName("price")[0].focus();
            document.getElementsByName("price")[0].style.borderColor = 'red';
            alert("21억 까지 입력할 수 있습니다.");
            return false;
        } else {
            document.getElementsByName("price")[0].style.borderColor = '';
        }

        if (!!reg_price) {
            if (reg_price < 0) {
                document.getElementsByName("reg_price")[0].focus();
                document.getElementsByName("reg_price")[0].style.borderColor = 'red';
                alert("음수를 제외한 정확한 가격을 입력하세요.");
                return false;
            } else if(reg_price > 2100000000) {
                document.getElementsByName("reg_price")[0].focus();
                document.getElementsByName("reg_price")[0].style.borderColor = 'red';
                alert("21억 까지 입력할 수 있습니다.");
                return false;
            } else {
                document.getElementsByName("reg_price")[0].style.borderColor = '';
            }
        }

        return true;
    }

</script>

<script src="/js/img.js"></script>

