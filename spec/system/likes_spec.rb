require 'rails_helper'

RSpec.describe "Likes", type: :system, js: true do
  before do
    @active_like_user = FactoryBot.create(:user)
    @passive_like_user = FactoryBot.create(:user)
    @post = FactoryBot.create(:post, user_id: @passive_like_user.id)
  end

  describe '投稿に対する良いね機能について' do
    before do
      login_as(@active_like_user)
      visit post_path(@post.id)
    end

    it '投稿を良いね、良いね解除できる事' do
      find('#like-btn').click
      expect(page).to have_selector '#unlike-btn'
      expect(@post.likes.count).to eq(1)

      find('#unlike-btn').click
      expect(page).to have_selector '#like-btn'
      expect(@post.likes.count).to eq(0)
    end
  end
end
