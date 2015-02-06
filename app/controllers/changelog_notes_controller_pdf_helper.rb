# The Controller Helper that deals with saving the changelog notes to PDF
module ChangelogNotesControllerPDFHelper
  require 'prawn'
  include ChangelogNotesControllerIssueHelper

  attr_accessor :pdf

  # generate a PDF with the selected changelog notes
  def generate_changelog_notes_pdf
    @pdf = Prawn::Document.new
    @pdf.text "Changelog Notes for #{@@project} #{@@version_selected_combo}"
    @pdf.text ''
    filter_changelog_notes_checked(params[:issue_id],
                                   params[:issues_changelog_notes_descriptions],
                                   params[:issues_check_box])
    @pdf.render_file 'public/changelog_notes.pdf'
  end

  # from each issue listed on the form, if it is checked then
  # the note will be added to the PDF
  def filter_changelog_notes_checked(issues_list,
                                     changelog_note,
                                     issues_checked)
    issues_list.each do |issue|
      if issues_checked[issue] == '1'
        add_changelog_note_to_pdf(issue, changelog_note[issue])
      end
    end
  end

  # processes the request for adding the changelog note to the PDF
  def add_changelog_note_to_pdf(issue, note)
    @pdf.text "#{issue} - #{note}"
  end
end
