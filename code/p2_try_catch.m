% try catch statement
m = rand(3,4);
n = magic(5);
try
     a = m*n;      
     disp(a)
catch
     disp(size(m))
     disp(size(n))
end
disp("Since they have different size so can't do matrix multiplication£¡")