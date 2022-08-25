require 'rails_helper'

RSpec.describe "Remembers", type: :system, js: true do
  before do
    @me = FactoryBot.create(:user)
    @other_user = FactoryBot.create(:user)
    @my_post = FactoryBot.create(:post, user_id: @me.id)
    @other_user_post = FactoryBot.create(:post, user_id: @other_user.id)
  end

  describe '投稿に対するブックマーク機能について' do
    before do
      login_as(@me)
    end

    it '自分の投稿をブックマーク、ブックマーク解除できる事' do
      visit post_path(@my_post.id)
      find('#remember-btn').click
      expect(page).to have_selector '#unremember-btn'
      expect(@my_post.remembers.count).to eq(1)

      find('#unremember-btn').click
      sleep 1
      expect(page.driver.browser.switch_to.alert.accept)
      expect(page).to have_selector '#remember-btn'
      expect(@my_post.remembers.count).to eq(0)
    end

    it '他人の投稿をブックマーク、ブックマーク解除できる事' do
      visit post_path(@other_user_post.id)
      find('#remember-btn').click
      expect(page).to have_selector '#unremember-btn'
      expect(@other_user_post.remembers.count).to eq(1)

      find('#unremember-btn').click
      sleep 1
      expect(page.driver.browser.switch_to.alert.accept)
      expect(page).to have_selector '#remember-btn'
      expect(@other_user_post.remembers.count).to eq(0)
    end

    it '自分の投稿をブックマークするとマイページにその投稿が表示されている事' do
      visit post_path(@my_post.id)
      find('#remember-btn').click

      visit users_show_path
      find('#remember-post-list').click
      expect(page).to have_content @my_post.title
      expect(page).to have_content @my_post.post_content
    end

    it '他人の投稿をブックマークするとマイページにその投稿が表示されている事' do
      visit post_path(@other_user_post.id)
      find('#remember-btn').click

      visit users_show_path
      find('#remember-post-list').click
      expect(page).to have_content @other_user_post.title
      expect(page).to have_content @other_user_post.post_content
    end
  end
end
