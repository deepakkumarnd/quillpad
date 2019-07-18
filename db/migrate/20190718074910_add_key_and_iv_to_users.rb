class AddKeyAndIvToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :enc_key, :string
    add_column :users, :enc_iv, :string
  end
end
