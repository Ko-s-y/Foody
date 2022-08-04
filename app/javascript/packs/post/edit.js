// 選択した画像ファイル名表示とプレビュー機能の関数
$(function() {
  $(document).on('change', '.image-form', function() {
    // 選択した画像ファイル名表示機能
    let fileName = $(this).prop('files')[0];
    $('.state').text(fileName.name);

    // 選択した画像ファイルのプレビュー機能
    let file = this.files[0];  // .file_filedからデータを取得して変数fileに代入
    let reader = new FileReader();  // FileReaderオブジェクトを作成
    reader.readAsDataURL(file);  // DataURIScheme文字列を取得
    reader.onload = function() {  // 読み込みが完了したら処理が実行
      let image = this.result;  // 読み込んだファイルの内容を取得して変数imageに
      if ($('.current-post-image').length == 0) {  // 投稿に画像がなければ
        $('.not-have-post-image').css({  // not-have-post-imageのスペース確保
          'display': 'block' // defaultがnoneの為
        });
        $('.not-have-post-image').attr({ src: image });
        } else {
        $('.current-post-image').attr({ src: image });  // 投稿の画像がプレビューされていれば(持っていれば)画像データのみを入れ替え
      }
    }
  });
});
