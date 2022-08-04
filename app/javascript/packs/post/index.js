// 選択した画像ファイル名表示とプレビュー機能の関数
$(function() {
  $(document).on('change', '.image-form', function() {
    // 選択した画像ファイル名表示機能
    let fileName = $(this).prop('files')[0];
    $('.state').text(fileName.name);

    // 選択した画像ファイルのプレビュー機能
    let file = this.files[0];  // .file_filedからデータを取得して変数fileに
    let reader = new FileReader();  // FileReaderオブジェクトを作成し変数readerに
    reader.readAsDataURL(file);  // DataURIScheme文字列を取得
    reader.onload = function() {
      let image = this.result;  // 読み込んだファイルの内容を取得して変数imageに
      if ($('.current-post-image').length == 0) {  // 投稿に画像がなければ
        $('.not-have-post-image').css({  // not-have-post-imageの表示領域確保
          'display': 'block'
        });
        $('.not-have-post-image').attr({ src: image });
        } else {
        $('.current-post-image').attr({ src: image });  // postが画像を持っていれば画像データのみを入れ替え
      }
    }
  });
});

// 投稿フォーム表示/非表示関数
$(function() {
  $(document).on('click', '.post-form-appear', function() {
    $('.post-form').css({
      'display': 'block'
    });
    $('.navbar').css({
      'z-index': '0'
    });
  });
});

$(function() {
  $(document).on('click', '.post-form-disappear', function() {
    $('.post-form').css({
      'display': 'none'
    });
    $('.navbar').css({
      'z-index': '1'
    });
  });
});

// フォームの残文字数カウント関数
$(function() {
  let nowStrCount = $(".form-text").text().replace(/\n/g, "改行").length; //現在入力されている文字数, 改行は2文字扱い(Rails側に合わせて)
  let restStrCount = 200 - nowStrCount; //残りの入力可能文字数

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
