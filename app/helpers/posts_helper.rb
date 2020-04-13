module PostsHelper
  def render_markdown(content)
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, tables: true)
    markdown.render(content).html_safe
  end

  def render_bookmark(post)
    raise InvalidContentError('Not a bookmark') unless post.bookmark?
    str = %q[<a target="_blank" href="%{url}">
      <div class="d-flex w-100 justify-content-between">
        <h5 class="mb-1">%{title}</h5>
      </div>
    </a>] % {
      url: post.content,
      title: (post.title.empty? ? 'Untitled Bookmark': post.title)
    }

    str.html_safe
  end

  def partial_for(post)
    if post.secure?
      'secure_form'
    elsif post.bookmark?
      'bookmark_form'
    else
      'form'
    end
  end
end
