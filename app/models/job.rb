class Job < ActiveRecord::Base
	has_and_belongs_to_many :users
	has_many :invoices
	has_many :contracts
	has_many :estimates
end
