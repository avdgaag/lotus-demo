module Web::Controllers::Articles
  class Show
    include Web::Action

    expose :article
    expose :comments

    def initialize(article_repository: Demo::ArticleRepository, comment_repository: Demo::CommentRepository)
      @article_repository = article_repository
      @comment_repository = comment_repository
    end

    def call(params)
      @article = @article_repository.find(params[:id])
      @comments = @comment_repository.for_article(@article)
    end
  end
end
