# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html
get 'changelog_notes', :to => 'changelog_notes#index'
post 'changelog_notes', :to => 'changelog_notes#save'
