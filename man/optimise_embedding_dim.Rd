% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/optimise-embedding-dim.R
\name{optimise_embedding_dim}
\alias{optimise_embedding_dim}
\title{Finds the optimal embedding dimensions and embedding lags for a series 'v'}
\usage{
optimise_embedding_dim(v, optimise.simplex = T, optimise.FNNdim = T,
  optimise.boxcountdim = T, min.embedding.dim = 2, max.embedding.dim = 10,
  orbital.lag = NULL, lag.max = ceiling(length(v) * 0.2),
  lag.method = "mi", embedding.lag = 1, plot.simplex.projection = F,
  return.all = T)
}
\arguments{
\item{v}{Numeric vector containing the series.}

\item{optimise.FNNdim}{Should false nearest neighbour criteria be applied?}

\item{optimise.boxcountdim}{Should box counting dimension criteria be applied?}

\item{orbital.lag}{The Theiler window. An orbital lag to avoid
temporal correlation. Defaults to NULL, in which case the orbital
lag is chosen as the first local minima of the autocorrelation
function (lag.method = "acf" or lag.method = "autocorrelationfunction")
or the lagged mutual information function (lag.method = "mi" or
lag.method = "mutual information").}

\item{lag.max}{The maximum number of lags for the autocorrelation
function (lag.method = "acf" or lag.method = "autocorrelation function")
or the mutual information function (lag.method = "mi" or
lag.method = "mutual information function").}

\item{lag.method}{The method to compute the orbital lag (Theiler window),
which excludes temporal neighbours to reduce correlation bias. Either
use the autocorrelation function (lag.method = "acf" or "autocorrelation")
or the lagged mutual information function (lag.method = "mi" or
"mutual information").}

\item{plot.simplex.projection}{Plot the results of the simplex projection?}

\item{exclude.first.col}{Should first column in data frame be dropped?}

\item{min.E}{The minimum embedding dimension to consider.}

\item{max.E}{The maximum embedding dimension to consider.}

\item{min.tau}{The minimum embedding lag to consider.}

\item{max.tau}{The maximum embedding lag to consider}
}
\value{
A data frame containing the optimal embeddings.
}
\description{
The function works by first finding the minimal embedding dimension E by
either the false nearest neighbours (FNN) method, or by Whitney's embedding
theorem (the minimum embedding dimension must be at least the first integer
dimension larger than the box counting dimension of the attractor). The
minimal embedding dimension found is then used as input for the simplex
projection algorithm, which estimates a suitable E by optimizing
self-prediciton.
}
\details{
Both pre-estimation methods may be used simultaneously. In this case, the
minimal embedding dimension is the maximum of the FNN and the boxcount
estimates. The final embedding dimension is then determined by simplex
projection over dimensions E:max.E.

If no optimization is done prior to simplex projection, optimization is
performed over dimensions min.E:max.E. min.E defaults to 2.

The embedding lag is estimated from the simplex projection routine.
}