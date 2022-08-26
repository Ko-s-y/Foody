module LoginSupport
  def login_as(user)
    visit root_path
    find('#to-login-path').click
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    click_button 'ログイン'
    expect(page).to have_content 'ログインしました。'
  end

  RSpec.configure do |config|
    config.include LoginSupport
  end
end
