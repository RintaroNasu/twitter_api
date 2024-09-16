class Api::V1::UsersController < ApplicationController
    def create
        user = User.find_or_create_by(provider: params[:provider], name: params[:name], email: params[:email],user_id: params[:userId])
        if user
            render json: { id: user.id }, status: :ok
        else
            render json: {error: "ログインに失敗しました"}, status: unprocessable_entity
        end
    end

    def index
        @user = User.find(params[:id])
        @posts = @user.posts
        render json: @posts
    end
end
