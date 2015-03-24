module Web::Controllers::Comments
  class Create
    include Web::Action

    params do
      param :article_id, presence: true
      param :author, presence: true
      param :body, presence: true
    end

    def initialize(comment_repository: Demo::CommentRepository)
      @comment_repository = comment_repository
    end

    def call(params)
      if params.valid? && @comment_repository.create(Demo::Comment.new(params))
        flash[:notice] = 'Comment added'
      else
        flash[:alert] = 'Something went wrong. Please try again.'
      end
      redirect_to "/articles/#{params[:article_id]}"
    end
  end
end
