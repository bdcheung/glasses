module ReportsHelper
	def sunglasses
		if @report.daytime?
			if @report.sunny?
				"<h1>Yes!</h1>
				<p>The weather for <%= @report.response.location['city']  %>, <%= @report.response.location['region']  %> is forecast to be <%= @report.forecast['text'].downcase %></p>".html_safe
			else
				"<h1>No!</h1>
				<p>The weather for <%= @report.response.location['city']  %>, <%= @report.response.location['region']  %> is forecast to be <%= @report.forecast['text'].downcase %></p>".html_safe
			end
		else
			"<h1>No, it's nighttime!</h1>".html_safe
		end
	end
end
