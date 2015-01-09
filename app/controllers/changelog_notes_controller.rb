class ChangelogNotesController < ApplicationController
  unloadable
  include ChangelogNotesControllerHelper

  def index
    get_version_from_combobox
    get_project_id
  end

  def save
  end
end
