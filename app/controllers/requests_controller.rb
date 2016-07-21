class RequestsController < ApplicationController

	def create
		@feature = Feature.find(params[:feature_id])
		@request = @feature.requests.create_with_user({assigned: false}, current_user)
		render json: {new_status: 'Your request has been sent'}
	end

	def update
		@request = Request.find(params[:id])
		@feature = @request.feature
		@request.update(assigned: true)
    UserMailer.confirmation_email(@request.user, @feature).deliver_now
		redirect_to feature_path(@feature)
	end

end
