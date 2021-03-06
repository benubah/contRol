% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/connect.R
\name{connect}
\alias{connect}
\title{Block diagram interconnections of dynamic systems}
\usage{
connect(sysapp, q, inputs, outputs)
}
\arguments{
\item{sysapp}{A state-space system containing several appended systems returned from the \code{\link{append}} function.
All appended systems must be in state-space model.}

\item{q}{Matrix that specifies the interconnections of the block diagram. Each row specifies a connection.
The first element of each row is the number of the block. The other following elements of each row specify where the  block gets its summing inputs, with negative elements used to
indicate minus inputs to the summing junction.
For example: cbind(2,1,3) means that block 2 has an input from block 1 and block 3}

\item{inputs}{A column matrix specifying the inputs of the resulting aggregate system}

\item{outputs}{A column matrix specifying the outputs of the resulting aggregate system}
}
\value{
Returns the interconnected system, returned as either a state-space model
}
\description{
\code{connect} is used to form a state-space model of a system from its block diagram.
}
\details{
\code{connect}
 This function requires calling the \code{\link{append}} function to group a set of unconnected dynamics system
 in one system object. It then uses the \code{q} matrix to determine the interconnections between the systems
 and finally specifies the inputs and outputs for the new aggregate system.
 This approach helps to realize a block diagram as a single system on which further analysis could be performed.
 See examples below.
}
\examples{
a1 <- rbind(c(0, 0), c(1,-3))
b1 <- rbind(-2,0)
c1 <- cbind(0,-1)
d <- as.matrix(0)
a2 <- as.matrix(-5)
b2 <- as.matrix(5)
c2 <- as.matrix(1)
d2 <- as.matrix(0)
sysa1 <- ss(a1, b1, c1, d)
sysa2 <- ss(a2, b2, c2, d2)
al <- append(sysa1, sysa2)
connect(al, cbind(2,1,0), cbind(1,2), cbind(1,2))
## OR
connect(append(sysa1, sysa2), cbind(2,1,0), cbind(1), cbind(2))
 \dontrun{
cbind(2,1,0) means that block 2 has an input from block 1 and block 0 (which doesnt exist)
cbind(1) means that block 1 is the input of the system, and cbind(2) means block 2 is the
output of the system.
if we replace cbind(2) with cbind(1,2), this means that the system has two outputs from
block 1 and 2
i.e. \\code{connect(append(sysa1, sysa2), cbind(2,1,0), cbind(1), cbind(1,2))}
}
}
\seealso{
\code{\link{append}} \code{\link{series}} \code{\link{parallel}} \code{\link{feedback}}
}
