
// フォームの残文字数カウント関数
$(function() {
  let nowStrCount = $(".form-text").text().replace(/\n/g, "改行").length; //現在のformに入力されている文字数, 改行は2文字扱い(Rails側に合わせる)
  let restStrCount = 300 - nowStrCount; //残りの入力できる文字数

  $(".form-str-counter").text( "残り" + restStrCount + "文字");
  $(".form-text").on("keyup", function() {
    let nowStrCount = $(this).val().replace(/\n/g, "改行").length; //formのvalue文字数を数える
    let restStrCount = 300 - nowStrCount;

    // 色の条件分岐, 残り　0文字以降赤で表示
    if (nowStrCount > 299) {
      $(".form-str-counter").css("color","red");
    } else {
      $(".form-str-counter").css("color","black");
    }
    $(".form-str-counter").text( "残り" + restStrCount + "文字");
  });
});
