#' Download and display a random picture of a cat.
#'
#' Downloads and plots a random cat image (jpg) from <https://thecatapi.com>.
#'
#' @return Invisibly returns logical, `TRUE` indicating success.
#'         Invoked for its side effect of displaying a cat picture.
#'
#' @author Alex Chubaty and Kiri Whan
#' @export
#'
#' @examples
#' meow()
#'
meow <- function() {
  # get cat images
  url <- paste0("https://thecatapi.com/api/images/get?format=src&type=jpg&size=med")

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
