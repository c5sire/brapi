% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ba_vendor_specifications.R
\name{ba_vendor_specifications}
\alias{ba_vendor_specifications}
\title{ba_vendor_specifications}
\usage{
ba_vendor_specifications(con = NULL, rclass = c("list", "json"))
}
\arguments{
\item{con}{list, brapi connection object}

\item{rclass}{character; default: "list" possible other values: "json"}
}
\value{
rclass as defined
}
\description{
Defines the plate format specification for the vendor.
}
\examples{
if (interactive()) {
  library(brapi)

  con <- ba_db()$testserver

  ba_vendor_specifications(con)
}
}
\references{
\href{https://github.com/plantbreeding/API/blob/V1.2/Specification/ExternalVendorSamples/Vendor_Specifications_GET.md}{github}
}
\author{
Reinhard Simon, Maikel Verouden
}
