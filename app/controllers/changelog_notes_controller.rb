# The Changelog Notes Main Controller
class ChangelogNotesController < ApplicationController
  unloadable
  include ChangelogNotesControllerIssueHelper
  include ChangelogNotesControllerPDFHelper
  include ChangelogNotesControllerSaveHelper

  def index
    version_from_combobox
    project_id
    initialize_page_information
  end

  def save
    save_changes if params[:commit] == 'Save changes'
    generate_changelog_notes_pdf if params[:commit] == 'Save to PDF'
  end
end
