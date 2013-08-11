require 'nokogiri'

module SlashdotApi

  class Page < Nokogiri::HTML::Document

    attr_accessor :document

    def initialize(http_response)
      @document = self.parse(http_response)
    end

    def urls
      return extract_urls(urls_selector)
    end

    private

    # builds url array from page anchors
    def extract_urls(collection)
      collection.css(collection.urls_selector).each do |body_anchor|
        page_url = body_anchor.attribute("href").to_s
        page_urls << page_url
      end
      return page_urls
    end

  end

  #----------------------------------------------------------------

  class ArchivePage < Page

    def urls_selector
      return 'div.grid_24 a'
    end

  end

  class PostingPage < Page

    def urls_selector
      return 'div.body a'
    end


    def title
      return @document.css('title').text
    end

    def author
      return @document.css('header div.details a').text
    end

    def comment_count
      return @document.css('span.totalcommentcnt').first.text
    end

    def post_date
      # FIXME: parse date into something useable, currently "on Sunday July 21, 2013 @01:51PM"
      return @document.css('header div.details time').text
    end

  end

end