require 'rails_helper'

RSpec.describe "Likes", type: :system, js: true do
  before do
    @me = FactoryBot.create(:user)
    @other_user = FactoryBot.create(:user)
    @my_post = FactoryBot.create(:post, user_id: @me.id)
    @other_user_post = FactoryBot.create(:post, user_id: @other_user.id)
  end

  describe '投稿に対する良いね機能について' do
    before do
      login_as(@me)
    end

    it '自分の投稿を良いね、良いね解除できる事' do
      visit post_path(@my_post.id)
      find('#like-btn').click
      expect(page).to have_selector '#unlike-btn'
      expect(@my_post.likes.count).to eq(1)

      find('#unlike-btn').click
      expect(page).to have_selector '#like-btn'
      expect(@my_post.likes.count).to eq(0)
    end

    it '他人の投稿を良いね、良いね解除できる事' do
      visit post_path(@other_user_post.id)
      find('#like-btn').click
      expect(page).to have_selector '#unlike-btn'
      expect(@other_user_post.likes.count).to eq(1)

      find('#unlike-btn').click
      expect(page).to have_selector '#like-btn'
      expect(@other_user_post.likes.count).to eq(0)
    end
  end
end
