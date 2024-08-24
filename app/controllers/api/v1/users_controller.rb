class Api::V1::UsersController < ApplicationController
    def create
        user = User.find_or_create_by(provider: params[:provider], name: params[:name], email: params[:email],accountId: params[:accountId])
        if user
            render json: { id: user.id }, status: :ok
        else
            render json: {error: "ログインに失敗しました"}, status: unprocessable_entity
        end
    end
end
