% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/tnum.graphics.R
\name{tnum.graphPathList}
\alias{tnum.graphPathList}
\title{Make and render a graph from a list of phrase paths}
\usage{
tnum.graphPathList(
  pathList = list(),
  rootLabel = "ROOT",
  levels = 10,
  style = "neato"
)
}
\arguments{
\item{pathList}{list of phrase path strings}

\item{rootLabel}{a lable for the root of the graph}

\item{levels}{limit for how many levels down paths to graph}

\item{style}{what DiagrammeR calls "layout" = tree,nicely,neato,kk, or fr}
}
\description{
Make and render a graph from a list of phrase paths
}
