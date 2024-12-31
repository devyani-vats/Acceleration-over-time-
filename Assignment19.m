%Assignment 19 

clc, clear 
format compact 

t = 0:1:10 ; 

v = input ("Input velocity from t = 0 to t = 10 with one mintue intervals: ");
z =[t',v'];
z_sorted = sortrows(z, 1);
T= z_sorted(:,1 );
V = z_sorted(:,2);
dist_t = trapz(T, V);
coeff = polyfit(T, V, 3);
func_q = @(x) coeff(1,1).*x.^3 +coeff(1,2).*x.^2 + coeff(1,3).*x +coeff(1,4);
dist_q = quad(func_q,0 ,10);
a = gradient(V, T);
disp(['Total Distance travled(using trapz): ', num2str(dist_t)])
disp(['Total Distance travled(using quad): ', num2str(dist_q)])
plot(T, a);
xlabel('Time')
ylabel('Acceleration of misile: ')
title('Acceleration of missle over time: ')
grid on 
%Output 
% Input velocity from t = 0 to t = 10 with one mintue intervals: [0 10 25 100 70 45 145 240 200 260 260]
% Total Distance travled(using trapz): 1225
% Total Distance travled(using quad): 1214.9184