module Web::Views::Articles
  class Show
    include Web::View

    def article
      Web::Presenters::ArticlePresenter.new(locals[:article])
    end

    def comments
      locals[:comments].map do |comment|
        Web::Presenters::CommentPresenter.new(comment)
      end
    end

    def comments_header
      if comments.count == 1
        '1 comment'
      else
        "#{comments.count} comments"
      end
    end
  end
end
