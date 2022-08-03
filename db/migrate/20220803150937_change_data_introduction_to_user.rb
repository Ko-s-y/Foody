class ChangeDataIntroductionToUser < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :introduction, :string
  end
end
