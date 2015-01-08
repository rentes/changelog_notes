class ChangelogNotesController < ApplicationController
  unloadable


  def get_version_from_combobox
    @versions = Project.find(params[:project_id]).shared_versions
    @sorted_versions = Array.new
    @versions.each do |version|
      @sorted_versions.push(version.name.to_s)
    end
    @natural_sorted_versions = Naturalsorter::Sorter.sort_version(@sorted_versions, false)
    # the chosen version from the combo-box
    @version_selected_combo = params[:id].to_s
  end

  def get_project_id
    project_id_sql = "identifier = \"" + params[:project_id].to_s + "\""
    @project = Project.all(:conditions => [project_id_sql]).at(0)
  end

  def index
    get_version_from_combobox
    get_project_id
  end

  def save
  end
end
