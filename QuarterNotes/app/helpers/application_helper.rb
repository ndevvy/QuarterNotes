module ApplicationHelper
include ERB::Util

  def auth_token
    "<input type='hidden' name='authenticity_token' value='<%= form_authenticity_token %>'".html_safe
  end


  def ugly_lyrics(lyrics)
    lyrics = lyrics.split("\r\n")
    html = ""
    lyrics.each do |lyric|
      html += "&#9835 #{lyric} <br>"
    end
    html.html_safe
  end

end
#
#
# <input type="hidden"
#        name="authenticity_token"
#        value="<%= form_authenticity_token %>">
