class Student

  attr_accessor :id, :last_name, :first_name, :second_name,  :mail, :telegram, :git
  attr_reader :phone

  # конструктор
  def initialize(last_name:, first_name:, second_name:, opt: {})
    self.last_name = last_name
    self.first_name = first_name
    self.second_name = second_name
    self.id = opt[:id]
    self.phone = opt[:phone]
    self.mail = opt[:mail]
    self.telegram = opt[:telegram]
    self.git = opt[:git]
  end

  # валидатор номера телефона
  def self.valid_phone?(phone)
    phone.match(/^\+?[7,8] ?\(?\d{3}\)?-?\d{3}-?\d{2}-?\d{2}$/)
  end

  # сеттер
  def phone=(phone)
    raise ArgumentError, "Incorrect value: phone=#{phone}! \t Correct format: +7 xxx xxx-xx-xx" if !phone.nil? && !Student.valid_phone?(phone)

    @phone = phone
  end
  def to_s
    if id != nil
      id_info = "ID: #{id}"
    end

    fio_info = "ФИО: #{last_name} #{first_name} #{second_name}"

    if have_any_contact
      contacts_info = "Контакты:"

      contacts_info += phone == nil ? "" : "\n\tТелефон: #{phone}"
      contacts_info += telegram == nil ? "" : "\n\tТелеграм: #{telegram}"
      contacts_info += mail == nil ? "" : "\n\tПочта: #{mail}"
      contacts_info += git == nil ? "" :  "\n\tГит: #{git}"
    end

    [id_info, fio_info, contacts_info].join("\n")
  end

  def have_any_contact
    phone != nil || telegram  != nil || mail != nil || git != nil
  end
end