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
    


/*
matrix vector tanımlama 

--> a = [1 0 0 10;0 1 0 20;0 0 1 0;0 0 0 1]
 a  = 

   1.   0.   0.   10.
   0.   1.   0.   20.
   0.   0.   1.   0. 
   0.   0.   0.   1. 


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
