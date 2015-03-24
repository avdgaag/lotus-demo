collection :articles do
  entity     Demo::Article
  repository Demo::ArticleRepository

  attribute :id, Integer
  attribute :title, String
  attribute :body, String
  attribute :created_at, Time
end
