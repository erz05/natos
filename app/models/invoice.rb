class Invoice < ActiveRecord::Base
  belongs_to :job
end
