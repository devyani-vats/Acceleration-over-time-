clc, clear all 
format compact
 again = 1; 
 while(again ==1 )
 
 %inputs: 
 R1 =input("Enter R1 value: " );
 R2 =input("Enter R2 value: " );
 R3 =input("Enter R3 value: " );
 V = input("Enter V value:  " );
 
% %Creating  matrices: 
 [coeff] = [(R1+R2) ,-R2,-R1 ;-R2, R2, 0; -R1, 0, (R1+R3)  ];
 
 B =[ 0;  V ; 0];

 
 %Checking to see ig meets requirements: 
 %check to see if a square matrix : 
 
 [r,c ] = size(coeff);
     while(r~=c)
             disp('Matricies must be square!')
             R1 =input("Enter R1 value: " );
            R2 =input("Enter R2 value: " );
            R3 =input("Enter R3 value: " );
            coeff = [(R1+R2) ,-R2,-R1 ;-R2, R2, 0; -R1, 0, (R1+R3)  ]
            [r,c ] = size(coeff)

    end 
[m,n] = size(B); 
    while(c~=m)
        disp('Rows in matrix should be equal to columns of constant vector !')
            R1 =input("Enter R1 value: " );
            R2 =input("Enter R2 value: " );
            R3 =input("Enter R3 value: " );
            coeff = [(R1+R2) ,-R2,-R1 ;-R2, R2, 0; -R1, 0, (R1+R3)  ];
            [r,c ] = size(coeff);
            [m,n] =sdize(B);
    end 

%Method 1 : 
        if (det(coeff)~=0)
            disp('     ')
            tic 
            X1 = inv(coeff)*B;
            t1= toc;;
%Method 2: 
        
        tic
        X2= coeff\B;
        t2= toc;

%Method 3 : 
     
       tic 
       K= rref([coeff,B]);
       X3 =K(:,end);
       t3=toc;

       %Display output: 
       solutions = [(X1), (X2) , (X3)];
       time = [t1, t2, t3];
       header =['Inverse method          ','Left Division           ','Reduced Row Echelon Form'];
        fprintf( '%24s\n',header)
        fprintf('%13.2f\t%20.2f\t%30.2f\n%13.2f\t%20.2f\t%30.2f\n%13.2f\t%20.2f\t%30.2f\n%13.5f\t%20.5f\t%30.5f\n', solutions', time');
        
                     
       disp('')
%Checking number of soultions: 
         if(rank(coeff)==rank([coeff, B])&& rank(coeff)==r)
         
                 disp('Soultiuon is unique!')
         
         
         else 
             disp('There are many solutons : ')
         end 
         
         else("There are no soultions: ")
         end 
    
again = input("Enter 1 to repeat: ");
 end 

%Sample input/output 
% Enter R1 value: 4
% Enter R2 value: 2
% Enter R3 value: 4
% Enter V value:  10
% 
% Inverse method          Left Division           Reduced Row Echelon Form
%          5.00	                5.00	                          5.00
%         10.00	               10.00	                         10.00
%          2.50	                2.50	                          2.50
%       0.00022	             0.00007	                       0.01177
% Soultiuon is unique!
% Enter 1 to repeat: 1
% Enter R1 value: 4
% Enter R2 value: 0
% Enter R3 value: 3
% Enter V value:  12
% ans = 
%     "There are no soultions: "
% Enter 1 to repeat: 

