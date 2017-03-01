#' ba_genomemaps
#'
#' lists genomemaps available on a brapi server
#'
#' @param con brapi connection object
#' @param rclass string; default: tibble
#' @param species string; default:
#' @param type string, default: all
#' @param page integer; default 0
#' @param pageSize integer; default 30
#'
#' @author Reinhard Simon
#' @references \href{https://github.com/plantbreeding/API/blob/master/Specification/GenomeMaps/ListOfGenomeMaps.md}{github}
#' @return rclass as defined
#' @example inst/examples/ex-ba_genomemaps.R
#' @import tibble
#' @family genomemaps
#' @family genotyping
#' @export
ba_genomemaps <- function(con = NULL, species = "all", type = "all",
                       page = 0, pageSize = 30, rclass = "tibble") {
    # TODO: revision; rename: map
    ba_check(con, FALSE, "maps")
    brp <- get_brapi(con)
    genomemaps_list <- paste0(brp, "maps/?")
    species <- ifelse(species != "all", paste0("species=", species, "&"), "")
    type <- ifelse(type != "all", paste0("type=", type, "&"), "")
    page <- ifelse(is.numeric(page), paste0("page=", page, "&"), "")
    pageSize <- ifelse(is.numeric(pageSize), paste0("pageSize=",
                                                    pageSize, "&"), "")
    genomemaps_list <- paste0(genomemaps_list, page, pageSize, species, type)
    try({
        res <- brapiGET(genomemaps_list, con = con)
        res <- httr::content(res, "text", encoding = "UTF-8")
        if (rclass == "vector")
            rclass <- "tibble"
        out <- dat2tbl(res, rclass)
        class(out) <- c(class(out), "ba_genomemaps")
        return(out)
    })
}