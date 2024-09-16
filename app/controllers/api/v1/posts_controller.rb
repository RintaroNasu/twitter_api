class Api::V1::PostsController < ApplicationController
  def index
    @posts = Post.includes(:user).all
    render json: @posts.to_json(include: :user)
  end

  def search
    query = params[:query]
    results = Post.where(content: query)
    puts "result: #{results.to_a.inspect}"
    if results
      render json: results
    else
      render json:result.errors
    end

  end

  def show
    @post = Post.find(params[:id])
    render json: @post
  end

  def create
    @post = Post.new(posts_params)
    @post.user = User.find_by(user_id: params[:user_id])
    if @post.save!
      render json: @post, status: :created
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(posts_params)
      render json: @post, status: :created
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
  end

  private 
    def posts_params
      params.require(:post).permit(:content, :user_id)
    end
end
