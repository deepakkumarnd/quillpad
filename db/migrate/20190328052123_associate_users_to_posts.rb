class AssociateUsersToPosts < ActiveRecord::Migration[5.1]
  def change
    user_id = User.last.id
    Post.update_all(user_id: user_id)
  end
end
