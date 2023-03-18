# frozen_string_literal: true
require_relative './Student.rb'
require_relative './super_abstract_student.rb'
class Student_short < SuperAbstractStudent

  public_class_method :new
  attr_accessor :id, :fio, :git, :mail

  def initialize(id:, fio:, git:, mail:)
    @id = id
    @fio = fio

    fio_components = fio.split(".")
    self.last_name = fio_components[0]
    self.first_name = fio_components[1]
    self.second_name = fio_components[2]
    self.git = git
    self.mail = mail
  end

  def self.from_student(student)
    Student_short.new(
      id: student.id,
      fio: "#{student.last_name} #{student.first_name} #{student.second_name}",
      git: student.git,
      mail: student.mail
    )
  end

  def self.parse_str(id, string)
    parse_info = string.tr(" ",'').split(";").
      map{ |x|  x1, x2  = x.split(":")
      [x1.to_sym, x2] }.to_h

    Student_short.new(
      id: id,
      fio: parse_info[:fio],
      git: parse_info[:git],
      mail: parse_info[:mail]
    )
  end

  def contacts_info
    "Email: #{email}"
  end
  def to_s
    ["#{id_info}", "#{fio_info}","Гит: #{git}", "Почта: #{mail}"].join("\n")
  end
end
