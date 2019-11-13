class BlogPostsController < ApplicationController
  def index
    @posts = BlogPost.all
    #render "index.html.erb"
  end

  def show
    @post = BlogPost.find(params[:id])
    #render "show.html.erb"
  end

  def create
    @post = BlogPost.new(
      title: params[:title],
      content: params[:content]
    )
    if @post.save
      redirect_to @post
    else
      render action: :new
    end
  end

  def new
      # render "new.html.erb"
  end

  def delete
    @post = BlogPost.find(params[:id])
    if @post.destroy
      redirect_to all_posts_path
    else
      redirect_to blog_post_path(@post)
    end
  end
end
