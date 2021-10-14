class CommentsController < ApplicationController
    # See rake routes. We refer to comment id using params[:id] and blog post id using params[:post_id]
    def show
        @comment = Comment.find(params[:id])
    end

    def new
        @comment = Comment.new
    end

    #  ^ Above methods useful for view rendering
    #  v Below methods useful for view form submits

    def create
        @post = Post.find(params[:post_id])
        @comment = @post.comments.create(comment_params)
        redirect_to post_path(@post)
    end
    
    private def comment_params
        params.require(:comment).permit(:user, :body)
    end
end
