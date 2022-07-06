// 他のuserの活動実績表示関数
$(function() {
  $(document).on('click', '.appear-user-data', function() {
    $('.appear-user-data').css({
      'display': 'none'
    });
    $('.disappear-user-data').css({
      'display': 'block'
    });
    $('.user-data').css({
      'display': 'block'
    });
  });
});

// 他のuserの活動実績の非表示関数
$(function() {
  $(document).on('click', '.disappear-user-data', function() {
    $('.disappear-user-data').css({
      'display': 'none'
    });
    $('.appear-user-data').css({
      'display': 'block'
    });
    $('.user-data').css({
      'display': 'none'
    });
  });
});
