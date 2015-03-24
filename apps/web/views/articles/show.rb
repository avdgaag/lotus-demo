module Web::Views::Articles
  class Show
    include Web::View

    def article
      Web::Presenters::ArticlePresenter.new(locals[:article])
    end
  end
end
