require_relative '../../spec_helper'

module Demo
  describe CreateComment do
    let(:repository) { Minitest::Mock.new }
    let(:params) { Lotus::Action::Params.new({ author: 'John' }) }
    let(:create_comment) { CreateComment.new(params: params, repository: repository) }

    before do
      repository.expect :is_a?, false, [Hash]
      repository.expect :is_a?, false, [Class]
    end

    after do
      repository.verify
    end

    it 'is unsuccessful when the params are invalid' do
      params.stub :valid?, false do
        refute create_comment.call.success?
      end
    end

    it 'creates a comment using the params when they are valid' do
      repository.expect :persist, true, [Comment.new(author: 'John')]
      assert create_comment.call.success?
    end

    it 'is not successful when creating the comment fails' do
      repository.expect :persist, false, [Comment.new(author: 'John')]
      result = create_comment.call
      refute result.success?, 'result should not have been success'
      assert_equal 1, result.errors.count
    end
  end
end
