// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

// バーガーメニュー　
$(function() {
  $(document).on('click', '.navbar-burger', function() {
    $('.navbar-burger').toggleClass('is-active');
    $('.navbar-menu').toggleClass('is-active');
  });
});

// 検索フォーム出現関数
$(function() {
  $(document).on('click', '.search-icon', function() {
    $('.search-form-appear').css({
      'display': 'none'
    });
    $('.search-form-disappear').css({
      'display': 'block'
    });
    $('.search-form').css({
      'display': 'block'
    });
  });
});

// 検索フォーム削除関数
$(function() {
  $(document).on('click', '.dis-search-icon', function() {
    $('.search-form-disappear').css({
      'display': 'none'
    });
    $('.search-form').css({
      'display': 'none'
    });
    $('.search-form-appear').css({
      'display': 'block'
    });
  });
});
