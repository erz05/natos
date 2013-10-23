class AdminController < ApplicationController
	before_filter :authorize_access
end
