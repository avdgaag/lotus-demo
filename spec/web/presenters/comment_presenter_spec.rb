require_relative '../../spec_helper'

module Web::Presenters
  describe CommentPresenter do
    let(:comment) { Demo::Comment.new(author: 'John', body: 'lorem ipsum', created_at: Time.new(2015, 2, 1, 12, 30)) }
    let(:presenter) { CommentPresenter.new(comment) }

    it 'is a Lotus::Presenter' do
      assert_kind_of Lotus::Presenter, presenter
    end

    it 'formats the created_at timestamp' do
      assert_equal ' 1 Feb 2015 12:30', presenter.created_at, 'created_at formatting is incorrect'
    end

    it 'formats the body using markdown' do
      assert_equal "<p>lorem ipsum</p>\n", presenter.body, "no markdown was applied to the body"
    end
  end
end
