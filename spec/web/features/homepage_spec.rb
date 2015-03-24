require_relative '../../features_helper'

describe 'Homepage' do
  before do
    Demo::ArticleRepository.clear
  end

  it 'links to the home page' do
    visit '/'
    assert page.has_link?('a', href: '/')
  end

  describe 'when there are no articles' do
    it 'shows a placeholder' do
      visit '/'
      assert page.has_css?('.placeholder', text: 'There are no articles yet.')
    end
  end

  describe 'when there are articles' do
    before do
      3.times do |i|
        Demo::ArticleRepository.create(
          Demo::Article.new(title: "Article #{i}", body: 'Lorem ipsum')
        )
      end
    end

    it 'hides the placeholder' do
      visit '/'
      assert page.has_no_css?('.placeholder'), 'there should be no placeholder'
    end

    it 'shows all articles on the page' do
      visit '/'
      assert page.has_css?('.article', count: 3), 'there should be a .article element for every article'
    end
  end
end
