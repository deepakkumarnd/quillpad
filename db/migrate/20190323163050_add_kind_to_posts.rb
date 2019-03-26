class AddKindToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :kind, :string, default: 'default'
  end
end
