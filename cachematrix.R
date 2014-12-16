# Matrix inversion is usually a costly computation and their may be some benefit to 
# caching the inverse of a matrix rather than compute it repeatedly. These functions
# provide a way to build a cache for the inverse of a matrix, and retrive it from the cache 
# if it has been cached and the matrix is unchanged
# assumption : matrix is inversible

# this function creates a special "matrix", which is really a 
# list containing a function to
#   set the value of the matrix
#   get the value of the matrix
#   set the value of the inverse
#   get the value of the inverse
makeCacheMatrix <- function(x = matrix()) {
  # initialize
  i <- NULL
  
  # functions
  
  # sets a new value for the matrix and resets cached inverse
  set <- function(y) {
    x <<- y
    i <<- NULL
  }
  
  # gets matrix value
  get <- function() x
  
  # sets a new value for invers
  setinverse <- function(inverse) i <<- inverse
  
  # gets inverse from cache
  getinverse <- function() i
  
  # return list of functions
  list(set = set, 
       get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


# This function computes the inverse of the special "matrix" returned by makeCacheMatrix 
# above. If the inverse has already been calculated (and the matrix has not changed), then 
# the cachesolve will retrieve the inverse from the cache.
cacheSolve <- function(x, ...) {
  

  i <- x$getinverse()
  if(!is.null(i)) { # an inverse matrix is cached
    message("getting cached data")
    
    # return inversed matrix got from cache
    return(i)
  }

  # inverse is not cached, calculate new inverse and cache it
  # note : no test if matrix is inversable. it is responsability of calling function
  #        to check for this
  data <- x$get()
  i <- solve(data, ...)
  x$setinvers(i)
  
  # return inversed matrix
  i
}
