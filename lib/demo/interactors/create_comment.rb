require 'lotus/interactor'

module Demo
  class CreateComment
    include Lotus::Interactor

    def initialize(params:)
      @params = params
    end

    def call
      persist_comment
    end

    private

    def persist_comment
      @comment = CommentRepository.persist(Comment.new(@params))
    rescue
      error!('saving failed')
    end

    def valid?
      @params.valid?
    end
  end
end
