require 'rspec'
require 'navigator'

describe Navigator do

  describe "#new" do

    it "receives a hash of options and returns a URL" do
      p options = {title: "Engineer"}
      engie = Navigator.new(options)
      expect(engie.url).to start_with("https://www.dice.com/jobs?q=Engineer")
    end

    it "converts a city & state pair into a URL-compatible format" do
      ny = Navigator.new({location: "New York, NY"})
      expect(ny.location).to eq("New+York%2C+NY")
    end

    it "handles both a title and a location" do
      nav = Navigator.new({title: "Engineer", location: "New York, NY"})
      expect(nav.url).to eq("https://www.dice.com/jobs?q=Engineer&l=New+York%2C+NY")
    end

  end

end