module ReportsHelper
	def sunglasses
		if @report.daytime?
			if @report.sunny?
				"<h1>Yes!</h1>
				<p>The weather for #{@report.response.location['city']}, #{@report.response.location['region']} is forecast to be #{@report.forecast['text'].downcase}.</p>".html_safe
			else
				"<h1>No!</h1>
				<p>The weather for #{@report.response.location['city']}, #{@report.response.location['region']} is forecast to be #{@report.forecast['text'].downcase}.</p>".html_safe
			end
		else
			"<h1>No, it's nighttime!</h1>
			<iframe width=420 height=315 src='http://www.youtube.com/embed/XAsq6-jtVD8?autoplay=1' frameborder='0' allowfullscreen></iframe>".html_safe
		end
	end
end
