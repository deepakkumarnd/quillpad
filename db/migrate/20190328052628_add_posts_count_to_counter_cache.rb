class AddPostsCountToCounterCache < ActiveRecord::Migration[5.1]
  def change
    # TODO: This migration is written to do data changes and is not likely to be used in future.
    return

    user  = User.last
    if user.present?
      ActiveRecord::Base.connection.execute("UPDATE users SET posts_count = #{user.posts.count} WHERE id = #{user.id}")
    end
  end
end
