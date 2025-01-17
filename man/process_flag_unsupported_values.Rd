% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/process.R
\name{process_flag_unsupported_values}
\alias{process_flag_unsupported_values}
\title{Flag values outside of allowable range}
\usage{
process_flag_unsupported_values(data, definitions)
}
\arguments{
\item{data}{tibble or dataframe containing the study data}

\item{definitions}{definitions read in from the traits.yml file in the config folder}
}
\value{
tibble with flagged values outside of allowable range, unsupported categorical
trait values or missing values
}
\description{
Flags any values that are outside the allowable range defined in the 
traits.yml file. NA values are flagged as errors.
}
