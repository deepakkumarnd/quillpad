class SearchEngineService

  class InvalidSearchError; end

  def initialize(user, query, page = 1)
    @user = user
    @query = query.to_s.strip
    @page = page
  end

  def perform(user_signed_in = false)
    cursor = @user.posts.order('id DESC').page(@page)

    raise InvalidSearchError if @user.blank?

    cursor = cursor.published if !user_signed_in

    if @query.present?
      cursor = cursor.search_for(@query)
    end

    cursor
  end
end