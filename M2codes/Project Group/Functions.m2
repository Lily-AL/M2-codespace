--We need a previous package
needsPackage "SRdeformations"

--Toy Example
R=QQ[x_1..x_4]
m = matrix{{0,0,0,1},{1,0,0,0},{0,1,0,0},{0,0,1,0}}
G = {m , m^2, m^3, m^4}
m2 = matrix{{0,1,0,0},{1,0,0,0},{0,0,0,1},{0,0,1,0}}
G2 = {m2, m2^2}
f=x_1^2*x_2^3*x_3^1*x_4^2

-- Check if a Monomial is not special
IsMonNotSp = f->(
    I:=(exponents f)_0;
    I=rsort I;
    aux:=0;
    for i from 1 to (#I-1) do(
        if abs(I_i - I_(i-1))>1 then (aux=1; break);
    );
    if last I>0 then aux=1;
    if aux==1 then true else false
) 

--Orbit Sum Function
orbSum = (f,G) ->(
    I:= (exponents f)_0;
    v:= transpose matrix{I};
    g:=0;
    G*v;
    for i from 0 to (#(G*v)-1) do(
        g = g + vectorToMonomial(vector(G*v)_i,R);
    );
    g
)

-- Orbit Sum for {s_i}_{i\in\{1,\ldost n\}} where s_i=x_1*x_2*\ldots*x_i

-- defining s_i
SPoly=i->(
f:=1;
for j from 1 to i do(
f=f*x_j;
);
f
)

-- Getting the OrbitSum List for s_i polynomials in n variables
OrbSumSi=(n,G)->(
    L:={};
    for i from 1 to n do(
        L = L | { orbSum( SPoly(i),G)};
    );
    L
)

-- Getting the special Monomials (modulo permutations of the variables)

-- First we get the special indexes
IsListSp = (I,n) -> (
    R:=QQ[x_1..x_n];
    aux := 0;
    if (length I) > n then aux = 1 else(
        if (length I) < n then(
            for i from 1 to (n - (length I)) do I = I | {0}
        );
        for i from 1 to (#I - 1) do(
            if abs(I_i - I_(i-1))>1 then(aux=1; break)
        );
        if (last I) > 0 then aux = 1
    );
    if aux == 0 then {true , I} else {false , I}
)

--Generate, if posible, the list of special monomials
ListSpMon=(d,n)->(
    R:=QQ[x_1..x_n];
   L:=partitions d;
   M:={};
   for i from 0 to (#L-1) do if (IsListSp(toList L_i,n))_0 then M=M | {vectorToMonomial( vector((IsListSp(toList L_i,n))_1)  , R  ) };
   if #M>0 then M else print("There are no special monomials")
)
--Test
ListSpMon(7,8)
ListSpMon(27,8)
