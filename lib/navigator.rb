class Navigator
  attr_reader :location, :title
  def initialize(options={})

    @title = encode(options[:title])
    @location = encode(options[:location])
  end
  def encode(string)
    return "" if string == nil
    string.gsub(' ','+').gsub(',','%2C')
  end
  def url
    "https://www.dice.com/jobs?q=#{@title}&l=#{@location}"
  end
end