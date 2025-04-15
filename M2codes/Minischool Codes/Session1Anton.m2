-- Cosa importante ; al final no coloca el valor de la variable al final pero para cosas grandes no conviene por el tiempo de ejecución
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
L2={2}
for i from 1 to 9 do (
    p=nextPrime(last L2+1);
    L2=L2|{p}
)

-- Exercise 3: GEnerating Fibonacci numbers
L3={0,1}
for i from 1 to 9 do L3 = L3 | {L3_(-1)+L3_(-2)}
L3

-- Exercises. Create a hash table where
-- the keys are the numbers from 1 to 10 with the corresponding values are the first 10 letters of the alphabet
-- the keys are first 10 loadedPackages and the values are their versions

-- Exercise 4: Hashable Tables 10 numbers to the 10 first letters
L4= for i from 1 to 10 list i=>ascii(65+i-1)
H = new HashTable from L4
-- accesing data
H#1

-- Exercise 5: Hashable Tables 10 first loadedPackages to the 10 first loadedPackages version
L5= for i from 1 to 10 list loadedPackages#i => ((loadedPackages#i).Options.Version)
book2 = new HashTable from L5