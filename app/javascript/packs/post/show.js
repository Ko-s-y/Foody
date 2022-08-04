// 投稿フォーム表示/非表示関数
$(function() {
  $(document).on('click', '.form-appear', function() {
    $('.comment-form').css({
      'display': 'block'
    });
    $('.navbar').css({
      'z-index': '0'
    });
  });
});

$(function() {
  $(document).on('click', '.form-disappear', function() {
    $('.comment-form').css({
      'display': 'none'
    });
    $('.navbar').css({
      'z-index': '1'
    });
  });
});
