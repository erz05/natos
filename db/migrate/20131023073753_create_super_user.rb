class CreateSuperUser < ActiveRecord::Migration
  def change
    u = User.new
    u.name = "natosAdamin"
    u.email = "natos@natos.com"
    u.password = "Er256zer"
    u.save
  end
end
