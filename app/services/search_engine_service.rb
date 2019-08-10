class SearchEngineService
  # Search engine searches posts in any user scope. The search is not on all the posts.

  def self.search(user, query, signed_in = false, page = 1, options = {})
    new(user,
      query,
      signed_in,
      page,
      options).perform()
  end

  def initialize(user, query, signed_in, page, options = {})
    raise InvalidSearchError if user.blank?

    @user  = user
    @query = query.to_s.strip
    @page  = page
    @user_signed_in = signed_in
    @options = options
  end

  def perform
    cursor = @user
      .posts
      .order('id DESC')
      .page(@page)

    if @query.present?
      cursor = cursor.search_for(@query)
    end

    if @options.has_key?(:kind) && Post::KINDS.include?(@options[:kind])
      cursor = cursor.where(kind: @options[:kind])
    end

    if !@user_signed_in
      cursor = cursor.published
    end

    cursor
  end
end