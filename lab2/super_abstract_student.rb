# frozen_string_literal: true
class SuperAbstractStudent

  private_class_method :new

  attr_accessor :last_name, :first_name, :second_name, :id
  def initialize(last_name, first_name, second_name, id)
    self.last_name = last_name
    self.first_name = first_name
    self.second_name = second_name
    self.id = id
  end
  def self.valid_name?(name)
    name.match(/^[А-ЯA-Z][а-яa-z]*$/)
  end

  def last_name=(last_name)
    raise ArgumentError, "Incorrect value: last_name=#{last_name}!" if !last_name.nil? && !Student.valid_name?(last_name)

    @last_name = last_name
  end

  def first_name=(first_name)
    raise ArgumentError, "Incorrect value: first_name=#{first_name}!" if !first_name.nil? && !Student.valid_name?(first_name)

    @first_name = first_name
  end

  def second_name=(second_name)
    raise ArgumentError, "Incorrect value: second_name=#{second_name}!" if !second_name.nil? && !Student.valid_name?(second_name)

    @second_name = second_name
  end

  def fio_info
    "#{last_name} #{first_name.upcase[0]}.#{second_name.upcase[0]}"
  end

  def id_info
    if id != nil
      "id: #{id};"
    else ""
    end
  end
  def self.parse_str(string)
    raise "method not implemented"
  end

  def getInfo
    raise "method not implemented"
  end

  def contacts_info
    raise "method not implemented"
  end
end
