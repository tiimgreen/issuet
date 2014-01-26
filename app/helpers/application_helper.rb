module ApplicationHelper
  def to_markdown(content)
    markdown = Redcarpet::Markdown.new(
      Redcarpet::Render::HTML.new(filter_html: true),
      no_intra_emphasis: true,
      tables: true,
      strikethrough: true,
      space_after_headers: true)
    markdown.render(content).html_safe
  end
end
