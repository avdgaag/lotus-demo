require_relative '../../spec_helper'

module Demo
  describe CommentRepository do
    before do
      ArticleRepository.clear
      CommentRepository.clear
    end

    it 'is a Lotus::Repository' do
      assert_kind_of Lotus::Repository, CommentRepository.new
    end

    it 'can find comments by article_id' do
      article = ArticleRepository.create(
        Article.new(title: 'Hello, world', body: 'Lorem ipsum')
      )
      comment = CommentRepository.create(
        Comment.new(author: "Author", body: 'Lorem Ipsum', article_id: article.id)
      )
      comments = CommentRepository.for_article(article)
      assert_equal 1, comments.count
      assert_equal comment, comments.first
    end
  end
end
