-- functions
f = x -> x^2
g = (x,y) -> x | y
f 2 -- no need for parentheses for evaluate a function
g("bla",2) 
f {1,2,3} --error we can't do it with a list

g(1,2)
A = matrix{{2},{3}}
g(1,A) -- concatenate identity matrix and A
g(matrix{{1,1}},A)--error
g(matrix{{1},{1}},A)--fixed

-- make a file with code and load it
load "f-and-g.m2" -- I don't have the file here but what it does is to check errors and get the exact place where it doesn't work
g(matrix{{1,1}},A) -- get quickly to the code that failed!
help "debugging"

-- apply a function to all elements in a list
S = 1..10 --sequence
L = toList S
apply(L,x->x^2)
L / (x->x^2)
(x->x^2) \ L

-- an object of type FunctionClosure... 
R = QQ[x,y,z]
basis(3,R)
entries basis(3,R)--polynomials of degree 3
flatten entries basis (3,R)

--Let's define a function for doing this depending on the degree
applyFunctionToMonomialsOfDegree'd'  = (f,R,d) -> (
    --...can be passed as an argument...
    apply(flatten entries basis (d,R), f)
    )
applyFunctionToMonomialsOfDegree'd'(degree,R,3)


highestExponent = m -> max first exponents m

applyFunctionToMonomialsOfDegree'd'(highestExponent,R,4)

--...or e.g. returned
getFunctionReturningThe'i'thExponent = i -> (m -> (first exponents m)#i)
firstExponent = getFunctionReturningThe'i'thExponent 0
applyFunctionToMonomialsOfDegree'd'(firstExponent,R,3)

x*y%y

-* EXERCISE:
  Make a function that
  returns the minimal monomials in the list
  with respect to divisibility.
  (Hint: a % b = the division remainder.) 
  Test it on L below.
*-

MinimalMonomialsFunction=(L)-> (
    m = length L;
    Div={};
    
    for i from 0 to (length L -1) do(
    aux=1;
        for j from 0 to (length L -1) do(
            if i=!=j  then (
                aux= L_i%L_j * aux
            );
        );
        if aux==0 then (
            Div = Div|{L_i}
        );
    );
    select(L, m ->not isMember(m,Div)) -- this is the return
    )



R = QQ[x,y]
L = apply(20,i->R_(apply(numgens R,i->abs random ZZ)))
MinimalMonomialsFunction(L)