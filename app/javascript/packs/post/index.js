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
  $(document).on('click', '.post-form-appear', function() {
    $('.post-form').css({
      'display': 'block'
    });
    $('.post-form-appear').css({
      'display': 'none'
    });
  });
});

// 投稿フォーム削除関数
$(function() {
  $(document).on('click', '.post-form-disappear', function() {
    $('.post-form').css({
      'display': 'none'
    });
    $('.post-form-appear').css({
      'display': 'block'
    });
  });
});
