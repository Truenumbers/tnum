% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/twitterutilities.R
\name{tnum.twitteR.post_tweets_as_tnums}
\alias{tnum.twitteR.post_tweets_as_tnums}
\title{Post new tnums from twitteR query result

tnums for each tweet:
 1. tnum for full text
 2. tnum for create date
 3. tnum for favorite count (not present if 0)
 4. tnum for retweet count (not present if 0)
 5  tnum for replied-to tweet subject (not present if not a reply)
 6. tnum for user location

tags for each tweet:
 1. tagged if retweet
 2. tagged if truncated
 3. tagged with user device}
\usage{
tnum.twitteR.post_tweets_as_tnums(tweetList, customTags = list())
}
\arguments{
\item{tweetList}{List of tweets as returned from twitteR::Search()}
}
\value{
return code of tnum.maketruenumbers call
}
\description{
Post new tnums from twitteR query result

tnums for each tweet:
 1. tnum for full text
 2. tnum for create date
 3. tnum for favorite count (not present if 0)
 4. tnum for retweet count (not present if 0)
 5  tnum for replied-to tweet subject (not present if not a reply)
 6. tnum for user location

tags for each tweet:
 1. tagged if retweet
 2. tagged if truncated
 3. tagged with user device
}
