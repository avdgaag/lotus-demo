require_relative '../../features_helper'

describe 'Commenting on articles' do
  before do
    Demo::ArticleRepository.clear
    @article = Demo::ArticleRepository.create(
      Demo::Article.new(title: 'Hello, world', body: 'Lorem ipsum')
    )
  end

  describe 'when there are no comments' do
    it 'hides the comments heading' do
      visit '/'
      click_link 'Hello, world'
      assert page.has_no_css?('.comments__heading'), 'there should not have been a comments heading'
    end
  end

  describe 'when there are comments' do
    it 'shows the comment and the total number of comments' do
      visit '/'
      click_link 'Hello, world'
      fill_in 'Name', with: 'John'
      fill_in 'Comment', with: 'Nice post!'
      click_button 'Submit Comment'
      assert page.has_css?('.comments__heading', text: '1 comment'), 'there is no comments heading'
      assert page.has_css?('.comment__body', text: 'Nice post!'), 'there is no comment'
      assert page.has_css?('.flash--notice', text: 'Comment added'), 'there was no flash notice'
    end
  end
end
