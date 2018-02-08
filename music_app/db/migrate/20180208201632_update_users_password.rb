class UpdateUsersPassword < ActiveRecord::Migration[5.1]
  def change
    rename_column :users, :psssword_digest, :password_digest
  end
end
