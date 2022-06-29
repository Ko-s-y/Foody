// 選択した画像ファイル名表示機能の関数
$(function () {
  // 画像が選択された時に発火
  $(document).on('change', '.image-form', function () {
    let file = $(this).prop('files')[0];
    $('.state').text(file.name);
  });
});
