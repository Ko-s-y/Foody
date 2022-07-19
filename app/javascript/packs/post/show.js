// 選択した画像ファイル名表示機能の関数
$(function() {
  // 画像が選択された時に発火
  $(document).on('change', '.image-form', function () {
    let file = $(this).prop('files')[0];
    $('.state').text(file.name);
  });
});

// 投稿フォーム出現関数
$(function() {
  $(document).on('click', '.form-appear', function() {
    $('.comment-form').css({
      'display': 'block'
    });
    $('.form-appear').css({
      'display': 'none'
    });
  });
});

// 投稿フォーム削除関数
$(function() {
  $(document).on('click', '.form-disappear', function() {
    $('.comment-form').css({
      'display': 'none'
    });
    $('.form-appear').css({
      'display': 'block'
    });
  });
});

// いいねしたユーザー表示関数
$(function() {
  $(document).on('click', '.appear-liked-user', function() {
    $('.appear-liked-user').css({
      'display': 'none'
    });
    $('.disappear-liked-user').css({
      'display': 'block'
    });
    $('.liked-user-list').css({
      'display': 'block'
    });
  });
});

// いいねしたユーザー非表示関数
$(function() {
  $(document).on('click', '.disappear-liked-user', function() {
    $('.disappear-liked-user').css({
      'display': 'none'
    });
    $('.appear-liked-user').css({
      'display': 'block'
    });
    $('.liked-user-list').css({
      'display': 'none'
    });
  });
});

// rememberしたユーザー表示関数
$(function() {
  $(document).on('click', '.appear-checked-remember-user', function() {
    $('.appear-checked-remember-user').css({
      'display': 'none'
    });
    $('.disappear-checked-remember-user').css({
      'display': 'block'
    });
    $('.checked-remember-user-list').css({
      'display': 'block'
    });
  });
});

// rememberしたユーザー非表示関数
$(function() {
  $(document).on('click', '.disappear-checked-remember-user', function() {
    $('.disappear-checked-remember-user').css({
      'display': 'none'
    });
    $('.appear-checked-remember-user').css({
      'display': 'block'
    });
    $('.checked-remember-user-list').css({
      'display': 'none'
    });
  });
});

// formの残文字数カウント関数
$(function() {
  let nowStrCount = $(".form-text").text().replace(/\n/g, "改行").length; //現在のformに入力されている文字数, 改行は2文字扱い(Rails側に合わせる)
  let restStrCount = 200 - nowStrCount; //残りの入力できる文字数

  $(".form-str-counter").text( "残り" + restStrCount + "文字");
  $(".form-text").on("keyup", function() {
    let nowStrCount = $(this).val().replace(/\n/g, "改行").length; //formのvalue文字数を数える
    let restStrCount = 200 - nowStrCount;

    // 色の条件分岐, 残り　0文字以降赤で表示
    if (nowStrCount > 199) {
      $(".form-str-counter").css("color","red");
    } else {
      $(".form-str-counter").css("color","black");
    }
    $(".form-str-counter").text( "残り" + restStrCount + "文字");
  });
});

