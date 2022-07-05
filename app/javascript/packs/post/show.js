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

