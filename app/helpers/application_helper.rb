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

  def full_title(page_title)
    page_title.empty? ? 'Issuet' : page_title
  end
end
