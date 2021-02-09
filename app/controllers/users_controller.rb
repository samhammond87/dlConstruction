class UsersController < ApplicationController


    def create
        @user = User.create(user_params)
        if @user.save
            auth_token = Knock::AuthToken.new payload: {sub: @user.id} # this is a JWT
            render json: {username: @user.username, jwt: auth_token.token}, status: :created
        else
            render json: @user.errors, status: :unprocessable_entity
        end
    end

    def sign_in
        @user = User.find_by_email(params[:email])
        if @user && @user.authenticate(params[:password])
            auth_token = Knock::AuthToken.new payload: {sub: @user.id} # this is a JWT
            render json: {username: @user.username, jwt: auth_token.token}, status: 200
        else
            render json: {error: "Incorrect Email or Password"}, status: 404
            
        end
    end


    # it 'responds successfully' do
    #     get secured_resources_url, headers: authenticated_header
    
    #     assert_response :success

private

    def user_params
        params.permit(:user, :username, :email, :admin, :password, :password_confirmation)
    end

    
end
