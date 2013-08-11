
module Slashdot

  require 'httparty'

  # require 'slashdot/fetcher'
  # require 'slashdot/builder'
  # require 'slashdot/version'
  # require 'slashdot/collections'

  #---------------------------------------------------------------------
  # 1 - get http response
  # 2 - parse http response
  # 3 - get relevant part of response, composed of posting_anchors
  # 4 - create listing from each posting_anchors
  #
  # 5 - get http response of posting_anchor
  # 6 - parse http response of posting_anchor
  # 7 - get body anchors of posting
  # 8 - create url from each body anchor in posting
  #---------------------------------------------------------------------



# Slashdot has two main accessors: get_postings and get_postings_by(time).
# Slashdot fetches requests and has them parsed via Nokogiri.
# These parsed objects are instantiated as UrlCollections (Archive & Posting)
# The UrlCollections have accessors to return urls, title, author, commentcount


#---------------------------------------------------------------------
# POSSIBLE WORKFLOW

# require 'slashdot'
#
# sp = SlashdotApi::Slashdot.new
#
# sp.get_postings[_by()]
#   -- builds slashdot_postings
#   -- accessor Posting objects
# sp.get_urls
#   -- builds urls
#   -- accessor Url objects
# sp.save_postings
# - saves SP and Url instances to DB
#---------------------------------------------------------------------


  # 2 RESPONSIBILITIES
  # - http archive page response
  # - http posting page responses
  class Fetcher

    def get_postings
      @response = get_archive_urls
    end

    def get_postings_by(timeframe=nil)
      # TODO: parse timeframe to something useable
      @response = get_archive_urls(timeframe)
    end

    private

    def get_archive_urls(timeframe=nil)
      # first 21 anchors are nav links
      first_anchor = 21

      if timeframe
        request_count = timeframe + first_anchor - 1 # -1 == index 0
      end
      # default: all archive_urls on page (skip last where href='page 2')
      request_count ||= -2

      # HTTP fetch
      response = HTTParty.get(archive_url)

      # turn http into nokogiri-style doc
      # parse(response)
      archive_urls = ArchiveUrlCollection.new()
      # extract urls (call parse within the collection?)

      return archive_urls

    end

    def get_posting_urls
    end

    def archive_url
      return 'http://slashdot.org/archive.pl?op=bytime&keyword=&week'
    end

  end


  # open each slashdot discussion link as 'posting'
  def parse(posting)
    @document = Nokogiri::HTML(posting)
  end

  #------

  class Builder
    # creates 2 things:
    # - slashdot_postings
    # - urls

    # find/init SlashdotPosting.new instance from each posting_url
    def build_posting(permalink)

      # TODO: REMOVE, this should not be using DB YET, just creating in memory
      # new_posting = SlashdotPosting.find_by(permalink: permalink)

      if new_posting.blank?
        # build_url( , permalink)
      end
    end

    # builds single url and associates with slashdot postings
    def build_url(url, permalink)
      # permalink == slashdot_posting.permalink
    end

  end

end
