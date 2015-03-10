# NB : work in progress

## Put comments here that give an overall description of what your
## functions do



## This function takes a matrix as input, and returns a named list as output.
        # First, the function defines other functions (func_set, func_get, etc.)
        # Then, it returns a list, which named elements are the previously 
        #    defined functions.

makeCacheMatrix <- function(input_matrix = matrix()) {
        # initialize the cached inverse of the input mtrx
        cached_inverse <- NULL 
        
        # This function 
        func_set <- function(arg = matrix()) {
                input_matrix_B <<- arg
                cached_inverse <<- NULL
        }
        
        # This function calls ('get') the input/original matrix stored in a cache
        func_get <- function(){
                input_matrix
        }
        
        # This function takes the inverse of a matrix as an argument, and stores
        #    it in the variable 'cached_inverse' of the parent environment
        func_setInverse <- function(inverse){
                cached_inverse <<-inverse
        }
        
        # This function returns the variable 'cached_inverse'
        func_getInverse <- function(){
                cached_inverse
        }
        
        ## return a list made up of previous functions
        list(set_original = func_set, # "'name of the element' = 'function'"
             get_original = func_get,
             set_inverse = func_setInverse,
             get_inverse = func_getInverse
        )

}


## Write a short comment describing this function

cacheSolve <- function(input_cache, ...) {
        # 'read' the currently cached inverse: it is either the inverse of our 
        #    input_matrix, or NULL if it has not been already computed
        cached_inverse <- input_cache$get_inverse()
        
        # if the cached inverse *is not* NULL, (i.e. the inverse has already been
        #    computed), then returns directly the cached inverse, and we're done! 
        if(!is.null(cached_inverse)) {
                message("getting cached data, yipee!")
                return(cached_inverse)
        }
        # if not (i.e. the inverse *has not* been already computed), then :
        else{
                message("sorry, we've to compute the matrix")
                
                # get the original/input matrix and stores it in a variable
                matrix_to_compute <- input_cache$get_original()
                
                # compute the inverse (i.e. solve) of the original matrix
                computed_inverse <- solve(matrix_to_compute, ...)
                
                # save the freshly computed inverse in the cache, and returns it
                cache$set_inverse(computed_inverse)
                return(computed_inverse)
        }
}
