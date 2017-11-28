nx=10;
l=1;
t=100;
dt =0.001; 
dx=l/nx;
T=zeros(nx); 
alpha=2; 
x=1:1:10;

for i= 1:nx
    T(i)= 0;
end
T(1)=1;
T(nx)=0;
cfl=((alpha*dt)/dx^2);
for t=0:1:100 
 for i=2:nx-1
        T(i)=T(i)+cfl*(T(i+1)-2*T(i)+T(i-1));
    end
   
    hold on
    
    plot(x,T,'linewidth',1)
    xlabel('grid points','FontWeight','bold','FontSize',16);
    ylabel('Temperature','FontWeight','bold','FontSize',16);
    pause(0.1);
end