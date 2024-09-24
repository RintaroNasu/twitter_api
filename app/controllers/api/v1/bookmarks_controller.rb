class Api::V1::BookmarksController < ApplicationController
    def index
        bookmarks = Bookmark.where(user_id: params[:user_id])
        render json: bookmarks, status: :ok
    end

    def create
        bookmark = Bookmark.new(user_id: params[:user_id], post_id: params[:post_id])
        if bookmark.save!
            render json:bookmark, status: :created
        else
            render json:bookmark.errors, status: :unprocessable_entity
        end
    end

    def destroy
        bookmark = Bookmark.find_by(user_id: params[:user_id], post_id: params[:post_id])
        if bookmark.destroy!
            render json:bookmark, status: :ok
        else
            render json:bookmark.errors, status: :unprocessable_entity
        end
    end
end
