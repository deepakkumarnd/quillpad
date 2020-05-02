class CreateSocialMedia < ActiveRecord::Migration[6.0]
  def change
    create_table :social_media do |t|
      t.string :name
      t.string :link
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
