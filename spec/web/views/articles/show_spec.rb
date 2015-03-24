require_relative '../../../spec_helper'

module Web::Views::Articles
  describe Show do
    let(:exposures) { Hash[article: Object.new] }
    let(:template)  { Lotus::View::Template.new('apps/web/templates/articles/show.html.erb') }
    let(:view)      { Web::Views::Articles::Show.new(template, exposures) }

    it "exposes #article" do
      assert_same exposures[:article], view.article, 'view should have exposed article'
    end
  end
end
