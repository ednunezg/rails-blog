class PostsController < ApplicationController
    def index
        @posts = Post.all
    end

    def show
        @post = Post.find(params[:id])
    end

    def new
        @post = Post.new
    end

    def edit
        # We get the ID because the view lives within sitename.com/posts/edit/:id
        @post = Post.find(params[:id])
    end    

    # ^ Above is controllers dealing with views
    # v Below is controllers that deal with REST type methods (create for POST, update for PUT, etc)
    
    # This will create a new post and then redirect you to the show view
    def create
        @post = Post.new(post_params) # This Post.new will create a new row in our model
        if(@post.save) # Actually makes the database write
            redirect_to @post # ??? HOW THE F IS THIS REDERICTING TO POST? don't understand syntax
        else
            render 'new' # Contorl statement catches if post didn't save due to model validation errors
        end
    end

    def update
        @post = Post.find(params[:id])

        if(@post.update(post_params)) # Actually makes the database write
            redirect_to @post
        else
            render 'edit'
        end
    end

    def destroy
        @post = Post.find(params[:id])
        @post.destroy

        redirect_to '/'
    end

    private def post_params
        params.require(:post).permit(:title, :body)
    end
end
