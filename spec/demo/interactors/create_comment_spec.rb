require_relative '../../spec_helper'

module Demo
  describe CreateComment do
    let(:create_comment) { CreateComment.new(params: params) }

    after do
      ArticleRepository.clear
      CommentRepository.clear
    end

    describe 'with valid params' do
      let(:article) { ArticleRepository.create(Article.new(title: 'Interactor article', body: 'Example article')) }
      let(:params) { Lotus::Action::Params.new(author: 'John', body: 'Hello, world', article_id: article.id) }

      it 'results in a success' do
        assert create_comment.call.success?
      end

      it 'created a comment using the params' do
        before_count = CommentRepository.all.size
        create_comment.call
        after_count = CommentRepository.all.size
        assert_equal before_count + 1, after_count, 'There should have been one more comment'
        last_comment = CommentRepository.last
        assert_equal 'John', last_comment.author
      end

      it 'reports persistence exception as an error' do
        result = nil
        CommentRepository.stub :persist, -> { raise 'persistence error' } do
          result = create_comment.call
        end
        refute result.success?, 'result should not have been success'
        assert_equal ['saving failed'], result.errors
      end
    end

    describe 'with invalid params' do
      let(:params) { Lotus::Action::Params.new({}) }

      it 'is unsuccessful when the params are invalid' do
        refute create_comment.call.success?
      end
    end
  end
end
