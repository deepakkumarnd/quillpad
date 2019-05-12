class SearchEngineService
  # Search engine searches posts in any user scope. The search is not on all the posts.

  def self.search(user, query, signed_in = false, page = 1)
    new(user, query, signed_in, page).perform()
  end

  def initialize(user, query, signed_in, page)
    raise InvalidSearchError if user.blank?

    @user  = user
    @query = query.to_s.strip
    @page  = page
    @user_signed_in = signed_in
  end

  def perform
    cursor = @user
      .posts
      .order('id DESC')
      .page(@page)

    cursor = @query.blank? ? cursor : cursor.search_for(@query)
    @user_signed_in ? cursor : cursor.published
  end
end