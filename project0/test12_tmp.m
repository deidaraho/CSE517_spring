function [r,s]=test12_tmp()
x = rand(10,100);
try
 D = l2distance(x);
 failtest=norm(imag(D))>0.0;
catch
	failtest=true;
end;
if failtest,
    r= 1;
    s = [ 'Test 12 failed: Distances must be all real numbers (not imaginary).\n Make sure all values are non-zero before you take the squrae root.\n' ];
end;