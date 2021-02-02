class UserTokenController < Knock::AuthTokenController
    skip_before_action :verify_authenticity_token, raise: false

 


    def user_token_params
      params.permit(:user, :username, :email, :admin, :password, :password_confirmation)
   end


end  