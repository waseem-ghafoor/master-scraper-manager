class ApplicationController < ActionController::Base
	before_action :set_time_zone
	skip_before_action :verify_authenticity_token
	

	def set_time_zone
		Time.zone = 'Central Time (US & Canada)'
	end
end
