require_relative '../../features_helper'

describe 'Article page' do
  before do
    Demo::ArticleRepository.clear
    @article = Demo::ArticleRepository.create(
      Demo::Article.new(title: 'Hello, world', body: 'Lorem ipsum')
    )
  end

  it 'shows the title and body of the article' do
    visit "/"
    click_link 'Hello, world'
    assert page.has_css?('.article'), 'expected a .article element'
    assert page.has_css?('.article__title', text: 'Hello, world'), 'expected the article title'
    assert page.has_css?('.article__body', text: 'Lorem ipsum'), 'expected the article body'
  end
end
