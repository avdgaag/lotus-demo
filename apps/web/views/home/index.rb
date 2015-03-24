module Web::Views::Home
  class Index
    include Web::View

    def articles
      locals[:articles].map do |article|
        Web::Presenters::ArticlePresenter.new(article)
      end
    end
  end
end
