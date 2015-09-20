module TracksHelper
  include ERB::Util

  def ugly_lyrics(lyrics)
    lyrics = lyrics.split("\r\n")
    html = ""
    lyrics.each do |lyric|
      html += "#{lyric}"
      if rand(11) > 7
        html += "&nbsp; &nbsp; &#9835"
      end
      html += "<br>"
    end
    html.html_safe
  end

end
