class AssociateUsersToPosts < ActiveRecord::Migration[5.1]
  def change
    # TODO: This migration is written to do data changes and is not likely to be used in future.
    return

    user_id = User.last&.id
    Post.update_all(user_id: user_id) if user_id.present?
  end
end
