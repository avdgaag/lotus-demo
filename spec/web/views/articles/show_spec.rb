require_relative '../../../spec_helper'

module Web::Views::Articles
  describe Show do
    let(:exposures) { Hash[article: Object.new] }
    let(:template)  { Lotus::View::Template.new('apps/web/templates/articles/show.html.erb') }
    let(:view)      { Web::Views::Articles::Show.new(template, exposures) }

    it 'exposes #article wrapped in a presenter' do
      assert_kind_of Web::Presenters::ArticlePresenter, view.article, 'article should have been wrapped in a presenter'
    end
  end
end
