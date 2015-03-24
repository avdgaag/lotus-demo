module Demo
  class Article
    include Lotus::Entity
    attributes :id, :title, :body, :created_at
  end
end
