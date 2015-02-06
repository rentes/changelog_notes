# The Controller Helper that deals with bringing issue details
# from the database into the input form
module ChangelogNotesControllerIssueHelper
  # returns the Redmine project ID
  def project_id
    project_id_sql = "identifier = \"" + params[:project_id].to_s + "\""
    @@project = Project.all(conditions: [project_id_sql]).at(0)
  end

  # returns the version chosen from the plugin page combo-box
  def version_from_combobox
    @versions = Project.find(params[:project_id]).shared_versions
    @sorted_versions = []
    @versions.each do |version|
      @sorted_versions.push(version.name.to_s)
    end
    @natural_sorted_versions = \
    Naturalsorter::Sorter.sort_version(@sorted_versions, false)
    @@version_selected_combo = params[:id].to_s
  end

  # obtains all the necessary information from the Redmine database
  def initialize_page_information
    @issues = []
    @issues_have_changelog_notes = []
    @issues_status = []
    @issues_changelog_notes_descriptions = []
    initialize_issues_array unless @@version_selected_combo.nil?
  end

  # populates the issues array with information from the Redmine database
  # given the project ID and version ID
  def initialize_issues_array
    find_all_issues
  end

  # finding out all the issues of the project and version selected
  def find_all_issues
    version_id_sql = "project_id =\"#{@@project.id}\" " + \
                     "AND name = \"#{@@version_selected_combo}\""
    # obtaining the unique ID from the chosen project version
    version = Version.all(conditions: [version_id_sql]).at(0).id.to_s \
      if Version.all(conditions: [version_id_sql]) != []
    issues_sql = "project_id = \"#{@@project.id}\" " + \
                 "AND fixed_version_id = \"#{version}\""
    populate_issues_array(issues_sql)
  end

  # inserting data into the issues array
  def populate_issues_array(issues_sql)
    Issue.all(conditions: [issues_sql]).each do |issue|
      @issues.push(issue).sort! { |a, b| a.id <=> b.id }
      populate_other_information(issue)
    end
  end

  # inserting data into the status, changelog note description arrays and
  # the checkbox status array to see if the issue already has a changelog note
  def populate_other_information(issue)
    populate_issues_status(issue)
    populate_changelog_notes_description(issue)
    populate_issue_includes_changelog_notes(issue)
  end

  # inserting data into the status array
  def populate_issues_status(issue)
    @issues_status.push(IssueStatus.find_by_id(issue.status_id))
  end

  # inserting data into the changelog note description array
  def populate_changelog_notes_description(issue)
    issue.custom_values.each do |custom_value|
      if custom_value.customized_id == issue.id && \
         custom_value.custom_field_id == changelog_notes_id
        if !custom_value.value.nil?
          @issues_changelog_notes_descriptions.push(custom_value.value)
        else
          @issues_changelog_notes_descriptions.push('')
        end
      end
    end
  end

  # inserting true or false for the check-box status array
  def populate_issue_includes_changelog_notes(issue)
    if issue_includes_changelog_note(issue)
      @issues_have_changelog_notes.push(true)
    else
      @issues_have_changelog_notes.push(false)
    end
  end

  # returns the Custom Field ID for the custom field 'Changelog Note'
  def changelog_notes_id
    IssueCustomField.find_by_name('Changelog Note').id
  end

  # checking if the issue already has a custom value
  def issue_includes_changelog_note(issue)
    return false if issue.custom_values.length == 0
    issue_has_changelog_note(issue)
  end

  # checking if the existing custom field is the one containing
  # the 'Changelog Note' description data
  def issue_has_changelog_note(issue)
    issue.custom_values.each do |custom_value|
      false unless custom_value.custom_field_id == changelog_notes_id
    end
  end
end
