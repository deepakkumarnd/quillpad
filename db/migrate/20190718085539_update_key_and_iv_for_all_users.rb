class UpdateKeyAndIvForAllUsers < ActiveRecord::Migration[5.1]
  def change
    User.all.each do |user|
      user.set_enc_key_and_iv
      user.save
    end
  end
end
