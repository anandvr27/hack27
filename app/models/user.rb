class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :timeoutable, :lockable, :omniauthable

  validates_presence_of :name
  
  def self.from_omniauth(auth)
    where(auth.slice(provider: auth.provider, uid: auth.uid)).first_or_create do |user|
    	user.provider = auth.provider
    	user.UID = auth.uid
    	user.name = auth.info.name
    	user.email = auth.info.email 
    	user.password = Devise.friendly_token[0,20]
      user.image = auth.info.image
    end
  end
  
  def self.new_with_session(params,session)
  	if session["devise.user_attributes"]
  		new(session[devise.user_attributes],without_protection: true) do |user|
  			user.attributes = params
        user.image = auth.info.image
  			user.valid?
  		end
  	else
  		super	
  	end	
  end  


  def password_required?
    super && provider.blank?
  end   

  def update_with_password(params, *options) 
    if encrypted_password.blank?
      update_attributes(params,*options)
    else
      super
    end
  end   
end