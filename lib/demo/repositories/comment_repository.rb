module Demo
  class CommentRepository
    include Lotus::Repository

    def self.for_article(article)
      query do
        where(article_id: article.id)
      end
    end
  end
end
