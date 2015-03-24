require_relative '../../spec_helper'

module Demo
  describe Article do
    it 'is a Lotus::Entity' do
      assert_kind_of Lotus::Entity, Article.new
    end

    it 'can set attribute through the initializer' do
      timestamp = Time.now
      article = Article.new(
        id: 1,
        title: 'New article',
        body: 'Lorem ipsum',
        created_at: timestamp
      )
      assert_equal 1, article.id
      assert_equal 'New article', article.title
      assert_equal 'Lorem ipsum', article.body
      assert_equal timestamp, article.created_at
    end
  end
end
