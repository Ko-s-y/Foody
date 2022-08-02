class AddTitleToContact < ActiveRecord::Migration[6.1]
  def change
    add_column :contacts, :title, :string
  end
end
