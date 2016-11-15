require 'csv'

class Saver

  def initialize(file_path)
    @path = file_path
    CSV.open(file_path, 'w+')
  end

  def new_line(array)
    CSV.open(@path, 'a') do |csv|
      csv << array
    end
  end

end
