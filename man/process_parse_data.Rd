% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/process.R
\name{process_parse_data}
\alias{process_parse_data}
\title{Process a single dataset}
\usage{
process_parse_data(data, dataset_id, metadata, contexts)
}
\arguments{
\item{data}{tibble or dataframe containing the study data}

\item{dataset_id}{identifier for a particular study in the AusTraits database}

\item{metadata}{yaml file with metadata}

\item{contexts}{dataframe of contexts for this study}
}
\value{
tibble in long format with AusTraits formatted trait names, trait
substitutions and unique observation id added
}
\description{
Process a single dataset with `dataset_id` using the associated `data.csv` and
`metadata.yml` files. Adds a unique observation id for each row of observation,
trait names are formatted using AusTraits accepted names and trait substitutions
are added. `parse data` is used in the core workflow pipeline (i.e. in `load study`).
}
