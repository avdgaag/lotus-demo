require_relative '../../../spec_helper'

module Web::Views::Home
  describe Index do
    let(:exposures) { Hash[articles: []] }
    let(:template)  { Lotus::View::Template.new('apps/web/templates/home/index.html.erb') }
    let(:view)      { Web::Views::Home::Index.new(template, exposures) }

    it 'exposes #articles' do
      assert_same exposures[:articles], view.articles, 'articles should have been exposed'
    end
  end
end
