class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    # 上記でパラメーターから送られてきたデータを@postに格納させる
    if @post.save_with_tags(tag_names: params.dig(:post, :tag_names).split(',').uniq)
      # 上記の記載でsave_withメソッドに飛ばす
      p '成功'
      redirect_to root_path
    else
      p "うまく行ってません"
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

end
