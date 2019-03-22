class SearchEngineService

  def initialize(user, query, page = 1)
    @user = user
    @query = query.to_s.strip
    @page = page
  end

  def perform
    cursor = Post.order('id DESC').page(@page)

    if @user.blank?
      cursor = cursor.published
    end


    if @query.present?
      cursor = cursor.search_for(@query)
    end

    cursor
  end
end