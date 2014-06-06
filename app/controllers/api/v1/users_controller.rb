module Api
  module V1
    class UsersController < ApiController
      
      def index
        users = User.all
        respond_with users
      end

      def show
        user = User.find(params[:id])
        respond_with user
      end

      def create
        user = User.new(params.require(:user).permit!)

        if user.save
          respond_with user
        else
          render :json, user.errors, status: 422
        end
      end

    end
  end
end