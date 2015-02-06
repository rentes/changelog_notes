# The Controller Helper for saving the changes made in the changelog notes
module ChangelogNotesControllerSaveHelper
  include ChangelogNotesControllerIssueHelper

  # Saves the changes from the changelog notes input form
  def save_changes
    filter_issues_checked(params[:issue_id],
                          params[:issues_changelog_notes_descriptions],
                          params[:issues_check_box])
  end

  # from each issue listed on the form, if it is checked then
  # the note will be updated on the Redmine database
  def filter_issues_checked(issues_list, changelog_note, issues_checked)
    issues_list.each do |issue|
      if issues_checked[issue] == '1'
        save_issue_changelog_note(issue, changelog_note[issue])
      end
    end
  end

  # processes the request for updating the issue with a new changelog note
  def save_issue_changelog_note(issue, changelog_note)
    issue_to_update = Issue.find(issue)
    # updating the custom value 'Changelog Note'
    issue_to_update.custom_values.each do |custom_value|
      if custom_value.custom_field_id == changelog_notes_id && \
         custom_value.value != changelog_note
        custom_value.value = changelog_note
      end
    end
    issue_to_update.save
  end
end
