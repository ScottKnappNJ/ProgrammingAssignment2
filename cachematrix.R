## These functions will allow the user to place a calculated inverse matrix
## into cache memory for quicker recall, rather than recalculating

## This function creates a list to containing a function to
## 1) set the value of the matrix
## 2) get the value of the matrix
## 3) set the value of the inverse
## 4) get the value of the inverse

makeCacheMatrix <- function(x = matrix()) {
        s <- NULL
        set <- function(y) {
                x <<- y
                s <<- NULL
        }
        get <- function() x
        setinverse <- function(solve) s <<- solve
        getinverse <- function() s
        list(set = set, 
             get = get, 
             setinverse = setinverse, 
             getinverse = getinverse)
}


## This function returns the inverse matrix, first checking to see if the 
## inverse function has already been calculated and stored in cache

cacheSolve <- function(x, ...) {
        s <- x$getinverse()
        if (!is.null(s)) {
                message("getting cache data")
                return (s)
        }
        data <- x$get()
        s <- solve(data, ...)
        x$setinverse(s)
        s
        
        ## Return a matrix that is the inverse of 'x'
}

