require_relative 'ui'
require 'mechanize'

class Scraper

  def initialize
    @ui = Ui.new
  end

  def run
    @ui.get_input
    @nav = Navigator.new({title: @ui.title, location: @ui.location})
    scrape(@nav.url)
  end

  def scrape(url)
    agent = Mechanize.new
    # this gives your Mechanize object a 0.5 second wait time after every HTML request
    agent.history_added = Proc.new { sleep 0.5 }
    page = agent.get(url)
    page = page.links_with(href: /https:\/\/www.dice.com\/jobs\/detail/).map do |link| 
      link = [link.text.strip, link.uri]
    end
    puts page
  end

end

scraper = Scraper.new
scraper.scrape("https://www.dice.com/jobs?q=web+developer&l=&searchid=6432325194502")