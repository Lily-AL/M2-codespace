-- La mayoría de los ejercicios son copy/paste de la sesión de Mike
-- Primero definamos un anillo y un ideal

R = ZZ/32003[a..d]
I = ideal(a*d-b*c, a*c-b^2, b*d-c^2)

-- Let's calculate some stuff
dim I
codim I
degree I 
-- dimension como espacio vectorial de la parte homogenea de grado 3 en R/I
hilbertFunction(3,I)
hilbertSeries(I)
reduceHilbert oo

-- Free resolution of I
F=res I
--matrices de la resolución
F.dd 
-- betti 
betti F

I_0

-- Let's try another example
F2 = a^3 + b^3 + c^3 + d^3

I2 = inverseSystem F2
dim I2, codim I2, degree I2

C = res I2
C.dd

betti C