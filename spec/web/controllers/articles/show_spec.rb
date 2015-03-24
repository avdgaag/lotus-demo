require_relative '../../../spec_helper'

module Web::Controllers::Articles
  describe Show do
    let(:article_repository) { Minitest::Mock.new }
    let(:comment_repository) { Minitest::Mock.new }
    let(:article) { Object.new }
    let(:comments) {[] }
    let(:action) { Web::Controllers::Articles::Show.new(article_repository: article_repository, comment_repository: comment_repository) }
    let(:params) { Hash[id: 1] }

    before do
      article_repository.expect :find, article, [1]
      comment_repository.expect :for_article, comments, [article]
    end

    after do
      article_repository.verify
      comment_repository.verify
    end

    it 'is successful' do
      response = action.call(params)
      assert_equal 200, response[0], 'expected HTTP response 200'
    end

    it 'exposes article' do
      action.call(params)
      assert_same article, action.exposures[:article], 'article object was not exposed'
    end

    it 'exposes comments' do
      action.call(params)
      assert_same comments, action.exposures[:comments], 'comments object was not exposed'
    end
  end
end
