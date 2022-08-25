require 'rails_helper'

RSpec.describe "Follows", type: :system, js: true do
  before do
    @passive_follow_user = FactoryBot.create(:user)
    @active_follow_user = FactoryBot.create(:user)
  end

  describe 'userフォロー機能について' do
    before do
      login_as(@passive_follow_user)
      visit users_profile_path(@active_follow_user.name) # user名がパスに必要な為
    end

    it 'ユーザーをフォロー、フォロー解除できる事' do
      find('#follow-btn').click
      expect(page).to have_content 'フォロー中'
      expect(@active_follow_user.followed.count).to eq(1)
      expect(@passive_follow_user.follower.count).to eq(1)

      find('#unfollow-btn').click
      sleep 1
      expect(page.driver.browser.switch_to.alert.accept)
      expect(@passive_follow_user.followed.count).to eq(0)
      expect(@active_follow_user.follower.count).to eq(0)
    end
  end
end
