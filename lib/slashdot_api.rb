#----------------------------------------------------------------------
# SlashdotApi v1.0
#
# - scrapes Slashdot to build DB objects SlashdotPostings and Urls
# each has_many of the other. Validates presence of permalink/target_url
# and uniqueness.
#
# part of DiscussIt project
#
# http://github.com/theoretick/discussit
#----------------------------------------------------------------------
require 'nokogiri'
require 'httparty'


class SlashdotApi
#----------------------------------------------------------------------
# GET req slashdot archive page
# GET permalinks to recent slashdot stories
# finds or creates SlashdotPosting objects from permalinks
# finds or creates Url objects from each permalink-body's anchors
#----------------------------------------------------------------------

  def initialize
  end

  def get_postings(timeframe='w')

    # first 21 anchors are nav links
    first_anchor = 21
    archive_url = 'http://slashdot.org/archive.pl?op=bytime&keyword=&week'

    # quicktest for integerness from string (i.e. '5')
    if timeframe.to_i.to_s == timeframe
      request_count = timeframe.to_i + first_anchor - 1 # -1 == index 0
    end

    # default: all archive_urls on page (skip last where href='page 2')
    request_count ||= -2

    response = HTTParty::get(archive_url)
    doc = Nokogiri::HTML(response.body)

    # array of slashdot posting urls from archive page
    archived_postings = doc.css('div.grid_24 a')[first_anchor..request_count]

    # counter for rake-task display of progress percentage
    archived_count = archived_postings.length
    puts "Fetching #{archived_count} results..."

    parent_body_anchors = []
    archived_postings.each { |anchor| parent_body_anchors << anchor.attribute("href").to_s }

    # go through each posting on archive page, traverse HTML,
    # and create SlashdotPosting instance
    parent_body_anchors.each_with_index do |anchor, index|
      permalink = 'http:' + anchor
      posting_urls = []

      # find/init SlashdotPosting.new instance from each posting_url
      s = SlashdotPosting.find_by(permalink: permalink)

      if s.blank?

        # open each slashdot discussion link as 'posting'
        posting = HTTParty::get(permalink)


        def parse(posting)
          @document = Nokogiri::HTML(posting)
        end

        parse(posting)
        # builds posting_url array with relevant body anchors that aren't slashdot
        @document.css('div.body a').each do |body_anchor|
          body_url = body_anchor.attribute("href").to_s
          posting_urls << body_url
        end

        # dont bother creating a listing if no links; i.e. "Ask Slashdot" posts
        unless posting_urls.empty?

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

          s = SlashdotPosting.new

          s.site          = "slashdot"
          s.permalink     = permalink
          s.title         = title
          s.author        = author
          s.comment_count = comment_count
          s.post_date     = post_date

          s.save

          # find/init Url.new instance from each url in posting's body
          # and associate with SlashdotPosting instance
          posting_urls.each do |url|
            u = Url.find_or_initialize_by(target_url: url)
            u.slashdot_postings << SlashdotPosting.find_or_initialize_by_permalink(s.permalink)
            puts ">  Saving associated URL: '#{url}'."
            u.save
          end
        end
      end
    end # end of parent_body_anchors block
  end

end

########################
#----------------------------------------------------------------------
# initialization is blank? probably
# MODEL FETCHER METHODS AFTER RAKE TASKS -- TASK SHOULD CALL SINGLE METHOD
# get_postings() takes a count
# get_latest()
########################


module Slashdot

    # 1 - get http response
    # 2 - parse http response
    # 3 - get relevant part of response, composed of posting_anchors
    # 4 - create listing from each posting_anchors
    #
    # 5 - get http response of posting_anchor
    # 6 - parse http response of posting_anchor
    # 7 - get body anchors of posting
    # 8 - create url from each body anchor in posting

  #------

  class Fetcher

  end

  #------

  class Parser
    # builds url array
    def count_chocula(nokogiri_doc)
      nokogiri_doc.css('div.body a').each do |body_anchor|
        body_url = body_anchor.attribute("href").to_s
        posting_urls << body_url
      end
    end


    def parse(posting)
      # open each slashdot discussion link as 'posting'
      @document = Nokogiri::HTML(posting)
    end

  end

  #------

  class Builder
    # creates 2 things:
    # - slashdot_postings
    # - urls

    def build_posting(permalink)
      # find/init SlashdotPosting.new instance from each posting_url
      s = SlashdotPosting.find_or_initialize_by_permalink(permalink)
      if s.new_record?
        #help
      end
    end

    # builds single url and associates with slashdot postings
    def build_url(url, permalink)
      u = Url.find_or_initialize_by_target_url(url)
      u.slashdot_postings << SlashdotPosting.find_or_initialize_by_permalink(permalink)
      u.save
    end

  end

  #------

  class Validator
    # validates candidacy of posting or url buildage
    def has_urls?(permalink)
      #
    end
  end


end


