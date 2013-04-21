class ReportsController < ApplicationController
	def index
		@report = Report.new
	end

	def create
		@report = Report.new(params[:report])
		if @report.valid?
		else
			flash[:error] = "You must enter a location"
			redirect_to root_path
		end
	end
end
