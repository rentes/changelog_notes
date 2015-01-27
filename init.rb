Redmine::Plugin.register :changelog_notes do
  name 'Changelog Notes'
  author 'Miguel Rentes'
  description 'This is a plugin for Redmine that generates a Changelog PDF with your personal notes on issues you select from a particular product version.'
  version '0.0.1'
  url 'https://github.com/rentes/changelog_notes'
  author_url 'http://about.me/rentes'
  project_module :changelog_notes do
    permission :view_changelog_notes, :changelog_notes => :index
    permission :save_changelog_notes, :changelog_notes => :save
  end
  menu :project_menu, :changelog_notes, {:controller => 'changelog_notes', :action => 'index'}, :caption => 'Changelog Notes', :after => :activity, :param => :project_id
end