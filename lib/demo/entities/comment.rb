module Demo
  class Comment
    include Lotus::Entity
    attributes :id, :author, :body, :created_at, :article_id
  end
end
