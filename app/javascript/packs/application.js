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

// PC専用検索フォーム表示/非表示関数
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

// タブレット,スマホ専用検索フォーム表示/非表示関数
$(function() {
  $(document).on('click', '.tab-sp-search-icon', function() {
    $('.tab-sp-search').css({
      'display': 'block'
    });
    $('.footer-menu-section').css({
      'z-index': '2'
    });
    $(".tab-sp-search-icon").addClass('search-form-opening')
    $('.tab-sp-search-section').css({
      'z-index': '3'
    });
  });
});

$(function() {
  $(document).on('click', '.search-form-opening', function() {
    $('.tab-sp-search').css({
      'display': 'none'
    });
    $('.footer-menu-section').css({
      'z-index': '0'
    });
    $(".tab-sp-search-icon").removeClass('search-form-opening')
    $('.tab-sp-search-section').css({
      'z-index': '0'
    });
  });
});

$(function() {
  $(document).on('click', '.close-tab-sp-search-btn', function() {
    $('.tab-sp-search').css({
      'display': 'none'
    });
    $('.footer-menu-section').css({
      'z-index': '0'
    });
    $(".tab-sp-search-icon").removeClass('search-form-opening')
    $('.tab-sp-search-section').css({
      'z-index': '0'
    });
  });
});

// ・・・メニューの表示/非表示関数
$(function() {
  $(document).on('click', '.appear-menu-btn', function() {
    $(".post-menu").slideToggle(200);
    $(".appear-menu-btn").css({
      'color': '#3273dc'
    });
    $(".appear-menu-btn").addClass('open')
  });
});

$(function() {
  $(document).on('click', '.open', function() {
    $(".appear-menu-btn").css({
      'color': 'black'
    });
    $(".appear-menu-btn").removeClass('open')
  });
});

// usersページのアクティビティ表示/非表示関数
$(function() {
  $(document).on('click', '.appear-user-data', function() {
    $(".user-data").slideToggle(300);
    let text = $(this).text();
    if (text === "アクティビティの確認") {
        $(this).text("アクティビティを閉じる");
    } else {
      $(this).text("アクティビティの確認");
    }
  });
});

// password表示/非表示関数
document.addEventListener('turbolinks:load', () => {
  let pass_display = document.getElementById("pass-display");
  let user_pass = document.getElementById("user_password");
  $(pass_display).on("click", function() {
    if( user_pass.type === 'password' ) {
      user_pass.type = 'text';
      pass_display.innerHTML = '<i class="far fa-eye-slash"></i>';
    } else {
      user_pass.type = 'password';
      pass_display.innerHTML = '<i class="far fa-eye"></i>';
    }
  });
});

// password_confirmの表示/非表示関数
document.addEventListener('turbolinks:load', () => {
  let confirm_display = document.getElementById("confirm-display");
  let pass_confirm = document.getElementById("user_password_confirmation");
  $(confirm_display).on("click", function() {
    if( pass_confirm.type === 'password' ) {
      pass_confirm.type = 'text';
      confirm_display.innerHTML = '<i class="far fa-eye-slash"></i>';
    } else {
      pass_confirm.type = 'password';
      confirm_display.innerHTML = '<i class="far fa-eye"></i>';
    }
  });
});

// current_passwordの表示/非表示関数
document.addEventListener('turbolinks:load', () => {
  let current_display = document.getElementById("current-display");
  let current_pass = document.getElementById("user_current_password");
  $(current_display).on("click", function() {
    if( current_pass.type === 'password' ) {
      current_pass.type = 'text';
      current_display.innerHTML = '<i class="far fa-eye-slash"></i>';
    } else {
      current_pass.type = 'password';
      current_display.innerHTML = '<i class="far fa-eye"></i>';
    }
  });
});

// password状態表示関数
$(function() {
  let user_pass = document.getElementById("user_password");
  let pass_confirm = document.getElementById("user_password_confirmation");
  let pass_status = document.getElementById("pass-status");

  if (user_pass.innerHTML == pass_confirm.innerHTML) {
    pass_status.textContent = "○"
  } else {
    pass_status.textContent = "パスワードが一致していません"
  }
});
