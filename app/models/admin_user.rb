class AdminUser < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable
  validates :email, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  


  def full_name
    "#{self.first_name} #{self.last_name}"
  end 
end
