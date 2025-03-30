  // nav 클릭때마다 배경색 변경 커스텀
  function change_nav(e) {
    var nav = document.querySelectorAll("#custom-nav-item");
    nav.forEach(function (nav, i) {
      if (e.currentTarget == nav) {
        nav.classList.add("visited");
      } else {
        nav.classList.remove("visited");
      }
    });
    console.log(e.currentTarget);
  }
  // 스크롤시 NavBar 불투명도 변경
  $(window).scroll(function() {
    if ($(this).scrollTop() > 10) { /* 스크롤 위치 조건 설정 */
      $('#navTop').css('opacity', '0.7'); /* 스크롤될 때 배경 불투명하게 변경 */
    } else {
      $('#navTop').css('opacity', '1'); /* 스크롤 위치가 조건에 맞지 않을 때 배경 투명하게 유지 */
    }
  });