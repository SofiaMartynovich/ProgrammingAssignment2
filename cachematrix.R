## Those functions are creating mechanism of inversion for martix that are
## invertible in general and caching inverted matrix


## This  function takes a martix as x and creates sequence of operarions 
## to inverse it.  There are such operations  as settting  entire matrix
## and inverted matrix which use arguments assigned not only for the
## environment of this particular function. Function returns list 
## of operations

makeCacheMatrix <- function(x = matrix()) {
 inv <- NULL
 set <- function (y) {
 x <<- y 
 inv <<- NULL
 }
 get <- function () x
 setinv <- function (solve) inv <<- solve
 getinv <- function () inv
 list (set = set, get = get, setinv = setinv, getinv = getinv)
}


## This  function takes makeCacheMatrix  as an argument, checks if x
## was already defined and gets inverted martix from that environment. 
## if x wasn't defined then it creates data in this environment and inverse it.
cacheSolve <- function(x, ...) {
inv <- x$getinv()
if(!is.null(inv)) {
message("getting cached data")
return(inv)
}
data <- x$get()
inv <- solve(data, ...)
x$setinv(inv)
inv
## Return a matrix that is the inverse of 'x'
}
