class RemoveAboutFromUser < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :about
  end
end
