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
    respond_to do |format|
      format.html
      format.pdf do
        generate_changelog_notes_pdf
      end
    end
  end

  def save
    save_changes if params[:commit] == 'Save changes'
  end
end
