require_relative '../../spec_helper'

module Demo
  describe Comment do
    it 'is a Lotus::Entity' do
      assert_kind_of Lotus::Entity, Comment.new
    end

    it 'can set attribute through the initializer' do
      timestamp = Time.now
      article = Comment.new(
        id: 1,
        author: 'John',
        body: 'Lorem ipsum',
        created_at: timestamp
      )
      assert_equal 1, article.id
      assert_equal 'John', article.author
      assert_equal 'Lorem ipsum', article.body
      assert_equal timestamp, article.created_at
    end
  end
end
