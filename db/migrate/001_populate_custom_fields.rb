class PopulateCustomFields < ActiveRecord::Migration
  def self.up
    if CustomField.find_by_name('Changelog Note').nil?
      CustomField.create(name: 'Changelog Note', field_format: 'text')
    end
  end

  def self.down
    CustomField.find_by_name('Changelog Note').delete unless CustomField.find_by_name('Changelog Note').nil?
  end
end
