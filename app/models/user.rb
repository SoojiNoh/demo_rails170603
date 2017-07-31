class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  #User : Artist = 1 : 1
  has_one :artist
         
  #User : Catalogue = 1 : N
  has_many :catalogues
  
end
