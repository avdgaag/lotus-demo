require_relative '../../../spec_helper'

module Web::Controllers::Articles
  describe Show do
    let(:action) { Web::Controllers::Articles::Show.new }
    let(:params) { Hash[id: 1] }

    it 'is successful' do
      response = action.call(params)
      assert_equal 200, response[0], 'expected HTTP response 200'
    end

    it 'exposes article' do
      article = Object.new
      Demo::ArticleRepository.stub :find, article do
        action.call(params)
      end
      assert_same article, action.exposures[:article], 'article object was not exposed'
    end
  end
end
