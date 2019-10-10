module ApplicationHelper
	def auth_token
		"<input type=\"hidden\"
		name=\"authenticity_token\"
		value=\"#{form_authenticity_token}\"/
		>".html_safe
	end

	def ugly_lyrics(lyrics)
		split_lyrics = lyrics.split("\n")
		beautified = ""
		split_lyrics.each do |line|
			beautified << "&#9835 "
			beautified << "#{h(line)}\n"
		end
		"<pre>#{beautified}</pre>".html_safe
	end
end
