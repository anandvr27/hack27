class OmniauthCallbacksController < Devise::OmniauthCallbacksController
	def all
		user = User.from_omniauth(request.env["omniauth.auth"])
		flash[:notice] = "Signed in successfully"
		sign_in_and_redirect user
	end	
	alias_method :facebook,:all
end