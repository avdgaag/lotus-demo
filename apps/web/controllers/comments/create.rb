module Web::Controllers::Comments
  class Create
    include Web::Action

    params do
      param :article_id, presence: true
      param :author, presence: true
      param :body, presence: true
    end

    def initialize(interactor: Demo::CreateComment)
      @interactor = interactor
    end

    def call(params)
      result = @interactor.new(params: params).call
      if result.success?
        flash[:notice] = 'Comment added'
      else
        flash[:alert] = 'Something went wrong. Please try again.'
      end
      redirect_to "/articles/#{params[:article_id]}"
    end
  end
end
