% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/install-github.r
\name{install_github}
\alias{install_github}
\title{Attempts to install a package directly from GitHub.}
\usage{
install_github(repo, username = NULL, ref = "master", subdir = NULL,
  auth_token = github_pat(quiet), host = "https://api.github.com",
  quiet = FALSE, ...)
}
\arguments{
\item{repo}{Repository address in the format
\code{username/repo[/subdir][@ref|#pull]}. Alternatively, you can
specify \code{subdir} and/or \code{ref} using the respective parameters
(see below); if both are specified, the values in \code{repo} take
precedence.}

\item{username}{User name. Deprecated: please include username in the
\code{repo}}

\item{ref}{Desired git reference. Could be a commit, tag, or branch
name, or a call to \code{\link{github_pull}}. Defaults to \code{"master"}.}

\item{subdir}{subdirectory within repo that contains the R package.}

\item{auth_token}{To install from a private repo, generate a personal
access token (PAT) in \url{https://github.com/settings/tokens} and
supply to this argument. This is safer than using a password because
you can easily delete a PAT without affecting any others. Defaults to
the \code{GITHUB_PAT} environment variable.}

\item{host}{GitHub API host to use. Override with your GitHub enterprise
hostname, for example, \code{"github.hostname.com/api/v3"}.}

\item{quiet}{if \code{TRUE} suppresses output from this function.}

\item{...}{Other arguments passed on to \code{\link{install}}.}
}
\description{
This function is vectorised on \code{repo} so you can install multiple
packages in a single command.
}
\details{
Attempting to install from a source repository that uses submodules
raises a warning. Because the zipped sources provided by GitHub do not
include submodules, this may lead to unexpected behaviour or compilation
failure in source packages. In this case, cloning the repository manually
using \code{\link{install_git}} with \code{args="--recursive"} may yield
better results.
}
\examples{
\dontrun{
install_github("klutometis/roxygen")
install_github("wch/ggplot2")
install_github(c("rstudio/httpuv", "rstudio/shiny"))
install_github(c("hadley/httr@v0.4", "klutometis/roxygen#142",
  "mfrasca/r-logging/pkg"))

# Update devtools to the latest version, on Linux and Mac
install_github("r-lib/devtools")

# To install from a private repo, use auth_token with a token
# from https://github.com/settings/tokens. You only need the
# repo scope. Best practice is to save your PAT in env var called
# GITHUB_PAT.
install_github("hadley/private", auth_token = "abc")

}
}
\seealso{
\code{\link{github_pull}}

Other package installation: \code{\link{install_bioc}},
  \code{\link{install_bitbucket}},
  \code{\link{install_cran}}, \code{\link{install_git}},
  \code{\link{install_svn}}, \code{\link{install_url}},
  \code{\link{install_version}}, \code{\link{install}},
  \code{\link{uninstall}}
}
