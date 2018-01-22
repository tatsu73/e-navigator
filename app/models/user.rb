class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  enum sex: { other: 0, male: 1, famale: 2 }
  has_many :user_interview, class_name: 'Interview', :foreign_key => 'users_id'
  has_many :recipient_interview, class_name: 'Interview', :foreign_key => 'recipient_id'      
end
