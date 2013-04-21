module ReportsHelper
	def sunglasses
		if @report.sunny?
			"<h1>Yes!</h1>".html_safe
		else
			"<h1>No!</h1>".html_safe
		end
	end
end
