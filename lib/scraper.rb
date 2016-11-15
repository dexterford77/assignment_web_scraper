require_relative 'ui'
require_relative 'saver'
require_relative 'navigator'
require 'mechanize'

class Scraper

  def initialize
    @ui = Ui.new
    @csv = Saver.new("test.csv")
    @agent = Mechanize.new
    # this gives your Mechanize object a 0.5 second wait time after every HTML request
    @agent.history_added = Proc.new { sleep 0.5 }
  end

  def run
    @ui.get_input
    @nav = Navigator.new({title: @ui.title, location: @ui.location})
    scrape_all(@nav.url)
  end

  def scrape_all(url)
    p url
    page = @agent.get(url)
    page = page.links_with(href: /https:\/\/www.dice.com\/jobs\/detail/).map do |link|
      link = [link.text.strip, link.uri.to_s]
    end
    page.each_with_index do |line, index|
      if index.even?
        scrape_listing(line[1])
        @csv.new_line(line)
      end
    end
  end

  def scrape_listing(url)
    listing = @agent.get(url)
    p listing
  end

end

Scraper.new.run