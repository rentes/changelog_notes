# The Changelog Notes Controller
class ChangelogNotesController < ApplicationController
  unloadable
  include ChangelogNotesControllerIssueHelper
  include ChangelogNotesControllerPDFHelper

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
  end
end
