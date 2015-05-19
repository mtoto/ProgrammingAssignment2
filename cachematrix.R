## These two functions calculate, store (ie. set) 
## and retrieve(ie. get) the inverse of a matrix.

## The below function takes a matrix as an argument
## and defines four functions that store (ie. set)
## and retrieve (ie. get) the matrix (x) and
## its inverse (setsolve/getsolve).

makeCacheMatrix <- function(x = matrix()) {
        
        ## makeCacheMatrix takes a matrix as an argument.
        
        s <- NULL
        
        ## The variable for the matrix' inverse is initiated
        ## and we assign the value NULL to it.
        
        set <- function(y) {
                x <<- y
                s <<- NULL
                
                ## The above function 'sets' the matrix, ie. stores in the working enviromnent.
                
        }
        get <- function() x
        setsolve <- function(solve) s <<- solve
        getsolve <- function() s
        list(set = set, get = get,
             setsolve = setsolve,
             getsolve = getsolve)
}
## The last three functions define: 
## 'get' which simply returns the 'set' matrix; 
## 'setsolve' which assigns the inverse of the matrix to 's'
## and 'getsolve' which returns the inverse of the matrix.
## finally, the four values for the four functions are listed.


## The below functions, takes a matrix as an argument and
## looks if its inverse already exists, which it then retrieves
## from the working enviromnent. Otherwise it calculates the 
## inverse and subsequently stores in the the working enviromnent.

cacheSolve <- function(x=matrix(), ...) {
        
        ## Takes matrix as argument.
        
        s <- x$getsolve()
        
        ## retrieves the inverse of the matrix from working enviromnent and assigns to 's'.
        
        if(!is.null(s)) {
                message("getting cached data")
                return(s)
                
                ## If the value for 's' is stored, then it returns it along with the above msg.
                
        }
        data <- x$get()
        s <- solve(data, ...)
        x$setsolve(s)
        s
}

## If not, and the last part is sort of an 'else' statement, 
## the function calculates the matrix 'x's inverse, stores it in s and 
## finally returns it.
