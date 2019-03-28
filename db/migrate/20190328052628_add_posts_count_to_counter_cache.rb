class AddPostsCountToCounterCache < ActiveRecord::Migration[5.1]
  def change
    user  = User.last
    ActiveRecord::Base.connection.execute("UPDATE users SET posts_count = #{user.posts.count} WHERE id = #{user.id}")
  end
end
