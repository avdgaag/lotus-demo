require_relative '../../../spec_helper'

module Web::Controllers::Comments
  class FakeInteractor
    class << self
      attr_accessor :result
    end

    def initialize(*args)
    end

    def call
      self.class.result
    end
  end

  describe Create do
    let(:result) { Minitest::Mock.new }
    let(:action) { Web::Controllers::Comments::Create.new(interactor: FakeInteractor) }
    let(:params) { Hash[article_id: 1, author: 'John', body: 'lorem ipsum'] }

    before do
      FakeInteractor.result = result
    end

    after do
      result.verify
    end

    it 'is redirects to the article' do
      result.expect :success?, true
      response = action.call(params)
      assert_equal 302, response[0]
      assert_equal '/articles/1', response[1]['Location']
    end

    it 'uses the CreateComment interactor to create a new comment' do
      result.expect :success?, true
      action.call(params)
    end

    it 'assigns a flash notice when comment was created' do
      result.expect :success?, true
      action.call(params)
      assert_equal 'Comment added', action.send(:flash)[:notice]
    end

    it 'assigns a flash alert when comment was not created' do
      result.expect :success?, false
      action.call({})
      assert_equal 'Something went wrong. Please try again.', action.send(:flash)[:alert]
    end
  end
end
