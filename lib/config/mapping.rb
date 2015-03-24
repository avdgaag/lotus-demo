collection :articles do
  entity     Demo::Article
  repository Demo::ArticleRepository

  attribute :id, Integer
  attribute :title, String
  attribute :body, String
  attribute :created_at, Time
end

collection :comments do
  entity     Demo::Comment
  repository Demo::CommentRepository

  attribute :id, Integer
  attribute :author, String
  attribute :body, String
  attribute :created_at, Time
  attribute :article_id, Integer
end
