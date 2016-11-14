class Ui
  attr_reader :title, :location
  def get_input
    print "Enter job title: \n > "
    @title = gets.chomp
    print "Enter location: \n > "
    @location = gets.chomp
  end
end