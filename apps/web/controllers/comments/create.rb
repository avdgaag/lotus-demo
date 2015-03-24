module Web::Controllers::Comments
  class Create
    include Web::Action

    def initialize(comment_repository: Demo::CommentRepository)
      @comment_repository = comment_repository
    end

    def call(params)
      @comment_repository.create(Demo::Comment.new(params))
      redirect_to "/articles/#{params[:article_id]}"
    end
  end
end
