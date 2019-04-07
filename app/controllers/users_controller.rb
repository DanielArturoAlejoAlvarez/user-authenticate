class UsersController < ApplicationController
    
    before_action :authenticate_user, only: [:index]

    def index  
        render json: {status: 200, msg: 'Authenticated'}
    end

    def create
        user=User.new(user_params)
        if user.save 
            render json: {status: 200, msg: 'User saved successfully!'}
        else  
            render json: {status: 400, msg: 'User not saved'}
        end
    end

    private
    def user_params
        params.require(:user).permit(:username,:email,:password)
    end
end
