require 'spec_helper'

feature 'Easter Eggs' do

  scenario 'do exist' do
    visit lsp_path
    within("h1"){page.should have_content "LSP"}
  end

  scenario 'dynamically generate image' do
    visit lsp_path
    page.should have_css "#imageContainer"
  end

end

