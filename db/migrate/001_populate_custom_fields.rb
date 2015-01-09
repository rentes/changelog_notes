class PopulateCustomFields < ActiveRecord::Migration
  def self.up
    if IssueCustomField.find_by_name('Changelog Note').nil?
      IssueCustomField.create(name: 'Changelog Note', field_format: 'text', searchable: '1')
    end
  end

  def self.down
    IssueCustomField.find_by_name('Changelog Note').delete unless IssueCustomField.find_by_name('Changelog Note').nil?
  end
end
