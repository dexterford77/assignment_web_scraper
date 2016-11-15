require 'csv'

class Saver

  def initialize(file_path)
    @path = file_path
    CSV.open(file_path, 'w+')
  end

  def new_line(arr)
    CSV.open(@path, 'a') do |csv|
      csv << arr
    end
  end

end
