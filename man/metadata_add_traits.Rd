% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/setup.R
\name{metadata_add_traits}
\alias{metadata_add_traits}
\title{For specified `dataset_id`, populate columns for traits into metadata}
\usage{
metadata_add_traits(dataset_id)
}
\arguments{
\item{dataset_id}{identifier for a particular study in the AusTraits database}
}
\description{
This functions asks users which traits they would like to keep, and adds a template 
for those traits in the metadata. This template must then be finished manually.
}
\details{
Can also be used to add a trait to an existing metadata file
}
