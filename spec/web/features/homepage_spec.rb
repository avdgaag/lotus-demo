require_relative '../../features_helper'

describe 'Homepage' do
  it 'links to the home page' do
    visit '/'
    assert page.has_link?('a', href: '/')
  end

  it 'shows a placeholder when there are no articles yet' do
    visit '/'
    assert page.has_css?('.placeholder', text: 'There are no articles yet.')
  end
end
