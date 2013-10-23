class SuppliesController < ApplicationController

	before_filter :authorize_access

	def index
		@supplies = Supply.all
    end

	def new
		@supply = Supply.new	
	end

	def create
		@supply = Supply.new(params[:supply].permit(:title, :description, :quantity))
		if @supply.save
			redirect_to @supply
		else
			render 'new'
		end
	end

	def edit
		@supply = Supply.find(params[:id])
	end

	def update
		@supply = Supply.find(params[:id])
		if(@supply.update(params[:supply].permit(:title, :description, :quantity)))
			redirect_to @supply
		else
			render 'edit'
		end
	end

	def show
  		@supply = Supply.find(params[:id])
	end

	def destroy
		@supply = Supply.find(params[:id])
		@supply.destroy

		redirect_to supplies_path
	end

end