## Two function with the purpose of storing the inverse matrix for performance enhancement

## The function makeCacheMatrix creates a list with three functions stores the original matrix 
## and creates a variable to store the inverse matrix.  
makeCacheMatrix <- function(x = matrix()) {

 ## create a variable to store the inverse matrix
  m <- NULL
  ## function to get the original matrix
  get <- function() x
  ## function to fill the m variable with the inverse matrix
  setInverse <- function(solve) m <<- solve
  ## function to get the inverse matrix
  getInverse <- function() m
  ## creation of the list with function for reuse in the function cacheSolve
  list(get = get,
       setInverse = setInverse,
       getInverse = getInverse)
}


## The function cacheSolve returns the inverse matrix. If the inverse matrix is already stored it will be returned 
## If not it process the inverse matrix and stores and return the result. 
cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  m <- x$getInverse()
  
  ## if m is not null return the stored inverse matrix
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  
  ## if m is null process the inverse matrix, store and return it
  data <- x$get()
  m <- solve(data, ...)
  x$setInverse(m)
  m
}








