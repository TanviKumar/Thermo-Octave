alpha = 2;
nx = 20;
ny=20;
x = 1:1:20;
y=1:1:20;
dx= 1/nx;
dy=1/ny;
dt = 0.0005;
t = 1;
T = zeros(nx,ny);
for i=1:nx
    for j=1:ny
      T(i, j)  = 0;
    end
end

%for i=1:nx
%  T(i,1)= 100;
%end
%
%for i=1:nx
%  T(i,20)= 100;
%end

for i=1:ny
  T(1,i)= 100;
end

%for i=1:ny
%  T(20,i)= 10;
%end
ti= 10;
h=5;
cfl = 1/(h+ alpha*nx);
cfl1 = 1/(h+ alpha*ny);
shd = (alpha*dt);
for t=1:1:100
  for i=2:nx-1
    for j=2:ny-1
      T(i,j) = shd*((T(i+1,j)-2*T(i,j)+T(i-1,j))/dx^2 +(T(i,j+1)-2*T(i,j)+T(i,j-1))/dy^2 ) + T(i,j);
    end
  end
  for i=1:nx
   T(i,nx) = (ti*h + T(i, nx-1)*alpha*nx)*cfl;
  end
  for i=1:ny
   T(ny,i) = (ti*h + T(ny-1, i)*alpha*ny)*cfl1;
  end
  for i=1:nx
   T(i,1) = (ti*h + T(i, 2)*alpha*nx)*cfl;
  end
  
#contour(T);
pcolor(x,y,T);
pause(0.1);     

end