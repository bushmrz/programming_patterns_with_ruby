# frozen_string_literal: true
require_relative './Student.rb'
class Student_short < Student
  attr_reader :id, :fio, :git, :mail

  def initialize(id:, fio:, git:, mail:)
    @id = id
    @fio = fio
    self.git = git
    self.mail = mail
  end

  def self.from_student(student)
    Student_short.new(
      id: student.id,
      fio: "#{student.last_name}.#{student.first_name.upcase[0]}.#{student.second_name.upcase[0]}.",
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
  def to_s
    if id != nil
      id_info = "ID: #{id}"
      else id_info = ""
    end

    fio_info = "ФИО: #{fio}"

    [id_info, fio_info,"Гит: #{git}", "Почта: #{mail}"].join("\n")
  end
end
