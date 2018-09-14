## These functions will cache the inverse of a matrix -- by: sbrown827351


## This particular function creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
    inversematrix <- NULL
   set <- function(y) {
     x <<- y
      inversematrix <<- NULL
    }
    get <- function() x
    setinversematrix <- function(inverse) inversematrix <<- inverse
    getinversematrix <- function() inversematrix
    list(set = set, get = get,
         setinversematrix = setinversematrix,
         getinversematrix = getinversematrix)
  }


## This particular function computes the inverse of the 
## special matrix returned by function makeCacheMatrix

cacheSolve <- function(x, ...) {
        
  
    inversematrix <- x$getinversematrix()
    if(!is.null(inversematrix)) {
      message("getting cached data")
      return(inversematrix)
    }
    data <- x$get()
    inversematrix <- solve(data, ...)
    x$setinversematrix(inversematrix)
    inversematrix
  }  
  

