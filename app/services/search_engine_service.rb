class SearchEngineService

  def initialize(user, query)
    @user = user
    @query = query.to_s.strip
  end

  def perform
    cursor = Post.order('id DESC')

    if @user.blank?
      cursor = cursor.published
    end


    if @query.present?
      cursor = cursor.search_for(@query)
    end

    cursor
  end
end