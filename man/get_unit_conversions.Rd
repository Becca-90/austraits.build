% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/process.R
\name{get_unit_conversions}
\alias{get_unit_conversions}
\title{Make unit conversion functions}
\usage{
get_unit_conversions(filename)
}
\arguments{
\item{filename}{name of file containing unit conversions}
}
\value{
list of conversion functions
}
\description{
Make unit conversion functions
}
\examples{
\dontrun{
get_unit_conversions("config/unit_conversions.csv")
}
}
