-- Defining a list
L={1,bla,"bla"}

-- Commands for the first of a list
L_0
first L

-- Number of elements in a list
#L
length L

-- List of lists
L2={L, L}

--Operations with lists
10*{1,2,3}+{1,1,1}

-- Concatenation of a List (we have order in a list)
L | {3,4,5} | L

--Loops 
for i from 1 to 9 list(
    result := nextPrime i^2;
    << "completed step " << i << endl;
    result
)

for i from 1 to 9 list(
    result := nextPrime i^2;
    print("completed step " | i);
    result
)
--Exercise 1: Generating 10 first loaded Packages
take(loadedPackages,10)


-- Exercise 2: Generating 10 primes:
for i from 1 to 9 list (
p = nextPrime(p+1);
p
)

-- other solutions
L={2}
for i from 1 to 9 do (
    p=nextPrime(last L+1);
    L=L|{p}
)

-- Exercise 3: GEnerating Fibonacci numbers
L={0,1}
for i from 1 to 9 do L = L | {L_(-1)+L_(-2)}
L
