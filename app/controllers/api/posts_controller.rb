class Api::PostsController < ApplicationController
    def index
        if params[:wallId] == 'all'
            @posts = Post.includes(:comments, :likes).all
        else
            @posts = Post.all
        end
        render :index
    end

    def show
        @post = Post.find_by(id: params[:id])
        render :show
    end

    def create
        @post = Post.new(post_params)

        if @post.save
            render :show
        else
            render json: @post.errors.full_messages, status: 422
        end
    end

    def update
        @post = Post.find(params[:id])

        if @post.update(post_params)
            render :show
        else
            render json: @post.errors.full_messages, status: 422
        end
    end

    def destroy
        @post = Post.find_by(id: params[:id])
        
        if @post
            @post.destroy
            render json: {}
        else
            render json: ["Cannot delete someone else's post"], status: 404
        end
    end

    private

    def post_params
        params.require(:post).permit(:body, :author_id, :post_photo, :profile_id)
    end
end