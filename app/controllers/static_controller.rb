class StaticController < ApplicationController
    skip_before_action :require_login
    
	def home 
		@projects=Project.all
	end
end
