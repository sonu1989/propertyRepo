class AddAvatarUsers < ActiveRecord::Migration
  def change
    add_attachment :users, :avatar, :string
  end
end
