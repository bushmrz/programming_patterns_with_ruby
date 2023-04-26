require 'json'
require_relative './super_abstract_student.rb'
require_relative './converter.rb'
class Student < SuperAbstractStudent

  public_class_method :new
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

    validate
  end

  # валидаторы
  def self.valid_phone?(phone)
    phone.match(/^\+?[7,8] ?\(?\d{3}\)?-?\d{3}-?\d{2}-?\d{2}$/)
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

    fio_full = "fio: #{last_name}/#{first_name}/#{second_name};"
    all_contacts_info = ""
    if have_any_contact
      all_contacts_info += phone == nil ? "" : " phone: #{phone};"
      all_contacts_info += telegram == nil ? "" : " telegram: #{telegram};"
      all_contacts_info += mail == nil ? "" : " mail: #{mail};"
      all_contacts_info += git == nil ? "" :  " git: #{git};"
    end

    [fio_full, "#{id_info}", all_contacts_info].join("")
  end

  def have_any_contact
    phone != nil || telegram  != nil || mail != nil || git != nil
  end

  def validate
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

    raise "Incorrect string" if parse_info[:fio] == nil
    fio_split = parse_info[:fio].split("/")
    Student.new(
      last_name: fio_split[0],
      first_name: fio_split[1],
      second_name: fio_split[2],
      opt: parse_info
    )
  end

  def contacts_info
    if phone != nil
      "phone: #{phone}"
    elsif mail != nil
        "mail: #{mail}"
      elsif telegram != nil
          "telegram: #{telegram}"
        else ""
      end
  end
  def getInfo
    if id == nil
      "fio: #{fio_info} \t git: #{git} \t #{contacts_info}"
    else
      "id: #{id} \t fio: #{fio_info} \t git: #{git} \t #{contacts_info}"
    end
  end

  def self.from_hash(hash)

    raise ArgumentError,"Missing req fields" unless hash.key?(:last_name) && hash.key?(:first_name) && hash.key?(:second_name)
    last_name = hash.delete(:last_name)
    first_name = hash.delete(:first_name)
    second_name = hash.delete(:second_name)
    Student.new(last_name: last_name, first_name: first_name, second_name: second_name, opt: hash)
  end

end