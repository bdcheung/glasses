class ReportsController < ApplicationController
	def index
		@report = Report.new
	end

	def new
		@report = Report.new(params[:report])
	end

	def create
		@report = Report.new(params[:report])

		if @report.valid? && @report.geoplanet_location.count > 1
			# flash[:notice] = "Please enter a more specific location."
			render :clarify
		end

		unless @report.valid?
			flash[:error] = "You must enter a location"
			redirect_to root_path
		end
	end

	#def show
#		@report = Report.new(params[:report])
#	end
end