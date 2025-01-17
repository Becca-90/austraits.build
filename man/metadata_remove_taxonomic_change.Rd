% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/setup.R
\name{metadata_remove_taxonomic_change}
\alias{metadata_remove_taxonomic_change}
\title{Remove a taxonomic change from a yaml file for a dataset_id}
\usage{
metadata_remove_taxonomic_change(dataset_id, find, replace = NULL)
}
\arguments{
\item{dataset_id}{identifier for a particular study in the AusTraits database}

\item{find}{taxonomic name to find}

\item{replace}{taxonomic name to replace with}
}
\value{
yml file with a taxonomic change removed
}
\description{
Remove a taxonomic change from a yaml file for a dataset_id
}
