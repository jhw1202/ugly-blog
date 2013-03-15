class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |user|
      user.string :first_name
      user.string :last_name
      user.string :email
      user.string :hashed_password
      user.timestamps
    end
  end
end
