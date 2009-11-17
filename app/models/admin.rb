class Admin < ActiveRecord::Base
  validates_presence_of :password
  
  def self.password
    first && first.password
  end
  
  def self.set_password(string)    
    new_admin = Admin.new(:password => string)
    
    if new_admin.valid?
      Admin.destroy_all
      new_admin.save!
    end
  end
end
