class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
         attr_accessor :login
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:login]


    validates :username,
	  :presence => true,
	  :uniqueness => {
	    :case_sensitive => false
	  } # etc.


    def self.find_for_database_authentication(warden_conditions)
      conditions = warden_conditions.dup
      if login = conditions.delete(:login)
        where(conditions.to_h).where(["lower(user_name) = :value OR lower(email) = :value", { :value => login.downcase }]).first
      elsif conditions.has_key?(:user_name) || conditions.has_key?(:email)
        where(conditions.to_h).first
      end
    end
end
