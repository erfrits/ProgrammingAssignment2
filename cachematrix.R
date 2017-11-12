## Functions for fast calculation the inverse of a matrix using cached values 

## function for creating set/get functions for caching and retieveing a matrix and its inverse 

makeCacheMatrix <- function(x = matrix()) {
    # inicialize the cached invert matrix
    inv <- NULL
    
    # define the set function
    set <- function(y) {
        # store the received value (matrix) locally
        x <<- y
        # no cached vaue set
        inv <<- NULL
    }
    
    # define the get function
    get <- function() {
        # return the matrix itself
        x
    }
    
    # define set inverse function
    setInverse <- function(inverseValue) {
        # store the received value locally
        inv <<- inverseValue
    }
    
    # define get inverse function
    getInverse <- function(){
        # retun the cached inverse
        inv
    }
    
    # return the list of functions
    list(set = set, get = get,
         setInverse = setInverse,
         getInverse = getInverse
    )

}


## function for creating the inverse of the matrix 'x'

cacheSolve <- function(x, ...) {
    # try to get the inverse of the matrix from the cache
    inv <- x$getInverse()
    if(is.null(inv)){# no chaced value available
        # calculate inverse
        data <- x$get()
        inv <- solve(data)
        # store inverse in cache
        x$setInverse(inv)
    } # note: no else barnch needed bcause inv was filled in the first line
    # return the result
    inv
        
}
