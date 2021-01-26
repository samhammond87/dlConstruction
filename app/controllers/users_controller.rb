class UsersController < ApplicationController

    def create
        @user = User.create(user_params)
        if @user.save
            auth_token = Knock::AuthToken.new payload: {sub: @user.id} # this is a JWT
            render json: {email: @user.email, jwt: auth_token.token}, status: :created
        else
            render json: @user.errors, status: :unprocessable_entity
        end
    end

    def sign_up
        @user = User.find_by_email(params[email])
        if @user && @user.authenticate(params[:password])
            auth_token = Knock::AuthToken.new payload: {sub: @user.id} # this is a JWT
            render json: {username: @user.email, jwt: auth_token.token}, status: 200
        else
            render json: {error: "Incorrect Email or Password"}, status: 404
            
        end
    end

private

    def user_params
        params.permit(:email, :admin, :password, :password_confirmation)
    end

end
