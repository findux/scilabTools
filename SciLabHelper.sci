/*matrix tanımlama işlemi
--> M = eye(4,4)
 M  = 

   1.   0.   0.   0.
   0.   1.   0.   0.
   0.   0.   1.   0.
   0.   0.   0.   1.


--> M(1,4) = 100
 M  = 

   1.   0.   0.   100.
   0.   1.   0.   0.  
   0.   0.   1.   0.  
   0.   0.   0.   1.  


--> M(13) = 50
 M  = 

   1.   0.   0.   50.
   0.   1.   0.   0. 
   0.   0.   1.   0. 
   0.   0.   0.   1. 

*/


function hassas()
    format('v',20);
endfunction

function cevre = daireCevre(r)
        cevre = r * 2 * %pi
endfunction

function uzunluk = uz(a)
    uzunluk = sqrt(sum(a^2))
endfunction

function m = RotPos2B(alpha,pos)
    m = [cos(alpha) -sin(alpha) pos(1); sin(alpha) cos(alpha) pos(2) ; 0 0 1 ]
endfunction

/*
--> RotPos2B(0,[3 3]) * [5 ; 4 ; 1]
 ans  =

   8.
   7.
   1.


--> RotPos2B(%pi * 0.5 ,[3 3]) * [10 ; 0 ; 1]
 ans  =

   3.
   13.
   1.


--> inv(RotPos2B(%pi * 0.25 ,[3 3])) * [6 ; 7 ;1]
 ans  =

   4.9497475
   0.7071068
   1.
*/

function m = Rx(alpha)
    m = [1 0 0 0 ; 
    0 cos(alpha) -sin(alpha) 0;
    0 sin(alpha) cos(alpha) 0;
    0 0 0 1]
endfunction

function    m = Ry(betha)
    m = [cos(betha) 0 sin(betha) 0;
    0 1 0 0;
    -sin(betha) 0 cos(betha) 0;
    0 0 0 1]    
endfunction

function m =Rz(theta)
    m= [cos(theta) -sin(theta) 0 0;
    sin(theta) cos(theta) 0 0;
    0 0 1 0;
    0 0 0 1]
endfunction
    
    function m=Tz2D(theta)
        m = [cos(theta) -sin(theta) 0;
            sin(theta) cos(theta) 0;
            0 0 1]
    endfunction
    
    function m=Tz2Dd(mydegree)
        m = [cosd(mydegree) -sind(mydegree) 0;
            sind(mydegree) cosd(mydegree) 0;
            0 0 1]
    endfunction
    
    /*
    
--> Tz2D(0)
 ans  =

   1.   0.   0.
   0.   1.   0.
   0.   0.   1.


--> Tz2D(45) * [10;0;1]
 ans  =

   5.2532199
   8.5090352
   1.
    */


/*
matrix vector tanımlama 

--> a = [1 0 0 10;0 1 0 20;0 0 1 0;0 0 0 1]
 a  = 

   1.   0.   0.   10.
   0.   1.   0.   20.
   0.   0.   1.   0. 
   0.   0.   0.   1. 
   
--> Tbg = [0 0 1 700;1 0 0 0;0 1 0 -18;0 0 0 1];

--> Tbp = [0 -1 0 1000;1 0 0 100;0 0 1 18;0 0 0 1];

--> Tb = [1 0 0 0;0 1 0 0;0 0 1 0;0 0 0 1];

--> Tbm = [0 1 0 0;-1 0 0 1830;0 0 1 0;0 0 0 1];

--> inv(Tbm) * Tb * Tbp * Tbg * G
 ans  =

   1030.
   900.
   9.
   1.
   

--> v = [10; 20 ; 0;1]
 v  = 

   10.
   20.
   0.
   1.

--> a*v

-->inv(a)

*/

/*
--> toplam=''
--> a=[-5 -4 -3 -2 -1 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21]
--> for n = 1: length(a)
  > toplam = toplam + msprintf('factor(%.1f),',a(n));
  > end

--> toplam
 toplam  = 

 factor(-5.0),factor(-4.0),factor(-3.0),factor(-2.0),factor(-1.0),factor(0 
 .0),factor(1.0),factor(2.0),factor(3.0),factor(4.0),factor(5.0),factor(6. 
 0),factor(7.0),factor(8.0),factor(9.0),factor(10.0),factor(11.0),factor(1 
 2.0),factor(13.0),factor(14.0),factor(15.0),factor(16.0),factor(17.0),fac 
 tor(18.0),factor(19.0),factor(20.0),factor(21.0),                        

m_storage = {m_data={array=0x0000021633159250 {14.000000000000172, 739.00000000000000, -18.000000000000000} } }


*/

/* Arbitrary axis algorithm */
function [Ax, Ay] = arbitrary_axis_algorithm(N)
    Wy = [0; 1; 0];
    Wz = [0; 0; 1];

    if (abs(N(1)) < 1/64) & (abs(N(2)) < 1/64)
        Ax = cross(Wy, N);
    else
        Ax = cross(Wz, N);
    end

    Ax = Ax / norm(Ax);
    Ay = cross(N, Ax);
    Ay = Ay / norm(Ay);
endfunction

/*
N = [0.5; 0.3; 0.8];
[Ax, Ay] = arbitrary_axis_algorithm(N);

disp("Ax: ");
disp(Ax);
disp("Ay: ");
disp(Ay);


//another example
//keyfi bir 210 vecötrü belirleniyor
--> N210 = [-0.423999; 0.866025; -0.264999]; 
//210 vectörüne göre xdir ydir vektörleri hesaplanıyor arbitrary axis algorthim e göre
--> [Ax, Ay] = arbitrary_axis_algorithm(N210)
 Ay  = 

  -0.1165254
   0.238005
   0.9642486

 Ax  = 

  -0.898135
  -0.4397198
   0.

//verilenlerden bir exen takımı oluşturuluyor
--> a = [Ax(1) Ay(1) N210(1) 0;Ax(2) Ay(2) N210(2) 0;Ax(3) Ay(3) N210(3) 0;0 0 0 1]
 a  = 

  -0.898135   -0.1165254  -0.423999   0.
  -0.4397198   0.238005    0.866025   0.
   0.          0.9642486  -0.264999   0.
   0.          0.          0.         1.


//Z de öndürülmüş başka bir matrix belirleniyor
--> rot = Rz(-0.496113)
 rot  = 

   0.8794395   0.4760108   0.   0.
  -0.4760108   0.8794395   0.   0.
   0.          0.          1.   0.
   0.          0.          0.   1.
   
   //a ile rot çarpıpmı ile döndürülmüş eksen takımı elde ediliyor.
--> a*rot
 ans  =

  -0.734388   -0.5299989  -0.423999   0.
  -0.4999999  -0.0000004   0.866025   0.
  -0.4589927   0.8479983  -0.264999   0.
   0.          0.          0.         1.



*/

/* sembolic işlemler 

https://stackoverflow.com/questions/46864009/scilab-symbolic-matrix-multiplication
Here is an example of it's output. Test code:

A = [1 2; 3 4];
B = [5 6; 7 8];
C = [9 0; 1 2];
disp(A*B*C)
As = string(A);
Bs = string(B);
Cs = string(C);
disp(matrixMulf(As,addP(matrixMulf(Bs, Cs))))
Console output:

   193.   44. 
   437.   100.

!1*(5*9+6*1)+2*(7*9+8*1)  1*(5*0+6*2)+2*(7*0+8*2)  !
!                                                  !
!3*(5*9+6*1)+4*(7*9+8*1)  3*(5*0+6*2)+4*(7*0+8*2)  !
*/

function s = scaProd(a,b)
    //escalar product of two vectors
    //using recursion

    if (a == [] | b == []) then
       s = ""

    elseif (max(size(a)) ~= max(size(b))) | ...
           (min(size(a)) ~= min(size(b))) | ...
           (min(size(a)) ~= 1) then
        error("vectorMulf: Wrong dimensions")

    else
        s = addf( mulf(a(1), b(1)) , scaProd(a(2:$), b(2:$)) )

    end
endfunction

function s = matrixMulf(a,b)
    //matrix multiplication

    acols = size(a,'c');
    brows = size(b,'r');
    if acols ~= brows then
        error("matrixMulf: Wrong dimensions")
    end

    arows = size(a,'r');
    bcols = size(b,'c');
    s = string(zeros(arows,bcols));

    for i = 1 : arows
        for j = 1 : bcols
            s(i,j) = scaProd(a(i,:),b(:,j)');
        end
    end
endfunction

function s = addP(a)
    //encolses each element of a in a pair of parenthesis
    s = string(zeros(a));

    for i = 1 : size(a,'r')
        for j = 1 : size(a,'c')
            s(i,j) = "(" + a(i,j) + ")"
        end
    end
endfunction
