## The objective of the following two functions is to provide functionality 
## to store a matrix and compute its inverse, caching the inverse to avoid
## repeating expensive computing inverse alogrithms.

## makeCacheMatrix is a function that creates four functions to get and
## set the values of the matrix and its inverse in the global environment.
# Note that this function doesn't compute the inverted matrix, it simply retrieves
# it from the cache. Use function cacheSolve to compute the inverted matrix.
#
# Example:
# theMatrixObj <- makeCacheMatrix(x = matrix(rnorm(16), 4, 4)) # to create the matrix obj
# cacheSolve(theMatrixObj) # to generate the inverse
makeCacheMatrix <- function(x = matrix()) {
	inverse <<- NULL
	x <<- x # Although this was not in the base example, 
		# It's important to set the matrix in the global environment as well.
	set <- function (y) {
		x <<- y 
		inverse <<- NULL 
	}
	get <- function() {
		x
	}
	setInverse <- function(newInverse) {
		inverse <<- newInverse
	}
	getInverse <- function() {
		inverse
	}
	list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)

}

## cacheSolve takes the matrix object as an argument, it checks if the inverted 
## matrix has been computed and stored in the cache.
## if not, it computes it and stores the inverted matrix itin a cached variable.
## It finally returns the inverted matrix from the cache variable.
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
	if (is.null(x$getInverse())) {
		x$setInverse(solve(x$get()))
		message("inverse is null, computing it, and storing it")
	}
	inverse
}
