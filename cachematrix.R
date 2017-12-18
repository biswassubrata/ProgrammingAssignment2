## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
# The main function will contain 4 subfunctions
#	a set function to set the value if a matrix
#	a get fcuntion to get the value of a matrix
#	a function to set the inverse of a matrix
#	a function to get the inverse of a matrix
makeCacheMatrix <- function(x = matrix()) {
	sol <- NULL
	set <- function (newx) {
		x <<- newx
		sol <<- NULL
	}
	get <- function () x
	setSolve <- function(newsol) sol <<- newsol
	getSolve <- function() sol
	list(set = set,
		 get = get,
		 setSolve = setSolve,
		 getSolve = getSolve)
}


## Write a short comment describing this function
# The function below will accept an object of the above type as parameter
# It will return the pre-calculated inverse of the matrix, if the data has not changed after
# the inverse of the matrix was calculated last. Otherwise iit will calculate the inverse of
# the matrix to return the inverse value and also will cache the calculated inverse

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
	sol <- x$getSolve()
	if (!is.null(sol)) {
		return(sol)
	}
	data <- x$get()
	sol <- solve(data, ...)
	x$setSolve(sol)
	sol
}
