class FeaturesController < ApplicationController

	def new
		@feature = Feature.new
		@project = Project.find(params[:project_id])
	end

	def create
		@project = Project.find(params[:project_id])
		@project.features.create(feature_params)
		redirect_to project_path(@project)
	end

	private

	def feature_params
		params.require(:feature).permit(:name, :description, :deadline)
	end

end
