
#' ba_markers_details
#'
#' Lists markers as result of a search.
#'
#' @param con brapi connection object
#' @param markerDbId character; marker id; default: 0
#' @param rclass character; default: tibble
#'
#' @author Reinhard Simon
#' @import httr
#' @import progress
#' @importFrom magrittr '%>%'
#' @references \href{https://github.com/plantbreeding/API/blob/master/Specification/Markers/MarkerDetailsByMarkerDbId.md}{github}
#'
#' @return data.frame
#' @example inst/examples/ex-ba_markers_details.R
#' @family markers
#' @family genotyping
#' @export
ba_markers_details <- function(con = NULL, markerDbId = "0", rclass = "tibble") {
    ba_check(con, FALSE, "markers/id")
    stopifnot(is.character(markerDbId))
    check_rclass(rclass)
    
    brp <- get_brapi(con)
    markers <- paste0(brp, "markers/", markerDbId)
    
    try({
        res <- brapiGET(markers, con = con)
        res <- httr::content(res, "text", encoding = "UTF-8")
        out <- dat2tbl(res, rclass)
        class(out) <- c(class(out), "ba_markers_details")
        return(out)
    })
}