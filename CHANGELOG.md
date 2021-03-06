## 0.4.1 (2013-08-14)

* spec refactoring
* better DiscussItAPI version handling, default to latest
* minor css tweaks

## 0.4.0 (2013-08-11)

* discuss_it is now a module, subdivided and elegantly clean
* changed background image to pure-css with linear-gradient

## 0.3.6 (2013-08-03)

* added more tests for discuss_it. Now full coverage for app-side.

## 0.3.6 (2013-08-01)

* added many rescues for HTTP timeouts and nil responses, far more robust
* cleaned up and updated comments

## 0.3.5 (2013-07-30)

* deleted extra scaffolding files and coffee-script crap [theoretick]
* added nokogiri to gemfile, whoops
* better comments
* moved inline style into SCSS
* added favicon
* now deployed on dual heroku instances which query themselves. crazzyy

## 0.3.5 (2013-07-28)

* Updated README with word-choice changes, twitter and github links, and bookmarklet [theoretick]
* More robust slashdot fetching, cleaner code, now idempotent, less hackery
* colorized rake tasks! whooo doggy!

## 0.3.5 (2013-07-27)

* Preliminary support for slashdot links
  - DiscussIt app queries concurrent webrick instance for serving slashdot DB postings
  - slashdot scrapper populates DB with raketask
  - currently returns any slashdot discussion if found in DB
  - slashdot_postings has_many urls
* cleaner discuss_it_api code
* better comments appwide
* added CHANGELOG

## 0.3.3 (2013-07-26)

* updated README [CodingAntecedent]

## 0.3.2 (2013-07-25)

* now suggested searches on homepage [CodingAntecedent]

## 0.3.0 ()

* APIv3 -- YA rewrite better, even more OOPy [theoretick]
* Prettier pages sitewide, now w/ FlatUI
* full unittest suite for APIv3

## 0.2.0 ()

* APIv2 -- much much better, more OOPy
* full unittest suite for APIv2 [CodingAntecedent]

## 0.1.0 ()

* support HN searches
* support Reddit searches
* all queries live
