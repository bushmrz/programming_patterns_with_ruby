require_relative './data_list.rb'
require_relative './data_table.rb'
require_relative '../templates/filters.rb'
require_relative '../templates/default_data_constructor.rb'
class DataListStudentShort < DataList
  attr_accessor :data_list

  attr_accessor :filtered_name, :constructor
  def initialize(data:, filtered_name:,constructor:)
    super(data: data)
    self.filtered_name = filtered_name
    self.constructor = constructor
  end

  def get_names
    filtered_name.action(data_list[0])
  end
  def get_data
    constructor.action( data_list,get_names)
  end
end
