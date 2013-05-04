class ReportsController < ApplicationController
	def index
		@report = Report.new
	end

	def create
		@report = Report.new(params[:report])

		if @report.valid? && @report.geoplanet_location.count > 1
			# flash[:notice] = "Please enter a more specific location."
			render :clarify
		else
			@report.geoplanet_location
		end

		if @report.valid?

		else
			flash[:error] = "You must enter a location"
			redirect_to root_path
		end
	end
end