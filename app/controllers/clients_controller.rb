class ClientsController < ApplicationController
	before_filter :authorize_access
end
