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
