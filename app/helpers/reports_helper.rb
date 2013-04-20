module ReportsHelper
	def sunglasses
		if @report.sunny?
			"Yes!"
		else
			"No!"
		end
	end
end
