module Web::Controllers::Home
  class Index
    include Web::Action

    expose :articles

    def initialize(repository: Demo::ArticleRepository)
      @repository = repository
    end

    def call(params)
      @articles = @repository.all
    end
  end
end
