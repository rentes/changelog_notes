# The Controller Helper that deals with saving the changelog notes to PDF
module ChangelogNotesControllerPDFHelper
  require 'prawn'
  include ChangelogNotesControllerIssueHelper

  # generate a PDF with the selected changelog notes
  def generate_changelog_notes_pdf
    p "#{@@project} and version: #{@@version_selected_combo}"
    Prawn::Document.generate('public/hello.pdf') do
      text 'Hello World!'
    end
  end
end
