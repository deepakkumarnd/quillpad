module PostsHelper
  def render_markdown(content)
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, tables: true)
    markdown.render(content).html_safe
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
