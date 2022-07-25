// likeしたユーザー表示関数
$(function() {
  $(document).on('click', '.appear-liked-user', function() {
    $('.remember-users').css({
      'display': 'none'
    });
    $('.like-users').css({
      'display': 'block'
    });
    $('.appear-checked-remember-user').css({
      'background-color': 'white'
    });
    $('.appear-liked-user').css({
      'background-color': 'whitesmoke'
    });
  });
});

// rememberしたユーザー表示関数
$(function() {
  $(document).on('click', '.appear-checked-remember-user', function() {
    $('.like-users').css({
      'display': 'none'
    });
    $('.remember-users').css({
      'display': 'block'
    });
    $('.appear-liked-user').css({
      'background-color': 'white'
    });
    $('.appear-checked-remember-user').css({
      'background-color': 'whitesmoke'
    });
  });
});
