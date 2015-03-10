# NB : work in progress

## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        func_set <- function(y) {
                x <<- y
                m <<- NULL
        }
        func_get <- function(){
                x
        }
        func_setInvert <- function(invert){
                m <<-invert
        }
        func_getInvert <- function(){
                m
        }
        list(set = func_set,
             get = func_get,
             set_invert = func_setInvert,
             get_invert = func_getInvert
        )

}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        m <- x$get_invert()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- solve(data, ...)
        x$set_invert(m)
        m
}
