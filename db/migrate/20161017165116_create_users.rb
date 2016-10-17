class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.integer :uid
      t.string :provider
      t.string :info
      t.string :email

      t.timestamps null: false
    end
  end
end
