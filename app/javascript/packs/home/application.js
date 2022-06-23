$(function () {

  let slideCurrent = 0; // スライド現在値, 1枚目のスライド番号
  let lastCurrent = $('.slide-list').length - 1; // スライドの合計数＝最後のスライド番号

  $('.slide-list').css('display', 'none'); // 先にすべてのスライドを非表示
  $('.slide-list').eq(slideCurrent).css('display', 'block'); // 最初のスライドを表示

  // スライドの切り替わりをchangeSlideとして定義
  function changeSlide() {
    $('.slide-list').fadeOut(1000); // 現在のスライドをフェードアウト
    $('.slide-list').eq(slideCurrent).fadeIn(3000); // 次のスライドをフェードイン
    // current-imgクラス切り替え処理
    let pagiNation = slideCurrent + 1;
    $('.target-square').removeClass('current-img');
    $(".target-square:nth-of-type(" + pagiNation + ")").addClass('current-img');
  };

  // 一定時間毎に処理実行するstartTimerを定義
  function startTimer() {
    Timer = setInterval(function () {
      if (slideCurrent === lastCurrent) { // 現在のスライドが最終スライドの場合
        slideCurrent = 0;
        changeSlide(); // スライド初期値の値を代入して関数実行（初めのスライドに戻す）
      } else {
        slideCurrent++;
        changeSlide(); // そうでなければスライド番号を増やして次のスライドに切り替え
      };
    }, 4000); // 実行スパン, 4秒
  }

  // startTimer関数を止めるstopTimerを定義
  function stopTimer() {
    clearInterval(Timer); // setIntervalで設定したタイマーの取り消し
  }

  // slide-leftボタン押下時
  $('.js-slide-back').on('click', function () {
    stopTimer();
    startTimer(); // ページ送り後の時間間隔ズレ防止
    if (slideCurrent === 0) { // 現在のスライドが最初のスライドの場合
      slideCurrent = lastCurrent;
      changeSlide(); // 最終スライド番号を代入して関数実行（最後のスライドに移動）
    } else {
      slideCurrent--;
      changeSlide(); // 前のスライドに切り替えてchangeSlide()
    };
  });

  // slide-rightボタン押下時
  $('.js-slide-next').on('click', function () {
    stopTimer();
    startTimer(); // ページ送り後の時間間隔ズレ防止
    if (slideCurrent === lastCurrent) { // 現在のスライドが最後のスライドの場合
      slideCurrent = 0;
      changeSlide(); // スライド初期値の値を代入して関数実行（初めのスライドに戻す）
    } else {
      slideCurrent++;
      changeSlide(); // 次ののスライドに切り替えてchangeSlide()
    };
  });

// // 連続でhomeへのリンクを押すとタイマーが多重動作してslide-imageの表示が狂うため
//   $(document).ready(function() {
//     if (window.name != "reloaded") {
//       location.reload();
//       window.name = "reloaded";
//     } else {
//       window.name = "";
//     }
//   });

  startTimer();
});
