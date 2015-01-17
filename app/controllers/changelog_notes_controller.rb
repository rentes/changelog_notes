# The Changelog Notes Controller
class ChangelogNotesController < ApplicationController
  unloadable
  include ChangelogNotesControllerHelper

  def index
    version_from_combobox
    project_id
  end

  def save
  end
end
