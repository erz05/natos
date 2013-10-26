class ClientsController < ApplicationController
	before_filter :authorize_access

	def index
		@clients = Client.all
    end

	def new
		@client = Client.new	
	end

	def create
		@client = Client.new(params[:client].permit(:name, :company, :email, :phone))
		if @client.save
			redirect_to @client
		else
			render 'new'
		end
	end

	def edit
		@client = Client.find(params[:id])
	end

	def update
		@client = Client.find(params[:id])
		if(@client.update(params[:client].permit(:name, :company, :email, :phone)))
			redirect_to @client
		else
			render 'edit'
		end
	end

	def show
  		@client = Client.find(params[:id])
	end

	def destroy
		@client = Client.find(params[:id])
		@client.destroy

		redirect_to clients_path
	end
end
