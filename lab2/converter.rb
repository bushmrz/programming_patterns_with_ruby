require 'json'
class Converter
  private_class_method :new

  def convert_read(file_content)
    raise NotImplementedError, 'Abstract class!'
  end

  def convert_write(hash_students)
    raise NotImplementedError, 'Abstract class!'
  end
end

class ConverterTxt < Converter
  public_class_method :new

  def convert_read(data)
    result = []
    parse_info = string.tr(" ",'').split(";").
      map{ |x|  x1, x2  = x.split(":")
      [x1.to_sym, x2] }.to_h

    raise "Incorrect string" if parse_info[:fio] == nil
    hash =  parse_info.map{ |x |  x[:fio].split("/"); x.parse_info  }
    result << hash

    result
  end

  def convert_write(hash_students)
    string_arr = hash_students.map do |hash|
      hash.map{|k,v| "#{k}:#{v}"}.join(',')
    end.join("\n")
  end

end

class ConverterJSON < Converter
  public_class_method :new

  def convert_read(file_content)
    JSON.parse(file_content, {symbolize_names: true})
  end

  def convert_write(hash_students)
    JSON.pretty_generate(hash_students)
  end

end

require 'yaml'
require_relative 'Converter'
class ConverterYAML < Converter
  public_class_method :new

  def convert_read(file_content)
    YAML.safe_load(file_content).map{ |h| h.transform_keys(&:to_sym)}
  end

  def convert_write(hash_students)
    YAML.dump(hash_students.map{ |h| h.transform_keys(&:to_s)})
  end

end


