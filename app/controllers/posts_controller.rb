class PostsController < ApplicationController
    before_action :authenticate_member!, only: [:new, :create]

    def index
        @posts = Post.all.order("created_at DESC")
    end

    def new
      @post = current_member.posts.build()
      # @post = Post.new
    end

    def create
        @post = current_member.posts.build(post_params)
        if @post.save
        redirect_to root_path
        else 
            render :new
        end
    end

    private
    def post_params
        params.require(:post).permit(:body, :title)
      end


end
