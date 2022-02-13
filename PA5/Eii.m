clearvars
clearvars -GLOBAL
close all
set(0,'DefaultFigureWindowStyle', 'docked')

nx = 20;
ny = 80;
alpha = 1;

G = sparse(nx * ny, nx * ny);    

% for i=1:nx
%     for j=1:ny
%         n = j + (i-1)*ny;
%         if i==1||i==nx||j==1||j==ny
%             G(n,:)=0;
%             G(n,n)=1;
%         else
%        
%         nxm = (i-2)*ny + j;
%         nxp = i*ny + j;
%         nym = (i-1)*ny + j-1;
%         nyp = (i-1)*ny + j+1;
%        
%         G(n,n) = -4;
%         G(n, nxm) = 1;
%         G(n, nxp) = 1;
%         G(n, nym) = 1;
%         G(n, nyp) = 1;
%        
%         if i > 10 & i < 20 & j > 10 & j < 20
%             G(n,n) = -2;
%         end
%         
%         end
%     end  
% end
for i = 1:nx
    for j = 1:ny
        n = j + (i-1) * ny;
        nr = j + (i+1-1) * ny;
        nl = j + (i-1-1) * ny;
        nu = (j+1) + (i-1) * ny;
        nd = (j-1) + (i-1) * ny;
      if i == 1
          G(n,n) = 1;
      elseif j == 1
          G(n,n) = 1;
      elseif i == nx
          G(n,n) = 1;
      elseif j == ny
          G(n,n) = 1;
      else
          G(n,n) = -4 * alpha;
          G(n,nr)= -1 * alpha;
          G(n,nl)= -1;
          G(n,nu)= -1;
          G(n,nd)= -1;
      end
    end
end
subplot(3,1,1);
spy(G);

[E,D] = eigs(G);

subplot(3,1,2);
surf(D);

figure
%Eigen Vector 1
for m = 1:6
    V1 = E(:,m);
    k = 1;
    VG = zeros(nx,ny);
    for i = 1:nx
        for j = 1:ny
            n = j + (i-1) * ny;
            VG(i,j) = V1(n);
        end
        
    end
    
    subplot(3,2,m);
surf(VG);
end