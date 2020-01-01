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
    file_params = params[:article][:file]

    unless file_params.nil?
    #write files
      File.open(Rails.root.join('public', 'uploads', file_params.original_filename), 'wb') do |file|
        file.write(file_params.read)
      end

      crop_file_params = params[:article][:crop_file]
      File.open(Rails.root.join('public', 'uploads', crop_file_params.original_filename), 'wb') do |file|
        file.write(crop_file_params.read)
      end
    end

    @article = Article.new(article_params)

    unless file_params.nil?
      @article.filename = file_params.original_filename
    end

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
    params.require(:article).permit(:title, :text, :client)
  end
end
