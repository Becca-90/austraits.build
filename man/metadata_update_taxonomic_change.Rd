% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/setup.R
\name{metadata_update_taxonomic_change}
\alias{metadata_update_taxonomic_change}
\title{Update a taxonomic change into a yaml file for a dataset_id}
\usage{
metadata_update_taxonomic_change(
  dataset_id,
  find,
  replace,
  reason,
  taxonomic_resolution
)
}
\arguments{
\item{dataset_id}{identifier for a particular study in the AusTraits database}

\item{find}{original taxonomic name}

\item{replace}{updated taxonomic name to replace original taxonomic name}

\item{reason}{reason for change}
}
\value{
yml file with added substitution
}
\description{
Update a taxonomic change into a yaml file for a dataset_id
}
