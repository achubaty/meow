#
#  meow by Alex M Chubaty and Kiri Whan
#  Copyright (C) 2015-2016
#



#' Get random pictures of cats. Meow!
#'
#' @description
#'
#' Queries \url{http://thecatapi.com} for cute cat photos and displays them in yor R session.
#'
#' Bug reports: https://github.com/achubaty/meow/issues
#'
#' @name meow-package
#' @docType package
#' @author Alex M. Chubaty \email{alex.chubaty@@gmail.com}
#' @author Kiri Whan\email{kiriwhan@@gmail.com}
#' @keywords package
NULL



#' Download and display a random picture of a cat.
#'
#' Downloads and plots a random cat image (jpg) from \url{http://thecatapi.com}.
#'
#' @return Invisibly returns logical, \code{TRUE} indicating success.
#'         Invoked for its side effect of displaying a cat picture.
#'
#' @author Alex Chubaty and Kiri Whan
#' @export
#' @importFrom graphics plot
#' @importFrom jpeg readJPEG
#' @importFrom utils download.file
#'
#' @examples
#' meow()
#'
meow <- function() {
  # get cat images
  url <- paste0("http://thecatapi.com/api/images/get?format=src&type=jpg&size=med")

  # download and plot the cat
  tmp <- tempfile()
  dl_status <- utils::download.file(url, tmp, quiet = TRUE, mode = "wb")

  pic <- jpeg::readJPEG(tmp)
  plot(1, type = "n", xlim = c(0, 1), ylim = c(0, 1), bty = "n",
       xaxt = "n", yaxt = "n", xlab = "", ylab = "")
  graphics::rasterImage(pic, 0, 0, 1, 1)
  rm_status <- file.remove(tmp)

  status <- all(!as.logical(dl_status), rm_status)
  return(invisible(status))
}
