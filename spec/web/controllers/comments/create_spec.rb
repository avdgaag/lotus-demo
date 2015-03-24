require_relative '../../../spec_helper'

module Web::Controllers::Comments
  describe Create do
    let(:comment_repository) { Minitest::Mock.new }
    let(:comment) { Demo::Comment.new(params) }
    let(:action) { Web::Controllers::Comments::Create.new(comment_repository: comment_repository) }
    let(:params) { Hash[article_id: 1, author: 'John', body: 'lorem ipsum'] }

    before do
      comment_repository.expect :create, true, [comment]
    end

    it 'is redirects to the article' do
      response = action.call(params)
      assert_equal 302, response[0]
      assert_equal '/articles/1', response[1]['Location']
    end

    it 'creates a comment in the repository' do
      action.call(params)
      comment_repository.verify
    end

    it 'does not create a comment when a parameter is missing' do
      action.call({})
      assert_raises(MockExpectationError, 'create should not have been called') do
        comment_repository.verify
      end
    end

    it 'assigns a flash notice when comment was created' do
      action.call(params)
      assert_equal 'Comment added', action.send(:flash)[:notice]
    end

    it 'assigns a flash alert when comment was not created' do
      action.call({})
      assert_equal 'Something went wrong. Please try again.', action.send(:flash)[:alert]
    end
  end
end
