class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :first_name, presence: true
  
  def  full_name
    "#{first_name} #{last_name}"
    #[first_name, last_name].join(" ")
  end
  
  def initials
    first_name[0]+last_name[0]
    #"#{first_name.first}#{last_name.first}"
  end
  
end
