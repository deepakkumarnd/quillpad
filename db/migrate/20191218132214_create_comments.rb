class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.text :content
      t.string :commented_by
      t.string :commentor_id

      t.timestamps
    end
  end
end
