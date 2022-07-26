// 選択した画像ファイル名表示とプレビュー機能の関数
$(function() {
  // 画像が選択された時に発火
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
