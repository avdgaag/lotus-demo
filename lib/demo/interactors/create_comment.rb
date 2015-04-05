require 'lotus/interactor'

module Demo
  class CreateComment
    include Lotus::Interactor

    def initialize(params:, repository: CommentRepository)
      @repository = repository
      @params = params
    end

    def call
      comment = Comment.new(@params)
      @repository.persist(comment) or error('saving failed')
    end

    private

    def valid?
      @params.valid?
    end
  end
end
