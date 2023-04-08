## TNUM Utilities

tokenize <- function(aString){
  tok <- str_replace_all(str_trim(aString, side= "both"),"\\s+","_")
  tok <- str_replace_all(tok,"[^a-zA-Z0-9'_]","-")
}

#######################################################
#'@title parse a phrase as path
#'
#' @param phr   phrase string
#' @return path string
#' @export

tnum.parsePhrase <- function(phr){
  splt <- strsplit(phr,"\\s", fixed = FALSE)[[1]]
  #splt <- lapply(splt,tokenize)
  splt <- rev(splt)
  splt <- paste(splt,collapse = ":")
  splt <- str_replace_all(splt,":of:","/")
  return(splt)
}

########################################################
#' @title load libraries required by TNUM
#' @export

tnum.loadLibs <- function(){
  library(tnum)
  library(jsonlite)
  library(httr)
  library(lubridate)
  library(stringr)
  library(knitr)
}


#######################################################
#' @title ingest a data frame as  truenumbers from templates
#'
#' @concept For each row in the dataframe, a set of tagged truenumbers can be generated and posted based ona list of templates.
#'          Templates are TNs and tags specified as strings, containing special macros that refer to column values of the row.
#'          Thus, for example, ingesting a data frame of 10 columns and 100 rows, using a list of 3 templates, would produce
#'          3 TNs per row, or 300 TNs.
#'
#' @param df  the data frame, as returned by read.csv() for example
#'
#' @param templates a list of string pairs, the first is a TN template, the second is a tag list template
#'        TN template is a truenumber sentence including "macros" to be replace by row data values
#'        Tag list template is a comma-separated string of tag paths, including macros as well.
#'        Macros are of the form $funcName(column name), or $(column name).  The column value is substituted
#'        for the macro.  If a function name is present, that function processes the column value before substitution.
#'
#'
#' @param nocache  if TRUE, the server's caching mechanism will not be used.  Every TN will be separately posted instead
#'                 of cached so that 500 TN at a time can be posted in one call.
#'
#' @export
#'

tnum.ingestDataFrame <- function(df,
                                 templates = list()
                                 ){

  ######### local fns
  tkn <- function(val){
    #if value is mode character, quote it as a string
    if(!is.na(val) && is.character(val)){
      #val <- str_replace_all(val,"â€“", "" )
      #val <- str_replace_all(val,"â€¦", "" )
      val <- str_replace_all(val,"\\s+", "_" )
      val <- str_replace_all(val,"[:/]", "." )
      val <- str_replace_all(val,"[^a-zA-Z0-9_.]", "" )
    }
    return(val)
  }

  dateTkn <- function(){
    dt <- date()
    return(tkn(dt))
  }

  doTemplates <- function(macros, tmplt, theRow){
    for(macro in macros[[1]]){
      fn <- str_extract(macro,"\\$.*\\(")
      if(nchar(fn) > 2) {
        fn <- substring(fn,2,nchar(fn)-1)
      } else {
        fn <- ""
      }
      mac <- str_extract(macro,"\\(.+\\)")
      mac <- substring(mac,2,nchar(mac)-1)
      if(is.na(mac) || nchar(mac) > 0){
        vl <- theRow[[mac]]
      } else {
        vl <- ""
      }

      if(nchar(fn) > 0){
        # there is a function call to process the value
        if(!is.na(mac) && nchar(mac) > 0){
          theExp <- paste0(fn,"(vl)")
        } else {
          theExp <- paste0(fn,"()")
        }
        vl <- eval(parse(text = theExp))
      }
      tmplt <- gsub(macro,vl,tmplt,fixed = TRUE)
    }
    return(tmplt)
  }
  ############## end local fns

  theFile <- NULL
  dfRows <- dim(df)[[1]]
  dfCols <- dim(df)[[2]]
  dfTemps <- length(templates)
  doCache <- FALSE
  tnCount <- 0


  for(i in 1:dfRows){

    for(pair in templates){
        tnT <- pair[[1]]
        tagT <- pair[[2]]

        macros <- str_extract_all(tnT,"\\$[a-zA-Z0-9_]*(\\([a-zA-Z0-9_\\s]*\\))")
        tnT <- doTemplates(macros,tnT, df[i,])

        macros <- str_extract_all(tagT,"\\$[a-zA-Z0-9_]*(\\([a-zA-Z0-9_]*\\))")
        tagT <- doTemplates(macros,tagT, df[i,])
        tagList <- list()
        if(nchar(tagT)>0){
          tagList <- str_split(str_replace_all(tagT,"\\s+",""), ",")
          tagList <- as.list(tagList[[1]])
        }
       tnum.postStatement(tnT, tagList)
        tnCount <- tnCount + 1

      }
  }

    print(paste0(tnCount, " TNs written "))



}

########################################################
#'@title Get length of path
#'
#' @param path  phrase path
#' @returns number of segments
#' @export
#'

tnum.pathLength <- function(path){
  return(str_count(path,":|/") + 1)
}

########################################################
#'@title Get subpath of length N
#'
#' @param path the path
#' @param n length of desired sub-path
#' @return first n terms of path.
#' @export
#'

tnum.subPath <- function(path, n=1){
  p <- str_locate_all("foo:bar/blatz:biff/nod",":|/")
  return(substr(path,0,p[[1]][,1][[n]]-1))
}


