## creates a special matrix containing a list to 
## set, get, set the inverse, and get the inverse of a matrix

makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  get <- function() {x}
  setInverse <- function(inverse) {inv <<- inverse}
  getInverse <- function() {inv}
  list(set = set, get = get, 
       setInverse = setInverse, 
       getInverse = getInverse)
}


## calculates the inverse of the matrix created through makeCacheMatrix. 
## First checks to see if the inverse has been calculated to retrieve it, 
## and if not calculates the inverse

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  inv <- x$getInverse()
  if(!is.null(inv)){
    message("getting cached data")
    return(inv)
  }
  mat <- x$get()
  inv <- solve(mat, ...)
  x$setInverse(inv)
  inv
}


