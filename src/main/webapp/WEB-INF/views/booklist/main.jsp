<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <link rel="stylesheet" type="text/css" href="/resource/midhigh/css/common.css" />
  <link rel="stylesheet" type="text/css" href="/resource/midhigh/css/pages.css" />
  <title>booklist</title>
</head>
<body>
<!--header-->

<div class="header_bg_2022_v2 sticky" x-data="mhHeaderObj">
  <header class="header">
    <div class="util-line clearfix">
          <span class="util-link">
            <a href="https://kid.tsherpa.co.kr/">유치</a>
            <a href="https://ele.tsherpa.co.kr/">초등</a>
            <a href="https://mh.tsherpa.co.kr/" class="dark">중학·고등</a>
            <a href="https://mall.tsherpa.co.kr/" target="_blank">T셀파몰</a>
            <a href="https://edu.tsherpa.co.kr/" target="_blank">연수원</a>
            <a
                    href="https://cjtext.tsherpa.co.kr/2022/intro/intro.html"
                    target="_blank"
            >천재교과서</a
            >
          </span>
      <span class="util-member">
            <a href="javascript:logout();"
            ><span class="underline">로그아웃</span></a
            >
            <a href="https://www.tsherpa.co.kr/myT/membership/membership.html"
            >MY T셀파</a
            >
            <a href="https://www.tsherpa.co.kr/center/M-noticM.html"
            >고객센터</a
            >
            <a href="https://www.tsherpa.co.kr/event/index.html">이벤트</a>
            <a href="https://www.tsherpa.co.kr/center/M-sitemap.html"
            >사이트맵</a
            >
          </span>
    </div>

    <script>
      function doLogin() {
        let loginUrl = "/login.html";
        if (location.pathname.indexOf("/login.html") < 0) {
          loginUrl += "?returnUrl=" + encodeURIComponent(location.href);
        }
        location.href = loginUrl;
      }

      function logout() {
        Storages.cookieStorage.remove("gnb_seleted_grade");
        $.post("/ssoLogout.do").done(function (data) {
          if (data.success) {
            let returnUrl = location.protocol + "//" + location.host;
            document.location.href =
              "https://sso.chunjae.co.kr:446/api/auth/logout?returnUrl=" +
              returnUrl;
          } else {
            alert(data.message);
          }
        });
      }
    </script>
    <div class="header_top">
      <h1><a href="https://mh.tsherpa.co.kr/">T셀파</a></h1>
      <form
              id="keywordForm"
              name="keywordForm"
              method="get"
              action="https://mh.tsherpa.co.kr/testbank/testbank.html"
              autocomplete="off"
              target="_blank"
              onsubmit="return false;"
      >
        <div class="search_area">
          <input
                  type="text"
                  id="keyword"
                  name="keyword"
                  placeholder="검색어를 입력해주세요."
                  onkeyup="press();"
          />
          <a href="javascript:" class="btn btn_search" id="searchButton"
          >검색</a
          >
        </div>
      </form>
      <div class="header_top-banner">
        <a href="https://edu.tsherpa.co.kr/Untact/MeetList" target="_blank">
          <img
                  src="/resource/midhigh/img/banner/area_header/img-banner_20230515.png"
                  alt="선생님들의 비대면 지식공유 모임 T 배움터"
          />
        </a>
      </div>
    </div>

    <div class="header_nav">
      <div class="btn btn_allMenu">
        <button type="button">
          <span>전체메뉴</span>
        </button>
      </div>
      <!-- 1뎁스 -->
      <nav>
        <ul class="gnb">
          <li>
            <a
                    class="
"
                    href="https://mh.tsherpa.co.kr/testbank/testbank.html#"
                    data-target="sub01"
            >교과서자료</a
            >
          </li>
          <li>
            <a
                    class="active"
                    href="https://mh.tsherpa.co.kr/testbank/testbank.html"
            >문제은행</a
            >
          </li>
          <li>
            <a
                    class="
"
                    href="https://mh.tsherpa.co.kr/edutech/index.html"
            >에듀테크</a
            >
          </li>
          <li>
            <a
                    class="
"
                    href="https://mh.tsherpa.co.kr/class-research/tspoon/index.html"
            >수업연구소</a
            >
          </li>
          <li style="position: relative">
            <a href="https://sschannel.tsherpa.co.kr/" target="_blank">
              <img
                      src="/resource/midhigh/img/common/logo-ssam.png"
                      alt="쌤채널"
                      style="margin-top: -5px"
              />
            </a>
          </li>
        </ul>
      </nav>
    </div>
  </header>

  <!-- 2뎁스 -->
  <!-- D://  on 메뉴보이게 -->
  <div class="gnb_submenu">
    <a
            class="gnb_submenu__close"
            href="https://mh.tsherpa.co.kr/testbank/testbank.html#"
    ><span class="ir_su">메뉴닫기</span></a
    >
    <!-- 2뎁스 : 교과서자료 -->
    <div class="subs sub01">
      <div class="inner">
        <div class="box01">
          <ul class="box01__list">
            <li>
              <a
                      class="on"
                      href="https://mh.tsherpa.co.kr/testbank/testbank.html#"
                      x-on:click="mhCateIndex = 0; getTextBookList();"
              >중학 <span class="img-arrow-right-blue"></span
              ></a>
            </li>
            <li>
              <a
                      href="https://mh.tsherpa.co.kr/testbank/testbank.html#"
                      x-on:click="mhCateIndex = 1; getTextBookList();"
              >고등 <span class="img-arrow-right-blue"></span
              ></a>
            </li>
          </ul>
        </div>
        <div class="box02">
          <!-- 중등 과목 -->
          <ul class="box02__list on">
            <li>
              <a
                      class="on"
                      href="https://mh.tsherpa.co.kr/testbank/testbank.html#"
                      x-on:click="getTextBookList(1)"
              >국어 <span class="img-arrow-right-blue"></span
              ></a>
            </li>
            <li>
              <a
                      href="https://mh.tsherpa.co.kr/testbank/testbank.html#"
                      x-on:click="getTextBookList(2)"
              >영어 <span class="img-arrow-right-blue"></span
              ></a>
            </li>
            <li>
              <a
                      href="https://mh.tsherpa.co.kr/testbank/testbank.html#"
                      x-on:click="getTextBookList(3)"
              >수학 <span class="img-arrow-right-blue"></span
              ></a>
            </li>
            <li>
              <a
                      href="https://mh.tsherpa.co.kr/testbank/testbank.html#"
                      x-on:click="getTextBookList(4)"
              >사회/역사/도덕 <span class="img-arrow-right-blue"></span
              ></a>
            </li>
            <li>
              <a
                      href="https://mh.tsherpa.co.kr/testbank/testbank.html#"
                      x-on:click="getTextBookList(5)"
              >과학/기술·가정/정보
                <span class="img-arrow-right-blue"></span
                ></a>
            </li>
            <li>
              <a
                      href="https://mh.tsherpa.co.kr/testbank/testbank.html#"
                      x-on:click="getTextBookList(6)"
              >음악/미술/체육 <span class="img-arrow-right-blue"></span
              ></a>
            </li>
            <li>
              <a
                      href="https://mh.tsherpa.co.kr/testbank/testbank.html#"
                      x-on:click="getTextBookList(7)"
              >선택/외국어 <span class="img-arrow-right-blue"></span
              ></a>
            </li>
          </ul>
          <!-- 고등 과목 -->
          <ul class="box02__list">
            <li>
              <a
                      class="on"
                      href="https://mh.tsherpa.co.kr/testbank/testbank.html#"
                      x-on:click="getTextBookList(1)"
              >국어 <span class="img-arrow-right-blue"></span
              ></a>
            </li>
            <li>
              <a
                      href="https://mh.tsherpa.co.kr/testbank/testbank.html#"
                      x-on:click="getTextBookList(2)"
              >영어 <span class="img-arrow-right-blue"></span
              ></a>
            </li>
            <li>
              <a
                      href="https://mh.tsherpa.co.kr/testbank/testbank.html#"
                      x-on:click="getTextBookList(3)"
              >수학 <span class="img-arrow-right-blue"></span
              ></a>
            </li>
            <li>
              <a
                      href="https://mh.tsherpa.co.kr/testbank/testbank.html#"
                      x-on:click="getTextBookList(4)"
              >사회 <span class="img-arrow-right-blue"></span
              ></a>
            </li>
            <li>
              <a
                      href="https://mh.tsherpa.co.kr/testbank/testbank.html#"
                      x-on:click="getTextBookList(5)"
              >역사 <span class="img-arrow-right-blue"></span
              ></a>
            </li>
            <li>
              <a
                      href="https://mh.tsherpa.co.kr/testbank/testbank.html#"
                      x-on:click="getTextBookList(6)"
              >도덕 <span class="img-arrow-right-blue"></span
              ></a>
            </li>
            <li>
              <a
                      href="https://mh.tsherpa.co.kr/testbank/testbank.html#"
                      x-on:click="getTextBookList(7)"
              >과학 <span class="img-arrow-right-blue"></span
              ></a>
            </li>
            <li>
              <a
                      href="https://mh.tsherpa.co.kr/testbank/testbank.html#"
                      x-on:click="getTextBookList(8)"
              >기술·가정/정보 <span class="img-arrow-right-blue"></span
              ></a>
            </li>
            <li>
              <a
                      href="https://mh.tsherpa.co.kr/testbank/testbank.html#"
                      x-on:click="getTextBookList(9)"
              >음악/미술/체육 <span class="img-arrow-right-blue"></span
              ></a>
            </li>
            <li>
              <a
                      href="https://mh.tsherpa.co.kr/testbank/testbank.html#"
                      x-on:click="getTextBookList(10)"
              >제2외국어/한문 <span class="img-arrow-right-blue"></span
              ></a>
            </li>
            <li>
              <a
                      href="https://mh.tsherpa.co.kr/testbank/testbank.html#"
                      x-on:click="getTextBookList(11)"
              >교양/전문 <span class="img-arrow-right-blue"></span
              ></a>
            </li>
          </ul>
        </div>
        <div class="box03">
          <div
                  class="box03__column"
                  x-show="showTextBookList['2009']"
                  style="display: none"
          >
            <a
                    class="box03__column__btn on"
                    href="https://mh.tsherpa.co.kr/testbank/testbank.html#"
            >2009 개정</a
            >
            <ul class="box03__list on" style="height: auto">
              <template
                      x-for="item in showTextBookList['2009']"
              ></template>
            </ul>
          </div>
          <div
                  class="box03__column"
                  x-show="showTextBookList['2015']"
                  style=""
          >
            <a
                    class="box03__column__btn on"
                    href="https://mh.tsherpa.co.kr/testbank/testbank.html#"
            >2015 개정</a
            >
            <ul class="box03__list on" style="height: auto">
              <template
                      x-for="item in showTextBookList['2015']"
              ></template>
              <li>
                <a
                        href="javascript:"
                        x-text="item.name"
                        x-on:click="goBookPage(item.id)"
                >국어 1-1 (노미숙)</a
                >
              </li>
              <li>
                <a
                        href="javascript:"
                        x-text="item.name"
                        x-on:click="goBookPage(item.id)"
                >국어 1-2 (노미숙)</a
                >
              </li>
              <li>
                <a
                        href="javascript:"
                        x-text="item.name"
                        x-on:click="goBookPage(item.id)"
                >국어 2-1 (노미숙)</a
                >
              </li>
              <li>
                <a
                        href="javascript:"
                        x-text="item.name"
                        x-on:click="goBookPage(item.id)"
                >국어 2-2 (노미숙)</a
                >
              </li>
              <li>
                <a
                        href="javascript:"
                        x-text="item.name"
                        x-on:click="goBookPage(item.id)"
                >국어 3-1 (노미숙)</a
                >
              </li>
              <li>
                <a
                        href="javascript:"
                        x-text="item.name"
                        x-on:click="goBookPage(item.id)"
                >국어 3-2 (노미숙)</a
                >
              </li>
              <li>
                <a
                        href="javascript:"
                        x-text="item.name"
                        x-on:click="goBookPage(item.id)"
                >국어 1-1 (박영목)</a
                >
              </li>
              <li>
                <a
                        href="javascript:"
                        x-text="item.name"
                        x-on:click="goBookPage(item.id)"
                >국어 1-2 (박영목)</a
                >
              </li>
              <li>
                <a
                        href="javascript:"
                        x-text="item.name"
                        x-on:click="goBookPage(item.id)"
                >국어 2-1 (박영목)</a
                >
              </li>
              <li>
                <a
                        href="javascript:"
                        x-text="item.name"
                        x-on:click="goBookPage(item.id)"
                >국어 2-2 (박영목)</a
                >
              </li>
              <li>
                <a
                        href="javascript:"
                        x-text="item.name"
                        x-on:click="goBookPage(item.id)"
                >국어 3-1 (박영목)</a
                >
              </li>
              <li>
                <a
                        href="javascript:"
                        x-text="item.name"
                        x-on:click="goBookPage(item.id)"
                >국어 3-2 (박영목)</a
                >
              </li>
            </ul>
          </div>
          <div
                  class="box03__column"
                  x-show="showTextBookList['2020']"
                  style="display: none"
          >
            <a
                    class="box03__column__btn on"
                    href="https://mh.tsherpa.co.kr/testbank/testbank.html#"
            >2020 개정</a
            >
            <ul class="box03__list on" style="height: auto">
              <template
                      x-for="item in showTextBookList['2020']"
              ></template>
            </ul>
          </div>
        </div>
      </div>
    </div>
    <span class="gnb_submenu__bg">
          <span></span>
        </span>
  </div>

  <script>
    $(function () {
      /* 1뎁스 클릭 관련 */
      $(".gnb li a").on("click", function (e) {
        e.stopPropagation();
        let depths_one = $(this).attr("data-target");
        bgDimClose();
        if (depths_one == null || depths_one == "") {
          //빈값이면
          $(".gnb li a").removeClass("on"); //1뎁스 비활성화
          $(".gnb_submenu").removeClass("on"); //2뎁스 영역 비활성화
        } else {
          //클릭한 1뎁스의 href 에 값이있으면
          if ($(this).hasClass("on")) {
            //활성화된 상태에서 1뎁스 메뉴 클릭시
            $(this).removeClass("on");
            $(".gnb_submenu").removeClass("on");
            $(".subs").removeClass("on");
          } else {
            //비활성화된 상태에서 1뎁스 메뉴 클릭시
            $(".gnb li a").removeClass("on");
            $(this).addClass("on");
            $(".gnb_submenu").addClass("on");
            $(".subs." + depths_one)
              .addClass("on")
              .siblings()
              .removeClass("on");
            $("body")
              .addClass("modal-open")
              .append(
                "<div class='gnb-bg' style='z-index:50; position:fixed; width:100%; height:100%; left:0; top:0; background-color: rgba(0,0,0,.2);'></div>"
              );
            $(document).on("click.gnb2depth", function (e) {
              let $clicked = $(e.target);
              if (!$clicked.closest(".subs." + depths_one).length) {
                bgDimClose();
                $(".gnb li a").removeClass("on"); // 1뎁스 비활성
                $(".gnb_submenu").removeClass("on"); // 2뎁스 영역 비활성
              }
            });
          }
        }
      });
      /* 네비게이션 우측 닫기버튼 클릭시 */
      $(".gnb_submenu__close").on("click", function (e) {
        bgDimClose();
        $(".gnb li a").removeClass("on"); // 1뎁스 비활성
        $(".gnb_submenu").removeClass("on"); // 2뎁스 영역 비활성
      });

      function bgDimClose() {
        //열려있는 2뎁스 닫을때 딤드 관련 제거
        $(".gnb-bg").remove();
        $("body").removeClass("modal-open");
        $(document).off("click.gnb2depth"); // 닫기영역 클릭 이벤트 비활성
      }

      /* 2뎁스 교과서자료실 : 중학 & 고등 메뉴 클릭시 */
      $(".box01__list li a").on("click", function (e) {
        let num = $(this).parent().index();
        // 이전 선택 과목 초기화 & 첫번째 과목 선택
        $(".box02__list li a").removeClass("on");
        $(".box02__list").eq(num).find("li a").eq(0).addClass("on");
        // 현재선택한 중학 & 고등 메뉴 클릭시
        $(".box01__list li a").removeClass("on");
        $(this).addClass("on");
        $(".box02__list")
          .css("display", "none")
          .eq($(this).parent().index())
          .css("display", "block");
      });
      /* 3뎁스 과목 클릭시 */
      $(".box02__list li a").on("click", function (e) {
        $(".box02__list li a").removeClass("on");
        $(this).addClass("on");
      });
      /* 4뎁스 클릭 관련 ~~~ 2015, 2020 개정 교육 과정 클릭 관련 */
      $(".box03__column__btn").on("click", function (e) {
        let _h = $(this).parent().find(".box03__list")[0].scrollHeight;
        if ($(this).hasClass("on")) {
          $(this).parent().find(".box03__list").attr("style", "height:0px");
          $(this).removeClass("on");
          $(this).parent().find(".box03__list").removeClass("on");
        } else {
          $(this)
            .parent()
            .find(".box03__list")
            .attr("style", "height:" + _h + "px");
          $(this).addClass("on");
          $(this).parent().find(".box03__list").addClass("on");
        }
      });
    });
  </script>
</div>

<script>
  let mhHeaderObj = {
    mhCateIndex: 0,
    mhCateList: [
      { id: "604260", code: "M-textBook", name: "중학" },
      { id: "605947", code: "H-textBook", name: "고등" },
    ],
    showTextBookList: {},
    getTextBookList: async function (groupId = 1) {
      let _this = this;
      // 교과서자료 GNB 메뉴 교과서 가져오기
      _this.showTextBookList = await $.get("/midhigh/getTextbookData.do", {
        mhCateId: _this.mhCateList[_this.mhCateIndex].id,
        groupId: groupId,
      });

      // 애니메이션효과를 주기위해 불가피하게 높이값을 고정으로 설정(auto설정 후 높이값 측정)
      let $column = $(".box03__column__btn");
      $column.each(function () {
        if ($(this).hasClass("on")) {
          $(this).siblings(".box03__list").attr("style", "height: auto");
        }
      });
      setTimeout(function () {
        $column.each(function () {
          let _h = $(this).siblings(".box03__list")[0].scrollHeight;
          if ($(this).hasClass("on")) {
            if (_h)
              $(this)
                .siblings(".box03__list")
                .attr("style", "height:" + _h + "px");
          }
        });
      }, 200);
    },
    goBookPage: function (id) {
      let _this = this;
      location.href = "/curri/schoolbookdata.html?id=" + id;
    },
    showTextBookMenu: function (mhIndex, groupId) {
      let _this = this;
      _this.mhCateIndex = mhIndex;
      _this.getTextBookList(groupId);
      $(".btn_close_menu").trigger("click");
      setTimeout(() => {
        $(".gnb li:first a").trigger("click");
        $(".box01__list li:eq(" + mhIndex + ") a").trigger("click");
        $(
          ".box02__list:eq(" + mhIndex + ") li:eq(" + (groupId - 1) + ") a"
        ).trigger("click");
      }, 250);
    },
    init: function () {
      let _this = this;
      _this.getTextBookList(1);
    },
  };
</script>

<!-- gnb sitemap -->
<div class="gnb_sitemap_2023">
  <div class="map_header">
    <div class="inner">
      <span>T셀파 중학·고등 전체 서비스</span>
      <a
              href="https://mh.tsherpa.co.kr/testbank/testbank.html#"
              class="btn_close_menu"
      >
        <img src="/resource/midhigh/img/common/btn-close-big-white.png" alt="닫기버튼" />
      </a>
    </div>
  </div>
  <div class="map_wrap">
    <div class="map_inner">
      <div class="site_list">
        <div class="subject">
              <span
              ><a
                      href="https://mh.tsherpa.co.kr/testbank/testbank.html#"
                      onclick="mhHeaderObj.$data.showTextBookMenu(0, 1)"
              >중학 교과서 자료</a
              ></span
              >
          <ul>
            <li>
              <a
                      href="https://mh.tsherpa.co.kr/testbank/testbank.html#"
                      onclick="mhHeaderObj.$data.showTextBookMenu(0, 1)"
              >국어</a
              >
            </li>
            <li>
              <a
                      href="https://mh.tsherpa.co.kr/testbank/testbank.html#"
                      onclick="mhHeaderObj.$data.showTextBookMenu(0, 2)"
              >영어</a
              >
            </li>
            <li>
              <a
                      href="https://mh.tsherpa.co.kr/testbank/testbank.html#"
                      onclick="mhHeaderObj.$data.showTextBookMenu(0, 3)"
              >수학</a
              >
            </li>
            <li>
              <a
                      href="https://mh.tsherpa.co.kr/testbank/testbank.html#"
                      onclick="mhHeaderObj.$data.showTextBookMenu(0, 4)"
              >사회/역사/도덕</a
              >
            </li>
            <li>
              <a
                      href="https://mh.tsherpa.co.kr/testbank/testbank.html#"
                      onclick="mhHeaderObj.$data.showTextBookMenu(0, 5)"
              >과학/기술·가정/정보</a
              >
            </li>
            <li>
              <a
                      href="https://mh.tsherpa.co.kr/testbank/testbank.html#"
                      onclick="mhHeaderObj.$data.showTextBookMenu(0, 6)"
              >음악/미술/체육</a
              >
            </li>
            <li>
              <a
                      href="https://mh.tsherpa.co.kr/testbank/testbank.html#"
                      onclick="mhHeaderObj.$data.showTextBookMenu(0, 7)"
              >선택/외국어</a
              >
            </li>
          </ul>
        </div>
      </div>
      <div class="site_list">
        <div class="subject">
              <span
              ><a
                      href="https://mh.tsherpa.co.kr/testbank/testbank.html#"
                      onclick="mhHeaderObj.$data.showTextBookMenu(1, 1)"
              >고등 교과서 자료</a
              ></span
              >
          <ul>
            <li>
              <a
                      href="https://mh.tsherpa.co.kr/testbank/testbank.html#"
                      onclick="mhHeaderObj.$data.showTextBookMenu(1, 1)"
              >국어</a
              >
            </li>
            <li>
              <a
                      href="https://mh.tsherpa.co.kr/testbank/testbank.html#"
                      onclick="mhHeaderObj.$data.showTextBookMenu(1, 2)"
              >영어</a
              >
            </li>
            <li>
              <a
                      href="https://mh.tsherpa.co.kr/testbank/testbank.html#"
                      onclick="mhHeaderObj.$data.showTextBookMenu(1, 3)"
              >수학</a
              >
            </li>
            <li>
              <a
                      href="https://mh.tsherpa.co.kr/testbank/testbank.html#"
                      onclick="mhHeaderObj.$data.showTextBookMenu(1, 4)"
              >사회</a
              >
            </li>
            <li>
              <a
                      href="https://mh.tsherpa.co.kr/testbank/testbank.html#"
                      onclick="mhHeaderObj.$data.showTextBookMenu(1, 5)"
              >역사</a
              >
            </li>
            <li>
              <a
                      href="https://mh.tsherpa.co.kr/testbank/testbank.html#"
                      onclick="mhHeaderObj.$data.showTextBookMenu(1, 6)"
              >도덕</a
              >
            </li>
            <li>
              <a
                      href="https://mh.tsherpa.co.kr/testbank/testbank.html#"
                      onclick="mhHeaderObj.$data.showTextBookMenu(1, 7)"
              >과학</a
              >
            </li>
            <li>
              <a
                      href="https://mh.tsherpa.co.kr/testbank/testbank.html#"
                      onclick="mhHeaderObj.$data.showTextBookMenu(1, 8)"
              >기술·가정/정보</a
              >
            </li>
            <li>
              <a
                      href="https://mh.tsherpa.co.kr/testbank/testbank.html#"
                      onclick="mhHeaderObj.$data.showTextBookMenu(1, 9)"
              >음악/미술/체육</a
              >
            </li>
            <li>
              <a
                      href="https://mh.tsherpa.co.kr/testbank/testbank.html#"
                      onclick="mhHeaderObj.$data.showTextBookMenu(1, 10)"
              >제2외국어/한문</a
              >
            </li>
            <li>
              <a
                      href="https://mh.tsherpa.co.kr/testbank/testbank.html#"
                      onclick="mhHeaderObj.$data.showTextBookMenu(1, 11)"
              >교양/전문</a
              >
            </li>
          </ul>
        </div>
      </div>
      <div class="site_list">
        <div class="subject">
              <span
              ><a href="https://mh.tsherpa.co.kr/testbank/testbank.html"
              >문제은행</a
              ></span
              >
          <ul>
            <li>
              <a
                      href="https://mh.tsherpa.co.kr/testbank/testbank.html?cateCode=M-TestBank"
              >중학</a
              >
            </li>
            <li>
              <a
                      href="https://mh.tsherpa.co.kr/testbank/testbank.html?cateCode=TestBank-Storage"
              >시험지 보관함</a
              >
            </li>
          </ul>
        </div>
      </div>
      <div class="site_list">
        <div class="subject">
              <span
              ><a href="https://mh.tsherpa.co.kr/edutech/index.html"
              >에듀테크</a
              ></span
              >
          <ul>
            <li>
              <a href="https://mh.tsherpa.co.kr/edutech/index.html"
              >에듀테크 리스트</a
              >
            </li>
          </ul>
        </div>
      </div>
      <div class="site_list">
        <div class="subject">
              <span
              ><a
                      href="https://mh.tsherpa.co.kr/class-research/tspoon/index.html"
              >수업연구소</a
              ></span
              >
          <ul>
            <li>
              <a
                      href="https://mh.tsherpa.co.kr/class-research/tspoon/index.html"
              >Tspoon(매거진)</a
              >
            </li>
            <li>
              <a
                      href="https://mh.tsherpa.co.kr/class-research/request/index.html"
              >자료요청</a
              >
            </li>
            <li>
              <a
                      href="https://mh.tsherpa.co.kr/class-research/vote/index.html"
              >T Poll(설문조사)</a
              >
            </li>
          </ul>
        </div>
      </div>
      <div class="site_list">
        <div class="subject">
              <span
              ><a href="https://sschannel.tsherpa.co.kr/" target="_blank"
              >쌤 채널</a
              ></span
              >
          <ul>
            <li>
              <a href="https://sschannel.tsherpa.co.kr/" target="_blank"
              >쌤 채널</a
              >
            </li>
          </ul>
        </div>
      </div>
    </div>
  </div>
  <span class="drop_showArea">
        <span></span>
      </span>
</div>

<script>
  $(document).ready(function () {
    // 사이트맵 클릭 관련
    $(".btn_allMenu").on("click", function (e) {
      e.preventDefault();
      $(this).parents("body").addClass("_body_scroll");
      $(".quick_menu").css("z-index", 50);
      $(this).toggleClass("open");
      $(".gnb_sitemap_2023").slideToggle(100);
      $(".submenu-bg_dmimd").remove();
      $(".header_bg_2022_v2").append(
        '<div class="submenu-bg_dmimd"></div>'
      );
    });
    $(".btn_close_menu").on("click", function (e) {
      e.preventDefault();
      $(this).parents("body").removeClass("_body_scroll");
      $(".quick_menu").css("z-index", 105);
      $(".gnb_sitemap_2023").slideUp(100);
      $(".btn_allMenu").removeClass("open");
      $(".submenu-bg_dmimd").remove();
    });
  });
</script>
<!-- // gnb sitemap -->

<div class="quick_menu v2_1">
  <button class="btn_quick_toggle"><i>화살표</i></button>
  <p class="tit">Quick menu</p>
  <!-- 로그인 후 -->

  <div class="quick_msg_box">
    <a
            href="https://ele.tsherpa.co.kr/creativity/calendar/view.html?menu=calendar&amp;categoryId=453887relid=&amp;id=760891&amp;type=E-ex-00-season_03-Mar"
            target="_blank"
            class="txt"
    >겨울잠에서 깨어나는 경칩.</a
    >
  </div>
  <script>
    function getLoginMessage() {
      return new Promise(function (resolve, reject) {
        let loginMessageList = JSON.parse(
          sessionStorage.getItem("login-message")
        );
        if (!loginMessageList) {
          $.get("/main/getLoginMessageList", null)
            .done(function (result) {
              sessionStorage.setItem(
                "login-message",
                JSON.stringify(result)
              );
              resolve(result);
            })
            .fail(function (e) {
              console.error(e);
              reject(e);
            });
        } else {
          resolve(loginMessageList);
        }
      });
    }

    $(async function () {
      let list = [];
      let priorList = [];
      let peakItem = null;
      let loginMessageList = await getLoginMessage();
      let now = moment();
      let nowDate = now.format("YYYY-MM-DD");
      let nowTime = now.format("HH:mm:ss");
      let weekDay = String(now.day() - 1);
      for (let item of loginMessageList) {
        let data = JSON.parse(item.data);
        if (data.st_date && data.repeat == "true") {
          data.st_date = now.format("YYYY") + data.st_date.substring(4, 10);
        }
        if (data.en_date && data.repeat == "true") {
          data.en_date = now.format("YYYY") + data.en_date.substring(4, 10);
        }
        if (data.site_id && data.site_id != "2") continue;
        if (data.st_date && data.st_date > nowDate) continue;
        if (data.en_date && data.en_date < nowDate) continue;
        if (data.st_time && data.st_time > nowTime) continue;
        if (data.en_time && data.en_time < nowTime) continue;
        if (data.week_day && !data.week_day.split(",").includes(weekDay))
          continue;
        data.prior == "true" ? priorList.push(item) : list.push(item);
      }
      if (priorList.length > 0) {
        let peakIndex = Math.floor(Math.random() * priorList.length);
        peakItem = priorList[peakIndex];
      } else if (list.length > 0) {
        let peakIndex = Math.floor(Math.random() * list.length);
        peakItem = list[peakIndex];
      }
      if (peakItem) {
        let $msgBox = $("div.quick_msg_box");
        if (peakItem.url) {
          $msgBox
            .append(
              `<a href="${peakItem.url}" target="_blank" class="txt">${peakItem.title}</a>`
            )
            .removeClass("no_link");
        } else {
          $msgBox.append(`<span class="txt">${peakItem.title}</span>`);
        }
      }
    });
  </script>

  <div class="login_area">
    <div class="intro">
      <p class="name"><strong>중고등 정</strong> 선생님</p>
    </div>
    <a
            href="https://www.tsherpa.co.kr/myT/membership/membership.html"
            class="btn_my_sherpa"
    >MY T셀파</a
    >
    <div class="link_box">
      <a href="javascript:logout()" class="btn_logout">로그아웃</a>
      <a
              href="https://www.tsherpa.co.kr/center/M-noticM.html"
              class="btn_customer_center"
      >고객센터</a
      >
    </div>
    <!-- 퀵메뉴 접혔을 시 버튼 -->
    <button class="quick_open user">사용자</button>
    <!-- //퀵메뉴 접혔을 시 버튼 -->
  </div>
  <!-- //로그인 후 -->

  <ul class="quick_lst go_link">
    <li class="link_timetbl">
      <a href="https://www.tsherpa.co.kr/myT/curri/myCurri.html"
      ><i></i> <span>교과서 설정</span></a
      >
    </li>
  </ul>

  <ul class="quick_lst go_tbag">
    <li class="lst01">
      <a href="https://mh.tsherpa.co.kr/testbank/testbank.html"
      ><i></i> <span>문제은행</span></a
      >
    </li>
    <li class="lst08">
      <a href="javascript:" onclick="openBookDVD();"
      ><i></i> <span>교사용 DVD</span></a
      >
    </li>
  </ul>

  <a
          href="https://mh.tsherpa.co.kr/testbank/testbank.html#"
          class="btn_top"
          style="opacity: 1"
  ><span></span>TOP</a
  >
</div>

<script>
  if (Storages.cookieStorage.setPath("/").get("menu_collapse") == "Y") {
    $(".quick_menu").addClass("active");
  } else {
    $(".quick_menu").removeClass("active");
  }
  $(function () {
    $(".btn_quick_toggle").on("click", function (e) {
      e.preventDefault();
      $(".quick_menu").toggleClass("active");
      setQuickMenuCookie();
    });
    $(".quick_open").on("click", function (e) {
      e.preventDefault();
      $(".quick_menu").removeClass("active");
      if ($(this).hasClass("inp_auto")) {
        $(".input_field #ID").focus();
      }
      setQuickMenuCookie();
    });
    var btnTop = $(".btn_top");
    btnTop.on("click", function (e) {
      e.preventDefault();
      $("html, body").animate(
        {
          scrollTop: 0,
        },
        "slow"
      );
    });
    $(window).on("load", function () {
      var scrollTop = $(window).scrollTop();
      if (scrollTop > 50) {
        btnTop.css({ opacity: 1 });
      } else {
        btnTop.css({ opacity: 0 });
      }
    });
    $(window).on("scroll", function () {
      var scrollTop = $(window).scrollTop();
      if (scrollTop > 50) {
        btnTop.css({ opacity: 1 });
      } else {
        btnTop.css({ opacity: 0 });
      }
    });

    function setQuickMenuCookie() {
      if ($(".quick_menu").hasClass("active")) {
        Storages.cookieStorage.setPath("/").set("menu_collapse", "Y");
      } else {
        Storages.cookieStorage.setPath("/").set("menu_collapse", "N");
      }
    }
  });
</script>

<script>
  async function oauthLogin(type) {
    if (await isSsoStudentLogout()) {
      return;
    }
    location.href =
      "https://www.tsherpa.co.kr/oauth2/login/" +
      type +
      "?returnUrl=" +
      encodeURIComponent(location.href);
  }

  function processLoginSuccess(response, id, pwd) {
    const doRedirect = (ssoLoginData) => {
      if (
        !(
          ssoLoginData.user.curri === "C2" ||
          ssoLoginData.user.curri === "C3"
        )
      ) {
        location.reload();
        return;
      }
      $.get("/pinCurri/getMainTpinCurri?siteId=7")
        .then((result) => {
          if (result?.mainTpinCurri?.categoryId) {
            location.replace(
              "/curri/schoolbookdata.html?id=" +
              result.mainTpinCurri.categoryId
            );
          } else {
            location.reload();
          }
        })
        .catch(() => location.reload());
    };
    let isIE11 = !!navigator.userAgent.match(/Trident.*rv\:11\./);
    if (isIE11) {
      let scriptUrl =
        "https://sso.chunjae.co.kr:446/api/auth/authenticate?SiteName=TSHERPA&Token=" +
        response.Items.Token;
      let s = document.createElement("script");
      s.type = "text/javascript";
      s.src = scriptUrl;
      $("head").append(s);
      let params = {
        token:
        response.Items.Token /* ★ 1. Token 정보는 필수사항입니다. ★ */,
        id: queryEncrypt.encrypt(
          id
        ) /* 아래 항목들은 각 사이트에 맞게 적용*/,
        pwd: queryEncrypt.encrypt(pwd),
        openerType: "pagelogin",
        returnUrl: encodeURIComponent(queryEncrypt.encrypt(location.href)),
        encData: response.Items.SSOEncData,
        oReturnUrl: "",
        siteInfoIncorrect: "0",
      };
      $.post("/ssoLogin.do", params).done(function (data) {
        if (data.success) {
          setTimeout(function () {
            Common.setCookie("loginCheck", "Y");
            doRedirect(data);
          }, 600);
        } else {
          alert(data.message);
        }
      });
    } else {
      $.getScript(
        "https://sso.chunjae.co.kr:446/api/auth/authenticate?SiteName=TSHERPA&Token=" +
        response.Items.Token
      ).done(function (script, textStatus) {
        let params = {
          token:
          response.Items.Token /* ★ 1. Token 정보는 필수사항입니다. ★ */,
          id: queryEncrypt.encrypt(
            id
          ) /* 아래 항목들은 각 사이트에 맞게 적용*/,
          pwd: queryEncrypt.encrypt(pwd),
          openerType: "pagelogin",
          returnUrl: encodeURIComponent(
            queryEncrypt.encrypt(location.href)
          ),
          encData: response.Items.SSOEncData,
          oReturnUrl: "",
          siteInfoIncorrect: "0",
        };
        $.post("/ssoLogin.do", params).done(function (data) {
          if (data.success) {
            Common.setCookie("loginCheck", "Y");
            doRedirect(data);
          } else {
            alert(data.message);
          }
        });
      });
    }
  }

  async function login() {
    if (await isSsoStudentLogout()) {
      return;
    }
    let id = $(".login_area input[name=q_username]").val();
    let pwd = $(".login_area input[name=q_password]").val();
    if (!id || !pwd) {
      alert("아이디나 비밀번호가 입력되지 않았습니다.");
      return false;
    }
    let params = {
      UserID: queryEncrypt.encrypt(id),
      Pwd: queryEncrypt.encrypt(pwd),
      SiteID: 1,
      Mobile: 0,
    };
    $.ajax({
      url: "https://sso.chunjae.co.kr:446/api/auth/Login2",
      data: params,
      dataType: "json",
      cache: false,
      async: false,
      success: function (res) {
        switch (res.Status) {
          case Chunjae.Auth.Status.OK:
            processLoginSuccess(res.Result, id, pwd);
            break;
          case Chunjae.Auth.Status.INFO_INCORRECT:
            let count = Number(res.Result.Items.LoginFailCount);
            count = count > 10 ? 10 : count;
            alert(
              "아이디 또는 비밀번호를 잘못 입력하셨습니다." +
              (count ? " (" + count + "/10회)" : "")
            );
            break;
          case Chunjae.Auth.Status.SITEINFO_INCORRECT:
            alert("사이트 정보가 일치하지 않습니다.");
            break;
          case Chunjae.Auth.Status.ID_DORMANT:
            alert("해당 아이디는 휴면계정입니다.");
            break;
          case Chunjae.Auth.Status.AUTH_ERROR:
            alert("인증 에러입니다.");
            break;
          case Chunjae.Auth.Status.MEMBER_ERROR:
            alert("회원정보 에러입니다.");
            break;
          case Chunjae.Auth.Status.AUTH_TIMEOUT:
            alert(
              "잘못된 아이디 또는 비밀번호를 입력하셨습니다. 60초 후에 다시 로그인을 진행해주세요."
            );
            break;
          default:
            alert(
              "정보를 불러오는데 문제가 발생하였습니다.\n다시 시도해주세요."
            );
            break;
        }
      },
      error: function (e) {
        console.error(e);
      },
    });
    if ($("input:checkbox[id='rememberUserId']").is(":checked")) {
      Storages.localStorage.set("loginuserid", id);
    } else {
      Storages.localStorage.remove("loginuserid");
    }
  }

  $(function () {
    $(".btn_login").on("click", function () {
      login();
    });
    // 로그인 이벤트 추가
    $("input[name=q_password]").on("keypress", function (e) {
      if (e.keyCode == 13) {
        login();
      }
    });
    let userid = Storages.localStorage.get("loginuserid");
    let $form = $('form[name="q_loginForm"]');
    if (userid) {
      $("input[name='q_username']", $form).val(userid);
      $("input:checkbox[id='rememberUserId']").prop("checked", true);
    }
    $form.submit(function (e) {
      e.preventDefault();
      login(e);
    });
  });
</script>
<form
        id="searchHeaderForm"
        name="searchHeaderForm"
        method="get"
        action="https://mh.tsherpa.co.kr/testbank/testbank.html"
        target="_blank"
>
  <input type="hidden" id="q" name="q" value="" />
  <input
          type="hidden"
          id="fromSiteType"
          name="fromSiteType"
          value="midhigh"
  />
</form>

<script>
  let _findUrl = "https://www.tsherpa.co.kr/";
  let _keyword = "";
  let _section = "";
  let _keywordForm = $("#keywordForm");
  let _searchForm = $("#searchHeaderForm");

  // 검색 전송
  function doSearch() {
    if ($("#keyword").val() != "") {
      $(_searchForm)
        .find("#q")
        .val(encodeURIComponent($(_keywordForm).find("#keyword").val()));
      $(_searchForm).attr("action", _findUrl + "search/all.html");
      $(_searchForm).submit();
    } else {
      alert("검색어를 입력해 주세요.");
    }
    return false;
  }

  function press() {
    if (event.keyCode == 13) {
      if ($(_keywordForm).find("#keyword").val()) {
        doSearch();
      }
    }
  }

  $("#searchButton").on("click", function () {
    doSearch();
  });
</script>
<div id="tDvdModalDiv"></div>

<script>
  function openTShareCommonUrl(url) {
    if (!checkUserLoggedIn()) {
      return;
    }
    location.href = url;
  }

  // 교사용 DVD
  function openBookDVD(code) {
    if (!checkUserLoggedIn()) {
      return;
    }
    if (!CEMember()) {
      alert("중,고등 정회원만 서비스를 이용하실 수 있습니다.");
      return;
    }
    let schoolType = "mid";
    let param = new URLSearchParams({
      tBook: code,
      type: schoolType,
      name: "",
      year: "2015",
    });
    front.loading.showLoading();
    $("#tDvdModalDiv").load(
      "/modal/tDVD.html?" + param.toString(),
      function () {
        $("#tDvdPopup").modal("show");
        front.loading.hideLoading();
      }
    );
  }
</script>
<script>
  if (moment() >= moment("2024-02-01") && moment() < moment("2024-02-13")) {
    $("div.header_top h1").addClass("logo_seollal");
  } else {
    $("div.header_top h1").removeClass("logo_seollal");
  }
</script>

<!--header-->
<main class="testbank_body">
  <div class="content-section">
    <!-- 230823 추가 -->
    <div class="content-section__header">
      <h2>
        문제은행<img
              src="/resource/midhigh/img/testbank_2023/beta_i.png"
              alt="베타"
              class="beta-i"
      />
      </h2>
      <p>
        문제출제, 시험지 편집까지! 편리하게 시험지 제작 서비스를 제공합니다.
      </p>
    </div>
    <!-- // 230823 추가 -->
    <div class="columns">
      <div class="data-body">
        <div class="data-details__content">
          <div class="tabs">
            <!-- 중등 고등, 수능, 시험지 보관함 탭 -->
            <ul class="tabs__list tabs__list--3">
              <li class="tabs__item">
                <a
                        href="https://mh.tsherpa.co.kr/testbank/testbank.html?cateCode=M-TestBank"
                        class="tabs__link tabs__link--on"
                >중학</a
                >
              </li>
              <li class="tabs__item">
                <a
                        href="https://mh.tsherpa.co.kr/testbank/testbank.html?cateCode=TestBank-Storage"
                        class="tabs__link"
                >시험지 보관함</a
                >
              </li>
            </ul>
            <!-- // 중등 고등, 수능, 시험지 보관함 탭 -->

            <!-- 과목 카테고리 탭 -->
            <ul class="tabs__list tabs__list--4">
              <li class="tabs__item">
                <a
                        href="https://mh.tsherpa.co.kr/testbank/testbank.html?cateCode=M-TestBank&amp;subjectCode=M-testBank-ko&amp;testbankYN=Y"
                        class="tabs__link tabs__link--on"
                >국어</a
                >
              </li>
              <li class="tabs__item">
                <a
                        href="https://mh.tsherpa.co.kr/testbank/testbank.html?cateCode=M-TestBank&amp;subjectCode=M-testBank-eng&amp;testbankYN=Y"
                        class="tabs__link"
                >영어</a
                >
              </li>
              <li class="tabs__item">
                <a
                        href="https://mh.tsherpa.co.kr/testbank/testbank.html?cateCode=M-TestBank&amp;subjectCode=M-testBank-math&amp;testbankYN=Y"
                        class="tabs__link"
                >수학</a
                >
              </li>
              <li class="tabs__item">
                <a
                        href="https://mh.tsherpa.co.kr/testbank/testbank.html?cateCode=M-TestBank&amp;subjectCode=M-testBank-society&amp;testbankYN=Y"
                        class="tabs__link"
                >사회</a
                >
              </li>
              <li class="tabs__item">
                <a
                        href="https://mh.tsherpa.co.kr/testbank/testbank.html?cateCode=M-TestBank&amp;subjectCode=M-testBank-history&amp;testbankYN=Y"
                        class="tabs__link"
                >역사</a
                >
              </li>
              <li class="tabs__item">
                <a
                        href="https://mh.tsherpa.co.kr/testbank/testbank.html?cateCode=M-TestBank&amp;subjectCode=M-testBank-morality&amp;testbankYN=Y"
                        class="tabs__link"
                >도덕</a
                >
              </li>
              <li class="tabs__item">
                <a
                        href="https://mh.tsherpa.co.kr/testbank/testbank.html?cateCode=M-TestBank&amp;subjectCode=M-testBank-science&amp;testbankYN=Y"
                        class="tabs__link"
                >과학</a
                >
              </li>
              <li class="tabs__item">
                <a
                        href="https://mh.tsherpa.co.kr/testbank/testbank.html?cateCode=M-TestBank&amp;subjectCode=M-testBank-techNhome&amp;testbankYN="
                        class="tabs__link"
                >기술·가정</a
                >
              </li>
              <li class="tabs__item">
                <a
                        href="https://mh.tsherpa.co.kr/testbank/testbank.html?cateCode=M-TestBank&amp;subjectCode=M-testBank-info&amp;testbankYN="
                        class="tabs__link"
                >정보</a
                >
              </li>
              <li class="tabs__item">
                <a
                        href="https://mh.tsherpa.co.kr/testbank/testbank.html?cateCode=M-TestBank&amp;subjectCode=M-testBank-music&amp;testbankYN="
                        class="tabs__link"
                >음악</a
                >
              </li>
              <li class="tabs__item">
                <a
                        href="https://mh.tsherpa.co.kr/testbank/testbank.html?cateCode=M-TestBank&amp;subjectCode=M-testBank-art&amp;testbankYN="
                        class="tabs__link"
                >미술</a
                >
              </li>
              <li class="tabs__item">
                <a
                        href="https://mh.tsherpa.co.kr/testbank/testbank.html?cateCode=M-TestBank&amp;subjectCode=M-testBank-physical&amp;testbankYN="
                        class="tabs__link"
                >체육</a
                >
              </li>
              <li class="tabs__item">
                <a
                        href="https://mh.tsherpa.co.kr/testbank/testbank.html?cateCode=M-TestBank&amp;subjectCode=M-testBank-select&amp;testbankYN="
                        class="tabs__link"
                >선택</a
                >
              </li>
              <li class="tabs__item">
                <a
                        href="https://mh.tsherpa.co.kr/testbank/testbank.html?cateCode=M-TestBank&amp;subjectCode=M-testBank-cl&amp;testbankYN="
                        class="tabs__link"
                >생활 중국어</a
                >
              </li>
              <li class="tabs__item">
                <a
                        href="https://mh.tsherpa.co.kr/testbank/testbank.html?cateCode=M-TestBank&amp;subjectCode=M-testBank-jl&amp;testbankYN="
                        class="tabs__link"
                >생활 일본어</a
                >
              </li>
            </ul>
            <!-- // 과목 카테고리 탭 -->
          </div>
          <!-- // 상단 메인,세부 카테고리 탭 메뉴 -->
          <!-- 상단 메인,세부 카테고리 탭 메뉴 -->
          <!-- 즐겨찾는 교과서  -->
          <div class="tb-container tb-bookmark" style="">
            <form
                    method="get"
                    id="bookmarkListForm"
                    action="https://mh.tsherpa.co.kr/testbank/bookmark_data.html"
                    onsubmit="return false;"
            ></form>
            <h2 class="tb-container__header">즐겨찾는 교과서</h2>
            <div class="tb-container__body">
              <div class="columns" id="divBookmarkList">
                <div class="item">
                  <div class="item-mark">
                    <a
                            href="javascript:;"
                            onclick="delBookmark('M-testBank-math_01_01', 605534);"
                            class="tooltip-mark add-bookmark"
                    ><span class="ir_su">즐겨찾기 삭제</span></a
                    >
                  </div>
                  <div class="item-content">
                    <!-- 썸네일 -->
                    <div class="item-image">
                      <figure class="image is-thumnail">
                        <img
                                src="/resource/midhigh/img/booklist/중학_수학1_이준열.jpg"
                                alt="교과서 이미지"
                        />
                      </figure>
                    </div>
                    <div class="item-info">
                      <p class="data_title">수학 1 (이준열)</p>
                      <div class="data_buttons">
                        <a
                                href="javascript:;"
                                onclick="customExamPopup(1139);"
                                title="새창 열림"
                                class="button"
                        ><i class="icon icon-memo-center"></i>시험지
                          만들기</a
                        >
                        <a
                                href="javascript:;"
                                onclick="getExam(605534);"
                                title="다운로드"
                                class="button"
                        ><i class="icon icon-download"></i>평가자료
                          다운</a
                        >
                      </div>
                    </div>
                  </div>
                </div>
                <div class="item">
                  <div class="item-mark">
                    <a
                            href="javascript:;"
                            onclick="delBookmark('M-testBank-ko_01_06', 605850);"
                            class="tooltip-mark add-bookmark"
                    ><span class="ir_su">즐겨찾기 삭제</span></a
                    >
                  </div>
                  <div class="item-content">
                    <!-- 썸네일 -->
                    <div class="item-image">
                      <figure class="image is-thumnail">
                        <img
                                src="/resource/midhigh/img/booklist/(15개정)(노)중학_국어3-2_교과서.jpg"
                                alt="교과서 이미지"
                        />
                      </figure>
                    </div>
                    <div class="item-info">
                      <p class="data_title">국어 3-2 (노미숙)</p>
                      <div class="data_buttons">
                        <a
                                href="javascript:;"
                                onclick="customExamPopup(1159);"
                                title="새창 열림"
                                class="button"
                        ><i class="icon icon-memo-center"></i>시험지
                          만들기</a
                        >
                        <a
                                href="javascript:;"
                                onclick="getExam(605850);"
                                title="다운로드"
                                class="button"
                        ><i class="icon icon-download"></i>평가자료
                          다운</a
                        >
                      </div>
                    </div>
                  </div>
                </div>
                <div class="item">
                  <div class="item-mark">
                    <a
                            href="javascript:;"
                            onclick="delBookmark('M-testBank-eng_01_02', 605684);"
                            class="tooltip-mark add-bookmark"
                    ><span class="ir_su">즐겨찾기 삭제</span></a
                    >
                  </div>
                  <div class="item-content">
                    <!-- 썸네일 -->
                    <div class="item-image">
                      <figure class="image is-thumnail">
                        <img
                                src="/resource/midhigh/img/booklist/A8-C2-EE-EE-03-02.jpg"
                                alt="교과서 이미지"
                        />
                      </figure>
                    </div>
                    <div class="item-info">
                      <p class="data_title">영어 2 (이재영)</p>
                      <div class="data_buttons">
                        <a
                                href="javascript:;"
                                onclick="customExamPopup(1161);"
                                title="새창 열림"
                                class="button"
                        ><i class="icon icon-memo-center"></i>시험지
                          만들기</a
                        >
                        <a
                                href="javascript:;"
                                onclick="getExam(605684);"
                                title="다운로드"
                                class="button"
                        ><i class="icon icon-download"></i>평가자료
                          다운</a
                        >
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <!-- //즐겨찾는 교과서  -->

          <!-- 평가자료 다운 팝업 -->
          <div
                  class="modal fade"
                  tabindex="-1"
                  role="dialog"
                  id="subjectPopup"
                  aria-modal="true"
          >
            <form
                    method="get"
                    id="examDataListForm"
                    action="https://mh.tsherpa.co.kr/testbank/exam_data.html"
                    onsubmit="return false;"
            >
              <input
                      type="hidden"
                      id="examCateId"
                      name="examCateId"
                      value=""
              />
            </form>
            <div
                    class="modal-dialog-centered modal-dialog modal-lg"
                    role="document"
            >
              <div class="modal-content">
                <div class="modal-header">
                  <div class="modal-title">평가자료 다운로드</div>
                  <a class="close" data-dismiss="modal" aria-label="Close">
                    <img
                            src="/resource/midhigh/img/common/btn-close-big-white.png"
                            alt="닫기버튼"
                            aria-hidden="true"
                    />
                  </a>
                </div>
                <div class="modal-body evalData_download-popup">
                  <div class="category-line">
                    <p class="loc">
                      <span id="sp_lTitle"></span>
                      <span id="sp_mTitle"></span>
                      <span id="sp_sTitle"></span>
                    </p>
                  </div>
                  <div class="inner">
                    <div class="pop_title">
                      <p>총<span id="sp_totalCnt">0</span>개</p>
                      <a
                              href="javascript:;"
                              onclick="checkContentAll()"
                              class="btn btn-gray"
                      ><span class="name">전체 선택</span></a
                      >
                    </div>
                    <div class="table_wrapper">
                      <table class="table text-align-center flat-row">
                        <colgroup>
                          <col style="width: 60px" />
                          <col style="width: 73px" />
                          <col style="width: auto" />
                          <col style="width: 140px" />
                        </colgroup>
                        <tbody id="examList"></tbody>
                      </table>
                    </div>
                    <div class="bot_btncase mt20">
                      <p>
                        선택한 학습자료<span id="sp_examData">0</span>개
                      </p>
                      <a
                              href="javascript:;"
                              onclick="allDownload()"
                              class="btn btn-gray"
                      ><span class="name">다운로드</span></a
                      >
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <!-- 평가자료 다운 팝업 -->

          <!-- 교과서 목록 -->
          <div class="tb-container tb-list">
            <h2 class="tb-container__header">노미숙</h2>
            <div class="tb-container__body">
              <div class="columns">
                <!-- item -->

                <div class="item">
                  <div class="item-mark">
                    <a
                            href="javascript:;"
                            style="display: none"
                            id="add_611500"
                            onclick="delBookmark('M-testBank-ko_01_01', 611500);"
                            class="tooltip-mark add-bookmark"
                    ><span class="ir_su">즐겨찾기 삭제</span></a
                    >
                    <a
                            href="javascript:;"
                            id="del_611500"
                            onclick="addBookmark('M-testBank-ko_01_01','Y', 611500);"
                            class="tooltip-mark"
                    ><span class="ir_su">즐겨찾기 등록</span></a
                    >
                  </div>
                  <div class="item-content">
                    <div class="item-image">
                      <figure class="image is-thumnail">
                        <img
                                src="/resource/midhigh/img/booklist/A8-C2-KK-KK-02-03.jpg"
                                alt="교과서 이미지"
                        />
                      </figure>
                    </div>
                    <div class="item-info">
                      <p class="data_title">국어 1-1</p>
                      <div class="data_buttons">
                        <a
                                href="javascript:;"
                                onclick="customExamPopup('1154');"
                                title="새창 열림"
                                class="button"
                        >
                          <i class="icon icon-memo-center"></i>시험지 만들기
                        </a>
                        <a
                                href="javascript:getExam('611500');"
                                title="다운로드"
                                class="button"
                        >
                          <i class="icon icon-download"></i> 평가자료 다운
                        </a>
                      </div>
                    </div>
                  </div>
                </div>
                <!-- // item -->
                <!-- item -->

                <div class="item">
                  <div class="item-mark">
                    <a
                            href="javascript:;"
                            style="display: none"
                            id="add_611501"
                            onclick="delBookmark('M-testBank-ko_01_02', 611501);"
                            class="tooltip-mark add-bookmark"
                    ><span class="ir_su">즐겨찾기 삭제</span></a
                    >
                    <a
                            href="javascript:;"
                            id="del_611501"
                            onclick="addBookmark('M-testBank-ko_01_02','Y', 611501);"
                            class="tooltip-mark"
                    ><span class="ir_su">즐겨찾기 등록</span></a
                    >
                  </div>
                  <div class="item-content">
                    <div class="item-image">
                      <figure class="image is-thumnail">
                        <img
                                src="/resource/midhigh/img/booklist/A8-C2-KK-KK-02-04.jpg"
                                alt="교과서 이미지"
                        />
                      </figure>
                    </div>
                    <div class="item-info">
                      <p class="data_title">국어 1-2</p>
                      <div class="data_buttons">
                        <a
                                href="javascript:;"
                                onclick="customExamPopup('1155');"
                                title="새창 열림"
                                class="button"
                        >
                          <i class="icon icon-memo-center"></i>시험지 만들기
                        </a>
                        <a
                                href="javascript:getExam('611501');"
                                title="다운로드"
                                class="button"
                        >
                          <i class="icon icon-download"></i> 평가자료 다운
                        </a>
                      </div>
                    </div>
                  </div>
                </div>
                <!-- // item -->
                <!-- item -->

                <div class="item">
                  <div class="item-mark">
                    <a
                            href="javascript:;"
                            style="display: none"
                            id="add_611502"
                            onclick="delBookmark('M-testBank-ko_01_03', 611502);"
                            class="tooltip-mark add-bookmark"
                    ><span class="ir_su">즐겨찾기 삭제</span></a
                    >
                    <a
                            href="javascript:;"
                            id="del_611502"
                            onclick="addBookmark('M-testBank-ko_01_03','Y', 611502);"
                            class="tooltip-mark"
                    ><span class="ir_su">즐겨찾기 등록</span></a
                    >
                  </div>
                  <div class="item-content">
                    <div class="item-image">
                      <figure class="image is-thumnail">
                        <img
                                src="/resource/midhigh/img/booklist/15개정_(중)국어(노미숙)_2-1.jpg"
                                alt="교과서 이미지"
                        />
                      </figure>
                    </div>
                    <div class="item-info">
                      <p class="data_title">국어 2-1</p>
                      <div class="data_buttons">
                        <a
                                href="javascript:;"
                                onclick="customExamPopup('1156');"
                                title="새창 열림"
                                class="button"
                        >
                          <i class="icon icon-memo-center"></i>시험지 만들기
                        </a>
                        <a
                                href="javascript:getExam('611502');"
                                title="다운로드"
                                class="button"
                        >
                          <i class="icon icon-download"></i> 평가자료 다운
                        </a>
                      </div>
                    </div>
                  </div>
                </div>
                <!-- // item -->
                <!-- item -->

                <div class="item">
                  <div class="item-mark">
                    <a
                            href="javascript:;"
                            style="display: none"
                            id="add_611503"
                            onclick="delBookmark('M-testBank-ko_01_04', 611503);"
                            class="tooltip-mark add-bookmark"
                    ><span class="ir_su">즐겨찾기 삭제</span></a
                    >
                    <a
                            href="javascript:;"
                            id="del_611503"
                            onclick="addBookmark('M-testBank-ko_01_04','Y', 611503);"
                            class="tooltip-mark"
                    ><span class="ir_su">즐겨찾기 등록</span></a
                    >
                  </div>
                  <div class="item-content">
                    <div class="item-image">
                      <figure class="image is-thumnail">
                        <img
                                src="/resource/midhigh/img/booklist/15개정_(중)국어(노미숙)_2-2.jpg"
                                alt="교과서 이미지"
                        />
                      </figure>
                    </div>
                    <div class="item-info">
                      <p class="data_title">국어 2-2</p>
                      <div class="data_buttons">
                        <a
                                href="javascript:;"
                                onclick="customExamPopup('1157');"
                                title="새창 열림"
                                class="button"
                        >
                          <i class="icon icon-memo-center"></i>시험지 만들기
                        </a>
                        <a
                                href="javascript:getExam('611503');"
                                title="다운로드"
                                class="button"
                        >
                          <i class="icon icon-download"></i> 평가자료 다운
                        </a>
                      </div>
                    </div>
                  </div>
                </div>
                <!-- // item -->
                <!-- item -->

                <div class="item">
                  <div class="item-mark">
                    <a
                            href="javascript:;"
                            style="display: none"
                            id="add_611504"
                            onclick="delBookmark('M-testBank-ko_01_05', 611504);"
                            class="tooltip-mark add-bookmark"
                    ><span class="ir_su">즐겨찾기 삭제</span></a
                    >
                    <a
                            href="javascript:;"
                            id="del_611504"
                            onclick="addBookmark('M-testBank-ko_01_05','Y', 611504);"
                            class="tooltip-mark"
                    ><span class="ir_su">즐겨찾기 등록</span></a
                    >
                  </div>
                  <div class="item-content">
                    <div class="item-image">
                      <figure class="image is-thumnail">
                        <img
                                src="/resource/midhigh/img/booklist/중%20국어%203-1.jpg"
                                alt="교과서 이미지"
                        />
                      </figure>
                    </div>
                    <div class="item-info">
                      <p class="data_title">국어 3-1</p>
                      <div class="data_buttons">
                        <a
                                href="javascript:;"
                                onclick="customExamPopup('1158');"
                                title="새창 열림"
                                class="button"
                        >
                          <i class="icon icon-memo-center"></i>시험지 만들기
                        </a>
                        <a
                                href="javascript:getExam('611504');"
                                title="다운로드"
                                class="button"
                        >
                          <i class="icon icon-download"></i> 평가자료 다운
                        </a>
                      </div>
                    </div>
                  </div>
                </div>
                <!-- // item -->
                <!-- item -->

                <div class="item">
                  <div class="item-mark">
                    <a
                            href="javascript:;"
                            id="add_611505"
                            onclick="delBookmark('M-testBank-ko_01_06', 611505);"
                            class="tooltip-mark add-bookmark"
                    ><span class="ir_su">즐겨찾기 삭제</span></a
                    >
                    <a
                            href="javascript:;"
                            style="display: none"
                            id="del_611505"
                            onclick="addBookmark('M-testBank-ko_01_06','Y', 611505);"
                            class="tooltip-mark"
                    ><span class="ir_su">즐겨찾기 등록</span></a
                    >
                  </div>
                  <div class="item-content">
                    <div class="item-image">
                      <figure class="image is-thumnail">
                        <img
                                src="/resource/midhigh/img/booklist/(15개정)(노)중학_국어3-2_교과서.jpg"
                                alt="교과서 이미지"
                        />
                      </figure>
                    </div>
                    <div class="item-info">
                      <p class="data_title">국어 3-2</p>
                      <div class="data_buttons">
                        <a
                                href="javascript:;"
                                onclick="customExamPopup('1159');"
                                title="새창 열림"
                                class="button"
                        >
                          <i class="icon icon-memo-center"></i>시험지 만들기
                        </a>
                        <a
                                href="javascript:getExam('611505');"
                                title="다운로드"
                                class="button"
                        >
                          <i class="icon icon-download"></i> 평가자료 다운
                        </a>
                      </div>
                    </div>
                  </div>
                </div>
                <!-- // item -->
              </div>
            </div>
          </div>
          <!-- // 교과서 목록  -->
          <!-- 교과서 목록 -->
          <div class="tb-container tb-list">
            <h2 class="tb-container__header">박영목</h2>
            <div class="tb-container__body">
              <div class="columns">
                <!-- item -->

                <div class="item">
                  <div class="item-mark">
                    <a
                            href="javascript:;"
                            style="display: none"
                            id="add_611506"
                            onclick="delBookmark('M-testBank-ko_02_01', 611506);"
                            class="tooltip-mark add-bookmark"
                    ><span class="ir_su">즐겨찾기 삭제</span></a
                    >
                    <a
                            href="javascript:;"
                            id="del_611506"
                            onclick="addBookmark('M-testBank-ko_02_01','Y', 611506);"
                            class="tooltip-mark"
                    ><span class="ir_su">즐겨찾기 등록</span></a
                    >
                  </div>
                  <div class="item-content">
                    <div class="item-image">
                      <figure class="image is-thumnail">
                        <img
                                src="/resource/midhigh/img/booklist/A8-C2-KK-KK-03-01.jpg"
                                alt="교과서 이미지"
                        />
                      </figure>
                    </div>
                    <div class="item-info">
                      <p class="data_title">국어 1-1</p>
                      <div class="data_buttons">
                        <a
                                href="javascript:;"
                                onclick="customExamPopup('1198');"
                                title="새창 열림"
                                class="button"
                        >
                          <i class="icon icon-memo-center"></i>시험지 만들기
                        </a>
                        <a
                                href="javascript:getExam('611506');"
                                title="다운로드"
                                class="button"
                        >
                          <i class="icon icon-download"></i> 평가자료 다운
                        </a>
                      </div>
                    </div>
                  </div>
                </div>
                <!-- // item -->
                <!-- item -->

                <div class="item">
                  <div class="item-mark">
                    <a
                            href="javascript:;"
                            style="display: none"
                            id="add_611507"
                            onclick="delBookmark('M-testBank-ko_02_02', 611507);"
                            class="tooltip-mark add-bookmark"
                    ><span class="ir_su">즐겨찾기 삭제</span></a
                    >
                    <a
                            href="javascript:;"
                            id="del_611507"
                            onclick="addBookmark('M-testBank-ko_02_02','Y', 611507);"
                            class="tooltip-mark"
                    ><span class="ir_su">즐겨찾기 등록</span></a
                    >
                  </div>
                  <div class="item-content">
                    <div class="item-image">
                      <figure class="image is-thumnail">
                        <img
                                src="/resource/midhigh/img/booklist/A8-C2-KK-KK-03-02.jpg"
                                alt="교과서 이미지"
                        />
                      </figure>
                    </div>
                    <div class="item-info">
                      <p class="data_title">국어 1-2</p>
                      <div class="data_buttons">
                        <a
                                href="javascript:;"
                                onclick="customExamPopup('1199');"
                                title="새창 열림"
                                class="button"
                        >
                          <i class="icon icon-memo-center"></i>시험지 만들기
                        </a>
                        <a
                                href="javascript:getExam('611507');"
                                title="다운로드"
                                class="button"
                        >
                          <i class="icon icon-download"></i> 평가자료 다운
                        </a>
                      </div>
                    </div>
                  </div>
                </div>
                <!-- // item -->
                <!-- item -->

                <div class="item">
                  <div class="item-mark">
                    <a
                            href="javascript:;"
                            style="display: none"
                            id="add_611508"
                            onclick="delBookmark('M-testBank-ko_02_03', 611508);"
                            class="tooltip-mark add-bookmark"
                    ><span class="ir_su">즐겨찾기 삭제</span></a
                    >
                    <a
                            href="javascript:;"
                            id="del_611508"
                            onclick="addBookmark('M-testBank-ko_02_03','Y', 611508);"
                            class="tooltip-mark"
                    ><span class="ir_su">즐겨찾기 등록</span></a
                    >
                  </div>
                  <div class="item-content">
                    <div class="item-image">
                      <figure class="image is-thumnail">
                        <img
                                src="/resource/midhigh/img/booklist/A8-C2-KK-KK-03-03.jpg"
                                alt="교과서 이미지"
                        />
                      </figure>
                    </div>
                    <div class="item-info">
                      <p class="data_title">국어 2-1</p>
                      <div class="data_buttons">
                        <a
                                href="javascript:;"
                                onclick="customExamPopup('1200');"
                                title="새창 열림"
                                class="button"
                        >
                          <i class="icon icon-memo-center"></i>시험지 만들기
                        </a>
                        <a
                                href="javascript:getExam('611508');"
                                title="다운로드"
                                class="button"
                        >
                          <i class="icon icon-download"></i> 평가자료 다운
                        </a>
                      </div>
                    </div>
                  </div>
                </div>
                <!-- // item -->
                <!-- item -->

                <div class="item">
                  <div class="item-mark">
                    <a
                            href="javascript:;"
                            style="display: none"
                            id="add_611509"
                            onclick="delBookmark('M-testBank-ko_02_04', 611509);"
                            class="tooltip-mark add-bookmark"
                    ><span class="ir_su">즐겨찾기 삭제</span></a
                    >
                    <a
                            href="javascript:;"
                            id="del_611509"
                            onclick="addBookmark('M-testBank-ko_02_04','Y', 611509);"
                            class="tooltip-mark"
                    ><span class="ir_su">즐겨찾기 등록</span></a
                    >
                  </div>
                  <div class="item-content">
                    <div class="item-image">
                      <figure class="image is-thumnail">
                        <img
                                src="/resource/midhigh/img/booklist/15개정_(중)국어2-2(박영목)교과서.jpg"
                                alt="교과서 이미지"
                        />
                      </figure>
                    </div>
                    <div class="item-info">
                      <p class="data_title">국어 2-2</p>
                      <div class="data_buttons">
                        <a
                                href="javascript:;"
                                onclick="customExamPopup('1201');"
                                title="새창 열림"
                                class="button"
                        >
                          <i class="icon icon-memo-center"></i>시험지 만들기
                        </a>
                        <a
                                href="javascript:getExam('611509');"
                                title="다운로드"
                                class="button"
                        >
                          <i class="icon icon-download"></i> 평가자료 다운
                        </a>
                      </div>
                    </div>
                  </div>
                </div>
                <!-- // item -->
                <!-- item -->

                <div class="item">
                  <div class="item-mark">
                    <a
                            href="javascript:;"
                            style="display: none"
                            id="add_611510"
                            onclick="delBookmark('M-testBank-ko_02_05', 611510);"
                            class="tooltip-mark add-bookmark"
                    ><span class="ir_su">즐겨찾기 삭제</span></a
                    >
                    <a
                            href="javascript:;"
                            id="del_611510"
                            onclick="addBookmark('M-testBank-ko_02_05','Y', 611510);"
                            class="tooltip-mark"
                    ><span class="ir_su">즐겨찾기 등록</span></a
                    >
                  </div>
                  <div class="item-content">
                    <div class="item-image">
                      <figure class="image is-thumnail">
                        <img
                                src="/resource/midhigh/img/booklist/A8-C2-KK-KK-03-05.jpg"
                                alt="교과서 이미지"
                        />
                      </figure>
                    </div>
                    <div class="item-info">
                      <p class="data_title">국어 3-1</p>
                      <div class="data_buttons">
                        <a
                                href="javascript:;"
                                onclick="customExamPopup('1202');"
                                title="새창 열림"
                                class="button"
                        >
                          <i class="icon icon-memo-center"></i>시험지 만들기
                        </a>
                        <a
                                href="javascript:getExam('611510');"
                                title="다운로드"
                                class="button"
                        >
                          <i class="icon icon-download"></i> 평가자료 다운
                        </a>
                      </div>
                    </div>
                  </div>
                </div>
                <!-- // item -->
                <!-- item -->

                <div class="item">
                  <div class="item-mark">
                    <a
                            href="javascript:;"
                            style="display: none"
                            id="add_611511"
                            onclick="delBookmark('M-testBank-ko_02_06', 611511);"
                            class="tooltip-mark add-bookmark"
                    ><span class="ir_su">즐겨찾기 삭제</span></a
                    >
                    <a
                            href="javascript:;"
                            id="del_611511"
                            onclick="addBookmark('M-testBank-ko_02_06','Y', 611511);"
                            class="tooltip-mark"
                    ><span class="ir_su">즐겨찾기 등록</span></a
                    >
                  </div>
                  <div class="item-content">
                    <div class="item-image">
                      <figure class="image is-thumnail">
                        <img
                                src="/resource/midhigh/img/booklist/15개정(중)국어3-2(박영목)교과서표1(4).jpg"
                                alt="교과서 이미지"
                        />
                      </figure>
                    </div>
                    <div class="item-info">
                      <p class="data_title">국어 3-2</p>
                      <div class="data_buttons">
                        <a
                                href="javascript:;"
                                onclick="customExamPopup('1203');"
                                title="새창 열림"
                                class="button"
                        >
                          <i class="icon icon-memo-center"></i>시험지 만들기
                        </a>
                        <a
                                href="javascript:getExam('611511');"
                                title="다운로드"
                                class="button"
                        >
                          <i class="icon icon-download"></i> 평가자료 다운
                        </a>
                      </div>
                    </div>
                  </div>
                </div>
                <!-- // item -->
              </div>
            </div>
          </div>
          <!-- // 교과서 목록  -->

          <script>
            $(function () {
              getBookmark();
            });

            function downloadContents(ids) {
              if (!checkUserLoggedIn(location.href)) {
                return false;
              }
              if (ids.length === 0 || ids === undefined) {
                alert("선택한 항목이 없습니다.");
                return false;
              }
              openHiddenFrame("/common/download_files.html?ids=" + ids);
            }

            function checkContentAll() {
              let list = $("input[name=examData]:checked");
              let checkCnt = 0;
              if (list.length > 0) {
                $("input:checkbox[name=examData]").each(function () {
                  $(this).prop("checked", false);
                });
              } else {
                $("input:checkbox[name=examData]").each(function () {
                  $(this).prop("checked", true);
                  checkCnt++;
                });
              }

              $("#sp_examData").html(checkCnt);
            }

            function checkContent() {
              let checkCnt = 0;
              $("input:checkbox[name=examData]").each(function () {
                if ($(this).prop("checked")) {
                  checkCnt++;
                }
              });
              $("#sp_examData").html(checkCnt);
            }

            function allDownload() {
              if (!checkUserLoggedIn(location.href)) {
                return false;
              }
              let ids = [];
              $("input:checkbox[name=examData]").each(function () {
                if ($(this).prop("checked")) {
                  ids.push($(this).val());
                }
              });
              downloadContents(ids);
            }
          </script>
          <script>
            //즐겨찾는 교과서
            function getBookmark() {
              callAjax("bookmarkListForm", function (data) {
                try {
                  let result = JSON.parse(data);
                  let totalCnt = Number(result["totCnt"]) || 0;
                  let bookmarkList = result["list"] || [];
                  $("#divBookmarkList").empty();
                  if (totalCnt > 0) {
                    bookmarkList.forEach(function (item, index) {
                      let tmpHtml = "";
                      if (item.subjectId > 1135) {
                        tmpHtml =
                          '<a href="javascript:;" onclick="customExamPopup(' +
                          item.subjectId +
                          ');" title="새창 열림" class="button"><i class="icon icon-memo-center"></i>시험지 만들기</a>';
                      }
                      let newHtml = "";
                      if (item.newYN === "Y") {
                        newHtml = "<mark>NEW</mark>";
                      }
                      $("#divBookmarkList").append(
                        '<div class="item">' +
                        '    <div class="item-mark">' +
                        '        <a href="javascript:;" onclick="delBookmark(\'' +
                        item.testbookCode +
                        "', " +
                        item.cateId +
                        ');" class="tooltip-mark add-bookmark"><span class="ir_su">즐겨찾기 삭제</span></a>' +
                        "        " +
                        newHtml +
                        "    </div>" +
                        '    <div class="item-content">' +
                        "        <!-- 썸네일 -->" +
                        '        <div class="item-image">' +
                        '            <figure class="image is-thumnail">' +
                        '                <img src="' +
                        item.cover +
                        '" alt="교과서 이미지" />' +
                        "            </figure>" +
                        "        </div>" +
                        '        <div class="item-info">' +
                        '            <p class="data_title">' +
                        item.title +
                        " (" +
                        item.writer +
                        ")</p>" +
                        '            <div class="data_buttons">' +
                        "                " +
                        tmpHtml +
                        '                <a href="javascript:;" onclick="getExam(' +
                        item.cateId +
                        ');"  title="다운로드" class="button"><i class="icon icon-download"></i>평가자료 다운</a>' +
                        "            </div>" +
                        "        </div>" +
                        "    </div>" +
                        "</div>"
                      );
                    });
                    $(".tb-container.tb-bookmark").show();
                  } else {
                    $(".tb-container.tb-bookmark").hide();
                  }
                } catch (e) {
                  console.log(e);
                }
              });
            }

            //평가자료 팝업
            function getExam(id) {
              if (!checkUserLoggedIn(location.href)) {
                return false;
              }

              $("#examCateId").val(id);
              callAjax("examDataListForm", function (data) {
                try {
                  let result = JSON.parse(data);
                  let examList = [];
                  let totalCnt = Number(result["totCnt"]);

                  if (totalCnt > 0) {
                    examList = result["list"];

                    $("#sp_totalCnt").html(totalCnt);
                    $("#sp_lTitle").html(result["lTitle"]);
                    $("#sp_mTitle").html(result["mTitle"]);
                    $("#sp_sTitle").html(result["sTitle"]);

                    $("#examList").empty();
                    examList.forEach(function (item, index) {
                      $("#examList").append(
                        "<tr>" +
                        "    <td>" +
                        '        <div class="custom-control custom-checkbox no-label">' +
                        '           <input type="checkbox" class="custom-control-input" name="examData" id="check_' +
                        item.id +
                        '" value="' +
                        item.id +
                        '" onclick="checkContent();">' +
                        '           <label class="custom-control-label" for="check_' +
                        item.id +
                        '"></label>' +
                        "        </div>" +
                        "    </td>" +
                        '    <td><span class="point_colum">' +
                        item.type +
                        "</span></td>" +
                        "    <td>" +
                        item.title +
                        "</td>" +
                        "    <td>" +
                        '        <a href="javascript:;" onclick="downloadContents(' +
                        item.id +
                        ')" class="btn btn-gray">' +
                        '            <i class="icon icon-download"></i><span class="name">다운로드</span>' +
                        "        </a>" +
                        "    </td>" +
                        "</tr>"
                      );
                    });

                    $("#subjectPopup").modal("show");
                  } else {
                    alert("등록된 자료가 없습니다.");
                  }
                } catch (e) {
                  console.log(e);
                }
              });
            }

            //즐겨찾기 추가
            function addBookmark(testbookCode, testbankYN, cateId) {
              if (!checkUserLoggedIn(location.href)) {
                return false;
              }

              let data = {
                testbookCode: testbookCode.toString(),
                testbankYN: testbankYN.toString(),
              };

              $.ajax({
                type: "post",
                url: "/pinTestbook/add",
                data: data,
                dataType: "json",
                cache: false,
                async: false,
                success: function (response) {
                  let result = response.success;
                  if (result) {
                    alert("즐겨찾는 교재로\n등록되었습니다.");
                    getBookmark();
                    $("#add_" + cateId).show();
                    $("#del_" + cateId).hide();
                  }
                },
                error: function (request, status, error) {
                  console.error(request, status, error);
                },
              });
            }

            //즐겨찾기 삭제
            function delBookmark(testbookCode, cateId) {
              if (!checkUserLoggedIn(location.href)) {
                return false;
              }

              let data = { testbookCode: testbookCode.toString() };
              $.ajax({
                type: "post",
                url: "/pinTestbook/delete",
                data: data,
                dataType: "json",
                cache: false,
                async: false,
                success: function (response) {
                  let result = response.success;
                  if (result) {
                    alert("즐겨찾는 교재에서\n삭제되었습니다.");
                    getBookmark();
                    $("#add_" + cateId).hide();
                    $("#del_" + cateId).show();
                  }
                },
                error: function (request, status, error) {
                  console.error(request, status, error);
                },
              });
            }

            function customExamPopup(subjectId) {
              if (!checkUserLoggedIn(location.href)) {
                return false;
              }
              //새창으로 열기
              let pop_title = "win_pop";
              let url = "https://testbank.tsherpa.co.kr/customExam/step0";

              window.open(
                "",
                pop_title,
                "width=1400,height=1024,status=no,toolbar=no,scrollbars=no, left=500, top=0"
              );

              //form
              let new_form = $("<form></form>");
              new_form.attr("name", "new_form");
              new_form.attr("charset", "UTF-8");
              new_form.attr("method", "post");
              new_form.attr("action", url);
              new_form.attr("target", pop_title);

              //step0 세팅지 리스트를 위한 교재정보 - 문항통합에서 교재정보 컬럼명 = subjectId
              new_form.append(
                $("<input/>", {
                  type: "hidden",
                  name: "subjectId",
                  value: subjectId,
                })
              );

              new_form.appendTo("body");
              new_form.submit();
            }
          </script>
        </div>

        <!-- ‘T셀파 교수자료 무단 배포 주의사항 안내’ 노출 화면 -->
        <div class="middle-wrapper">
          <div class="caution-box">
            <p class="caution1">
              T셀파 교수자료 무단 배포 주의사항 안내 드립니다.
            </p>
            <p class="caution2">
              소중한 T셀파의 교수자료가 무단 배포 및 유출되지 않도록
              선생님들의 적극적인 협조 부탁드립니다.<br />
              자료 유출로 인한 어려움을 겪지 않도록 선생님들께 간곡한
              부탁드립니다.<br />
              학교에서 연구 목적 또는 수업 시에만 활용해 주세요.
            </p>
            <p class="caution3">
              T셀파의 교수자료의 저작권은 (주)천재교육에 있으며, 당사의 허락
              없이 무단으로 이를 유출하거나<br />
              무단으로 타 사이트에 게재하는 경우 저작권법에 위배됩니다.
              T셀파의 교수자료의 저작권은 (주)천재교육에 있으며, 당사의 허락
              없이 무단으로 이를 유출하거나<br />
              무단으로 타 사이트에 게재하는 경우 저작권법에 위배됩니다.
            </p>
            <a
                    href="https://mh.tsherpa.co.kr/testbank/testbank.html#"
                    class="btn btn-secondary btn-icon"
                    onclick="$('#unitSelect').modal('show')"
            >
                  <span class="name">유출 사례보기</span
                  ><i class="icon icon-arrow-right-white"></i>
            </a>
          </div>
        </div>
        <!--// ‘T셀파 교수자료 무단 배포 주의사항 안내’ 노출 화면 -->
      </div>
    </div>
  </div>
</main>

<!--footer-->
<div class="footer">
  <div class="service_wrap">
    <div class="service_inner">
      <div class="information">
        <p>
              <span class="info">고객센터 1577-7609</span
              ><span>(평일 09:00~17:30)</span>
        </p>
      </div>
      <div class="utility clearfix">
        <div class="util_box">
              <span
              ><a
                      href="https://www.tsherpa.co.kr/center/M-mainservicM.html"
                      target="_blank"
              >이용안내</a
              ></span
              >
          <span
          ><a
                  href="https://www.tsherpa.co.kr/center/M-qna-list.html"
                  target="_blank"
          >자주 묻는 질문</a
          ></span
          >
          <span
          ><a
                  href="https://www.tsherpa.co.kr/center/M-inquiry.html"
                  target="_blank"
          >1:1 문의</a
          ></span
          >
        </div>
        <div class="icon_box">
          <a
                  href="https://pf.kakao.com/_xlxhDrT"
                  target="_blank"
                  class="kakao"
          ></a>
          <a
                  href="https://www.instagram.com/tsherpa_official/"
                  target="_blank"
                  class="instagram"
          ></a>
          <a
                  href="https://www.facebook.com/T%EC%85%80%ED%8C%8C-315305932501668/"
                  target="_blank"
                  class="facebook"
          ></a>
          <a
                  href="https://blog.naver.com/tsherpabyus"
                  target="_blank"
                  class="blog"
          ></a>
        </div>
      </div>
    </div>
  </div>
  <div class="site_wrap clearfix">
    <div class="site_inner">
      <div class="terms_box">
            <span
            ><a href="https://www.chunjae.co.kr/#/main" target="_blank"
            >천재교육</a
            ></span
            >
        <span
        ><a href="https://chunjaetext.co.kr/" target="_blank"
        >천재교과서</a
        ></span
        >
        <span
        ><a
                href="https://www.tsherpa.co.kr/mo_membership/info_policy.html?tab=policy1"
                target="_blank"
        >이용약관</a
        ></span
        >
        <span
        ><a
                class="point"
                href="https://www.tsherpa.co.kr/mo_membership/info_policy.html?tab=policy2"
                target="_blank"
        >개인정보처리방침</a
        ></span
        >
        <span
        ><a
                href="https://www.tsherpa.co.kr/center/M-noticM.html"
                target="_blank"
        >고객센터</a
        ></span
        >
      </div>
      <div class="select_box">
        <select
                class="form-control"
                onchange="if(this.value) window.open(this.value);"
                title="패밀리 사이트 선택"
        >
          <option value="" selected="">패밀리 사이트</option>
          <option value="https://www.chunjae.co.kr/#/main">천재교육</option>
          <option value="http://www.milkt.co.kr/Main/Main_v4">
            밀크티 초등
          </option>
          <option value="http://mid.milkt.co.kr/">밀크티 중학</option>
          <option value="https://hme.chunjae.co.kr/">
            HME 전국 해법수학 학력평가
          </option>
          <option value="https://mall.chunjae.co.kr/">
            천재교육 쇼핑몰
          </option>
        </select>
      </div>
    </div>
  </div>
  <div class="info_wrap clearfix">
    <div class="box">
      <div class="logo">
        <img
                src="/resource/midhigh/img/common/bg-footer-logo-education.png"
                alt="천재교육 로고"
        />
      </div>
      <div class="text">
        <p>대표 : 강희철, 최정민</p>
        <p>주소 : 서울시 금천구 가산로 9길 54</p>
        <p>사업자 등록번호 : 119 - 81 - 19350</p>
        <p>부가통신사업신고번호 : 016712</p>
      </div>
    </div>
    <div class="box">
      <div class="logo">
        <img
                src="/resource/midhigh/img/common/bg-footer-logo-textbook.png"
                alt="천재교과서 로고"
        />
      </div>
      <div class="text">
        <p>대표 : 박정과, 임형진</p>
        <p>주소 : 서울특별시 금천구 가산디지털1로 16, 2011호(가산동)</p>
        <p>사업자 등록번호 : 119 - 81 - 70643</p>
      </div>
    </div>
    <div class="box">
      <div class="logo">
        <img src="/resource/midhigh/img/common/bg-footer-logo-isms.png" alt="isms 로고" />
      </div>
      <div class="text">
        <p>인증범위 - 온라인 교육 및 학습지원 서비스 운영</p>
        <p>인증기간 - 2023년 3월 25일 ~ 2026년 3월 24일</p>
      </div>
      <p class="copy">
        copyright© 2021 by chunjae co.ltd all rights reserved.
      </p>
    </div>
  </div>
</div>
<!--//footer-->

<style>
    .loading {
        position: fixed;
        width: 100%;
        height: 100%;
        left: 0;
        top: 0;
        display: none;
        z-index: 200;
        background: rgba(0, 0, 0, 0.6);
    }
    .loading > img {
        position: absolute;
        left: 50%;
        top: 50%;
        transform: translate(-50%, -50%);
    }
</style>
<div class="loading _loading" id="loading-ani" style="user-select: none">
  <img src="/resource/midhigh/img/etc/loading.gif" alt="로딩중" />
</div>

<div id="recentlyVideoModalDiv"></div>
<div id="modalDiv"></div>
<div id="copyrightModalDiv"></div>
<div id="teachingBoardUploadDiv"></div>
<div id="certModalFooterDiv"></div>
<!-- 공통 인증 modal  -->
<div id="memberChangeModal"></div>
<div id="changeCompletion"></div>

<iframe
        name="hiddenFrame"
        id="hiddenFrame"
        style="
        visibility: hidden;
        position: absolute;
        left: 0;
        top: 0;
        height: 0;
        width: 0;
        border: none;
      "
        src="./saved_resource.html"
></iframe>
<iframe
        name="ssoHiddenFrame"
        id="ssoHiddenFrame"
        style="
        visibility: hidden;
        position: absolute;
        left: 0;
        top: 0;
        height: 0;
        width: 0;
        border: none;
      "
        src="./check_sso.html"
></iframe>

<div
        class="modal fade"
        tabindex="-1"
        role="dialog"
        id="unitSelect"
        aria-modal="true"
>
  <div class="modal-dialog-centered modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <div class="modal-title">교수자료 유출 사례</div>
        <a class="close" data-dismiss="modal" aria-label="Close">
          <img
                  src="/resource/midhigh/img/common/btn-close-big-white.png"
                  alt="닫기버튼"
                  aria-hidden="true"
          />
        </a>
      </div>
      <div class="modal-body evaluation_case">
        <div class="section_case_wrap">
          <p>T셀파의 교수자료는 천재교육의 소중한 자산입니다.</p>
          <p>
            자료 유출로 인한 어려움을 겪지 않도록 선생님들께 부탁 드리며,
            교수자료의 유출사례들을 소개드립니다.
          </p>
        </div>
        <ul class="section_number_wrap">
          <li>
                <span class="num">1</span
                ><span class="d-block sub_title bold"
          >T셀파 정회원으로 선생님들께서 지인분들(학부모, 학원강사)에게
                  유출하시거나 아이디/비밀번호를 공유하여 사용하시는 경우</span
          >
          </li>
          <li>
                <span class="num">2</span
                ><span class="d-block sub_title bold"
          >학생들이 평가지를 학원에 가지고 가서 공유하는 경우</span
          >
          </li>
          <li>
                <span class="num">3</span
                ><span class="d-block sub_title bold"
          >카페, 블로그, 학교 홈페이지 등 인터넷에 무단으로 업로드하는
                  경우</span
          >
          </li>
          <li>
                <span class="num">4</span
                ><span class="d-block sub_title bold"
          >본인이 아닌, 다른 분들에게 아이디/비밀번호를 공유하는
                  경우</span
          >
          </li>
          <li class="info">
                <span
                >* 안전한 개인정보 보호를 위해 주기적으로 비밀번호를
                  변경하시는 것을 권장해 드립니다.</span
                >
          </li>
          <li class="info">
                <span
                >* 공공장소 (PC방, 학교 공용 컴퓨터실) 등에서 사용을 자제하여
                  주십시오.</span
                >
          </li>
        </ul>
        <div class="section_info_wrap">
          <p>
            T셀파의 교수자료의 저작권은 (주)천재교육에 있으므로, 무단으로
            이를 유출하거나 타 사이트에 게재하지 않도록 선생님들의 적극적인
            협조 부탁드립니다.
          </p>
        </div>
      </div>
    </div>
  </div>
</div>

<script>
  let userCurri = "C2";
  let eleCnt = 0;
  let mhCnt = 0;

  $(document).ready(function () {
    eventJoinCheck("mh1");
    eventJoinCheck("mh2");
    eventJoinCheck("mh3");
  });

  function cmdCheck() {
    if (!checkUserLoggedIn()) return false;
    if (!check_day()) return false;
    return true;
  }

  function check_day() {
    let toDay = moment().format("YYYY-MM-DD");
    let endDay = moment("2024-03-13").format("YYYY-MM-DD");

    if (toDay <= endDay) {
      return true;
    } else {
      alert("이벤트 기간이 종료되었습니다. 참여에 감사드립니다.");
      return false;
    }
  }

  function eventJoinCheck(title) {
    if (checkUserLoggedIn()) {
      let data = {
        eventId: "1996756", //이벤트 ID
        title: title, //이벤트 참여 종류
      };

      if (data.eventId) {
        $.ajax({
          type: "post",
          url: "/Event/applyEventCheck.do",
          data: data,
          dataType: "json",
          cache: false,
          async: false,
          success: function (response) {
            let result = response.result;
            if (!result) {
              if (title.indexOf("ele") > -1) {
                eleCnt++;
              }
              if (title.indexOf("mh") > -1) {
                mhCnt++;
              }
            }
          },
          error: function (request, status, error) {
            console.error(request, status, error);
          },
        });
      }
    }
  }

  function clickEvent(title) {
    if (cmdCheck()) {
      let data = {
        eventId: "1996756", //이벤트 ID
        title: title, //이벤트 참여 종류
      };

      if (data.eventId) {
        $.ajax({
          type: "post",
          url: "/Event/applyEventCheck.do",
          data: data,
          dataType: "json",
          cache: false,
          async: false,
          success: function (response) {
            let result = response.result;
            if (result == true) {
              applyEvent(title);
            } else {
              alert("이미 참여하셨습니다.");
              if (userCurri == "" || userCurri == "C1") {
                location.href =
                  "https://ele.tsherpa.co.kr/site/event/index.html?eventId=1996756";
              } else if (userCurri == "C2" || userCurri == "C3") {
                location.href =
                  "https://mh.tsherpa.co.kr/site/event/index.html?eventId=1996756";
              } else {
                location.href =
                  "https://www.tsherpa.co.kr/site/event/1996756/index.html";
              }
            }
          },
          error: function (request, status, error) {
            console.error(request, status, error);
          },
        });
      }
    }
  }

  function applyEvent(title) {
    let data = {
      eventId: "1996756",
      modelId: "event_enter_09",
      tag: "",
      url: "",
      cover: "",
      title: title,
      description: "",
      type: "N", //중복참여 여부(Y:중복참여 가능,N:중복참여 불가능)
      cnt: 0, //선착순 이벤트 참여 가능 인원
    };

    if (data.eventId) {
      $.ajax({
        type: "post",
        url: "/Event/applyEventShorts.do",
        data: data,
        dataType: "json",
        cache: false,
        async: false,
        success: function (response) {
          if (response.message == "응모 되었습니다.") {
            if (userCurri == "" || userCurri == "C1") {
              alert(
                "[신학기 스탬프 미션 이벤트] 스탬프 총 3개 중 " +
                (eleCnt + 1) +
                "개 수집되었습니다."
              );
              location.href =
                "https://ele.tsherpa.co.kr/site/event/index.html?eventId=1996756";
            } else if (userCurri == "C2" || userCurri == "C3") {
              alert(
                "[신학기 스탬프 미션 이벤트] 스탬프 총 3개 중 " +
                (mhCnt + 1) +
                "개 수집되었습니다."
              );
              location.href =
                "https://mh.tsherpa.co.kr/site/event/index.html?eventId=1996756";
            } else {
              location.href =
                "https://www.tsherpa.co.kr/site/event/1996756/index.html";
            }
          } else if (response.message == "이미 응모하셨습니다.") {
            alert("이미 참여하셨습니다.");
          }
        },
        error: function (request, status, error) {
          console.error(request, status, error);
          alert("오류가 발생했습니다.");
        },
      });
    }
  }

  function closePopup(day) {
    if (day) {
      let date = new Date();
      date.setDate(date.getDate());
      let exdate = moment(date).format("YYYY-MM-DD");
      Common.setCookie("testbank_stamp_banner", exdate, day);
      $("#stamp-banner").hide();
    }
  }

  $(document).ready(function () {
    $("#stamp-banner").hide();

    let exdate = Common.getCookie("testbank_stamp_banner") || "";
    let today = new Date().toISOString().substring(0, 10);
    if (!exdate || exdate < today) {
      $("#stamp-banner").show();
    }
  });
</script>

<!-- 240130 스탬프 이벤트 배너 (전 페이지 위치 공통) - body 안에 추가 부탁드립니다 -->
<div
        id="stamp-banner"
        class=""
        style="
        position: absolute;
        top: 40px;
        right: 100px;
        z-index: 1000;
        width: 240px;
        height: 240px;
        display: none;
      "
>
  <a
          href="javascript:void(0);"
          class="close"
          title="닫기"
          aria-label="Close"
          onclick="closePopup(1);"
          style="
          position: absolute;
          right: 0px;
          top: 0;
          width: 70px;
          height: 70px;
          z-index: 10;
        "
  ></a>
  <a
          href="javascript:void(0);"
          onclick="clickEvent('mh1');"
          title="이벤트 응모"
          style="
          position: absolute;
          left: 0;
          top: 0;
          width: 100%;
          height: 100%;
          z-index: 1;
        "
  >
    <img
            src="/resource/midhigh/img/etc/stamp-banner.png"
            alt="스탬프 이미지"
            style="width: 100%; height: 100%"
    />
  </a>
</div>
<!-- // 240130 스탬프 -->

<script
        type="text/javascript"
        id=""
        charset="UTF-8"
        src="/resource/js/kp.js"
></script>
<script type="text/javascript" id="">
  (function (a, e, b, f, g, c, d) {
    a[b] =
      a[b] ||
      function () {
        (a[b].q = a[b].q || []).push(arguments);
      };
    c = e.createElement(f);
    c.async = 1;
    c.src = "https://www.clarity.ms/tag/" + g + "?ref\x3dgtm2";
    d = e.getElementsByTagName(f)[0];
    d.parentNode.insertBefore(c, d);
  })(window, document, "clarity", "script", "cz3xm7bhhr");
</script>
<script type="text/javascript" id="">
  kakaoPixel("3767804930893854870").pageView(
    "\uc911\uace0\ub4f1\ud2f0\uc140\ud30c"
  );
</script>
</body>

</html>
