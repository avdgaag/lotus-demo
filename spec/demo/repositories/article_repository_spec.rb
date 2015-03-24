require_relative '../../spec_helper'

module Demo
  describe ArticleRepository do
    before do
      ArticleRepository.clear
    end

    it 'is a Lotus::Repository' do
      assert_kind_of Lotus::Repository, ArticleRepository.new
    end

    it 'can load all articles into an array of Article entities' do
      3.times do |i|
        ArticleRepository.create(
          Article.new(title: "Article #{i}", body: 'Lorem Ipsum')
        )
      end
      articles = ArticleRepository.all
      assert_equal 3, articles.size
      assert_kind_of Article, articles.first
    end
  end
end
