require_relative '../../../spec_helper'

module Web::Controllers::Home
  describe Index do
    let(:repository) { OpenStruct.new(all: []) }
    let(:action) { Web::Controllers::Home::Index.new(repository: repository) }
    let(:params) { Hash[] }

    it 'is successful' do
      response = action.call(params)
      assert_equal 200, response[0], 'expected HTTP status 200'
    end

    it 'exposes articles to the view' do
      action.call({})
      assert_same repository.all, action.exposures[:articles], 'expected exposure to be result of repository.all'
    end
  end
end
