require 'kramdown'

module Web::Presenters
  class CommentPresenter
    include Lotus::Presenter

    def created_at
      super.strftime '%e %b %Y %H:%M'
    end

    def body
      _raw Kramdown::Document.new(super).to_html
    end
  end
end
