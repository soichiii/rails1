class PostsController < ApplicationController
  def index
    @posts = Post.all

  end
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params.require(:post).permit(:title, :start, :finish, :finish_day, :memo))
    if @post.save
      flash[:notice] = "メモを新規追加しました"
      redirect_to :posts
    else
      flash.now[:notice] = "保存に失敗しました"
      render "new"
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(params.require(:post).permit(:title, :start, :finish, :finish_day, :memo))
      flash[:notice] = "メモ「#{@post.id}」を更新しました"
      redirect_to :posts
    else
      flash.now[:notice] = "保存に失敗しました"
      render "edit"
    end
  end

  def destroy
    @post = Post.find(params[:id])
     @post.destroy
     flash[:notice] = "メモを削除しました"
     redirect_to :posts
  end
end
