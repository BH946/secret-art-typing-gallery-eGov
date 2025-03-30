// bgm 관련 처리.. -> localStorage 활용: 재생 중인 오디오의 현재 시간 기록용(리다이렉트 때 사용위함)

// 페이지 로딩시 -> 저장된 오디오 상태 사용
window.addEventListener('load', function() {
  var savedTime = parseFloat(localStorage.getItem('currentTime'));
  var savedState = localStorage.getItem('state');
  var redirectState = localStorage.getItem('redirectState');

  if(redirectState!==null && redirectState==='true') {
    localStorage.setItem('redirectState', false); // 상태초기화
  }
  else {
    savedTime = 0
    savedState = "false"
    localStorage.setItem('currentTime', savedTime); // 시간초기화
    localStorage.setItem('state', false); // saved 상태초기화
  }

  // 저장된 오디오 상태 활용
  if(savedState!==null) {
    console.log("test");
    var audio = document.getElementById('bgm');

    var isState = savedState.indexOf("true") !== -1;
    if(isState) {
      // bgm ON
      console.log("bgmON");
      audio.muted=false; // (음소거)기본값 false
      $('.speakerImg').attr('src', '/images/cmmn/speaker.svg');

        if (!isNaN(savedTime)) {
        // 저장된 시간으로 오디오를 설정하고 재생합니다.
        audio.currentTime = savedTime;
        console.log(savedTime);
      }
      audio.play();
    }
    else{
      // bgm OFF
      console.log("bgmOFF");
      audio.muted=true;
      $('.speakerImg').attr('src', '/images/cmmn/speakerNo.svg');
      audio.pause();
    }
  }
});

// 스피커 버튼 눌렀을 때 이벤트함수
function speakerClick() {
  var audio = document.getElementById('bgm');

  var src = $('.speakerImg').attr('src');
  var isFound = src.indexOf("speakerNo") !== -1; // "speakerNo"가 포함되어 있는지 확인
  var state = false;

  if(isFound) {
    // bgm ON
    state=true;
    audio.muted=false; // (음소거)기본값 false
    $('.speakerImg').attr('src', '/images/cmmn/speaker.svg');
    audio.play();
  }
  else {
    // bgm OFF
    state=false;
    audio.muted=true;
    $('.speakerImg').attr('src', '/images/cmmn/speakerNo.svg');
    audio.pause();
  }
  localStorage.setItem('state', state);
}

// 페이지 리디렉션을 처리하기 위한 함수 -> bgm 시간상태 기록위해
function redirectSavedBgm() {
  // 현재 오디오 상태를 가져옵니다.
  var audio = document.getElementById('bgm');
  var currentTime = audio.currentTime; // 기본값 0초

  // 현재 재생 중인 오디오의 현재 시간을 localStorage에 저장합니다.
  localStorage.setItem('currentTime', currentTime);
  localStorage.setItem('redirectState', true); // redirect 한건지 유무
  // 이후 리다이렉션을 진행하게 됨!
  console.log(currentTime);
}

// 전역 스코프에 함수 노출
window.speakerClick = speakerClick;
window.redirectSavedBgm = redirectSavedBgm;
