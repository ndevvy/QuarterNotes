module TracksHelper
  include ERB::Util

  def ugly_lyrics(lyrics)
    lyrics = lyrics.split("\r\n")
    html = ""
    lyrics.each do |lyric|
      html += "&#9835 #{lyric} <br>"
    end
    html.html_safe
  end

end
