class Student

  attr_accessor :id
  attr_reader :phone, :last_name, :first_name, :second_name,  :mail, :telegram, :git

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

    validate()
  end

  # валидаторы
  def self.valid_phone?(phone)
    phone.match(/^\+?[7,8] ?\(?\d{3}\)?-?\d{3}-?\d{2}-?\d{2}$/)
  end

  def self.valid_name?(name)
    name.match(/^[А-ЯA-Z][а-яa-z]+$/)
  end

  def self.valid_account?(account)
    account.match(/^@[A-Za-z0-9\-_]+$/)
  end

  def self.valid_mail?(mail)
    mail.match(/^[A-Za-z0-9\-_]+@[A-Za-z]+\.([A-Za-z]+\.)*[A-Za-z]+$/)
  end

  # сеттеры
  def phone=(phone)
    raise ArgumentError, "Incorrect value: phone=#{phone}! \t Correct format: +7 xxx-xxx-xx-xx" if !phone.nil? && !Student.valid_phone?(phone)

    @phone = phone
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

  def mail=(mail)
    raise ArgumentError, "Incorrect value: mail=#{mail}!" if !mail.nil? && !Student.valid_mail?(mail)

    @mail = mail
  end

  def git=(git)
    raise ArgumentError, "Incorrect value: git=#{git}!" if !git.nil? && !Student.valid_account?(git)

    @git = git
  end

  def telegram=(telegram)
    raise ArgumentError, "Incorrect value: telegram=#{telegram}!" if !telegram.nil? && !Student.valid_account?(telegram)

    @telegram = telegram
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

  def validate()
    if git == nil && !have_any_contact
      raise "Cant find git or other contacts for feedback :("
      end
  end

  def set_contacts(phone: nil, mail: nil, git: nil, telegram: nil)
    self.phone = phone if phone!=nil
    self.telegram = telegram if telegram!=nil
    self.mail = mail if mail!=nil
    self.git = git if git!=nil
  end

  def self.parse_str(string)
    parse_info = string.tr(" ",'').split(";").
      map{ |x|  x1, x2  = x.split(":")
      [x1.to_sym, x2] }.to_h

    raise "Incorrect string" if parse_info[:last_name] == nil || parse_info[:first_name] == nil || parse_info[:second_name] == nil

    Student.new(
      last_name: parse_info[:last_name],
      first_name: parse_info[:first_name],
      second_name: parse_info[:second_name],
      opt: parse_info
    )
  end

  def get_some_contact
    if phone != nil
      "Телефон: #{phone}"
    elsif mail != nil
        "Почта: #{mail}"
      elsif telegram != nil
          "Телеграм: #{telegram}"
        else ""
      end
  end
  def getInfo
    stud_fio = last_name + "." + first_name[0] + "." + second_name[0] + "."
    contact = get_some_contact

    "#{stud_fio} \t Гит: #{git} \t #{contact}"
  end

end