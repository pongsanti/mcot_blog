#
class ArticlesController < ApplicationController
  protect_from_forgery :except => [:create]

  def index
    @articles = Article.order(id: :desc).all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
  end

  def create
    #write files
    file_params = params[:article][:file]
    File.open(Rails.root.join('public', 'uploads', file_params.original_filename), 'wb') do |file|
      file.write(file_params.read)
    end

    @article = Article.new(article_params)
    @article.filename = file_params.original_filename
    @article.save

    render plain: "OK"
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :text)
  end
end
