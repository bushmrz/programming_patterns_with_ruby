require_relative './data_list.rb'
require_relative './data_table.rb'
require_relative '../templates/data_constructor.rb'
class DataListStudentShort < DataList
  attr_accessor :data_list

  def initialize(data:)
    super(data: data)
    self.filtered_name
    self.constructor
  end

  def filter_objs(filtered_name)
    self.filtered_name = filtered_name
  end

  def constuct_objs(constructor)
    self.constructor = constructor
  end

  def get_names
    filtered_name.action(data_list[0])
  end
  def get_data
    constructor.action( data_list,get_names)
  end

  private
  attr_accessor :filtered_name, :constructor
end
