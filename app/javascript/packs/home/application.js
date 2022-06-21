$(function () {
  let slideCurrent = 0; // スライド現在値, 1枚目のスライド番号
  let lastCurrent = $('.slide-list').length - 1; // スライドの合計数＝最後のスライド番号
  $('.slide-list').css('display', 'none'); // 先にすべてのスライドを非表示
  $('.slide-list').eq(slideCurrent).css('display', 'block'); // 最初のスライドを表示
  // スライドの切り替わりをchangeslideとして定義
  function changeslide() {
    $('.slide-list').fadeOut(1000); // 現在のスライドをフェードアウト
    $('.slide-list').eq(slideCurrent).fadeIn(1500); // 次のスライドを表示
  };
  let Timer;
  // 一定時間毎に処理実行するstartTimerを定義
  function startTimer() {
    Timer = setInterval(function () {
      if (slideCurrent === lastCurrent) { // 現在のスライドが最終スライドの場合
        slideCurrent = 0;
        changeslide(); // スライド初期値の値を代入して関数実行（初めのスライドに戻す）
      } else {
        slideCurrent++;
        changeslide(); // そうでなければスライド番号を増やして次のスライドに切り替え
      };
    }, 3000); // 実行スパン
  }
  // startTimer関数を止めるstopTimerを定義
  function stopTimer() {
    clearInterval(Timer); // setIntervalで設定したタイマーの取り消し
  }
  startTimer();
});
