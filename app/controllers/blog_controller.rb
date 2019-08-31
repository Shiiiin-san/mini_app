class BlogController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]
  # before_action :blog_params, only: :create

  def index
    @blog = Blog.all
  end

  def new
    # データを新規作成する
    # 	新しく追加したいデータ(を入力し その内容)をサーバーに送信する
    # 		おもな遷移先 create
    @blog = Blog.new
  end

  def create
    # データを新規作成して追加(保存)する
    # 	受信した内容のレコードを作成、 それをテーブルに追加する
    # 		おもな遷移先 (index), show
    Blog.create(title: blog_params[:title], text: blog_params[:text], user_id: current_user.id)
  end

  def show
    # データの内容を表示する
    # 	特定のデータを抽出し表示する
    # 		おもな遷移先 edit
  end

  def edit
    # データを更新するためのフォームを作成する
    # 	編集したいレコードを呼び出し編集、 編集した内容をサーバーに送る(送るだけ)
    # 		おもな遷移先 update
    @blog = Blog.find(params[:id])
  end

  def update
	# データを更新する
	# 	既に存在しているレコードを選択して中身を書き換える作業が必要
  # 		おもな遷移先 show
    blog = Blog.find(params[:id])
    blog.update(blog_params) if blog.user_id == current_user.id
  end

  def destroy
    # データを削除する
    # 	送られた情報をもとに 指定されたデータの削除を行う
    # 		おもな遷移先 index
    blog = Blog.find(params[:id])
    blog.destroy if blog.user_id == current_user.id
  end

  private
    def blog_params
      params.require(:blog).permit(:title, :text)
    end
end
