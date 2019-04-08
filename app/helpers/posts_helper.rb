module PostsHelper

  def show_content(post)
    html_code = post.body
    html_code.gsub!(/\*\*(?<text>.*)\*\*/, '<b>\k<text></b>')
    html_code.gsub!(/\\\\(?<text>.*)\\\\/, '<i>\k<text></i>')
    html_code.gsub!(/\(\((?<link>.*) (?<name>.*)\)\)/, '<a href="/\k<link>">\k<name></a>') 

    return html_code.html_safe
  end

end
