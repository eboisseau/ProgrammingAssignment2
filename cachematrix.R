### Hi!
### The two hereinbelow defined functions are complementary. The first one
###    'makeCacheMatrix' creates the "cache" of the matrix given in argument: 
###    this cache is a list made up of function that :
###      - returns the original matrix (input argument)
###      - stores the inverse in a variable of the parent environment
###      - returns the inverse matrix
###
### The second take such a cache in argument, and it returns the inverse of the
###    matrix, without computing it if it has already been done before.



## This function takes a matrix as input, and returns a named list as output.
        # First, the function defines other functions (func_set, func_get, etc.)
        # Then, it returns a list, which named elements are the previously 
        #    defined functions.

makeCacheMatrix <- function(input_matrix = matrix()) {
        # initialize the cached inverse of the input mtrx
        cached_inverse <- NULL 
        
        # We deleted the 'set' function, since it is never used: neither here,
        #   nor in 'cacheSolve' function, nor in the assignment.
        
        # This function calls ('get') the input/original matrix stored in a cache
        funcGet <- function(){
                input_matrix
        }
        
        # This function takes the inverse of a matrix as an argument, and stores
        #    it in the variable 'cached_inverse' of the parent environment
        funcSetInverse <- function(inverse){
                cached_inverse <<-inverse
        }
        
        # This function returns the variable 'cached_inverse'
        funcGetInverse <- function(){
                cached_inverse
        }
        
        ## return 'the cache': a list made up of previous functions
        list(get_original = funcGet, # "'name of the element' = 'function'"
             set_inverse = funcSetInverse,
             get_inverse = funcGetInverse
        )

}



## This function takes a "cache vector" as imput, and returns the inverse of the
##    original matrix stored in the cache.
        # First, the function read the inverse matrix stored in the cache
        # If there is actually is such a matrix (and not 'NULL'), the function
        #    returns the result.
        # If not, the function computes the inverse, stores it in the cache, and
        #    returns the result.

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