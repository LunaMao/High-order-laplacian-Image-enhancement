clear
clc

%% 0 Common optical elements 

Rot = @(x) [1, 0, 0, 0; 0, cosd(2*x), sind(2*x), 0; 0, -sind(2*x), ...
        cosd(2*x), 0; 0, 0, 0, 1]; %Rotation matrix

Pol = @(x,tau,xi) Rot(-x)*tau/2*[1, cosd(2*xi), 0, 0; ...
        cosd(2*xi), 1, 0, 0; ...
        0, 0, sind(2*xi), 0; ...
        0, 0, 0, sind(2*xi)] * Rot(x); %Polarizer matrix 

Ret = @(x,phi) Rot(-x)*[1, 0, 0, 0; ...
    0, 1, 0, 0; ...
    0, 0, cosd(phi), sind(phi); ...
    0, 0, -sind(phi), cosd(phi)]* Rot(x); % Retarder matrix horizontal fast axis

Sample =  @(x,tau,a, b, c) Rot(-x)*tau/2*[1, a, 0, 0; ...
        a, 1, 0, 0; ...
        0, 0, b, c; ...
        0, 0, -c, b] * Rot(x); % Polarizer/Retarder matrix

depolarier =  @(x, a, b, c) Rot(-x)*[1, 0, 0, 0; ...
        0, a, 0, 0; ...
        0, 0, b, 0; ...
        0, 0, 0, c] * Rot(x); % depolarizer matrix

%% 1 M 
% 
% % retarder
% delta_rotate=5;
% delta_delay=5;
% n_rotate=180/delta_rotate;
% n_delay=180/delta_delay;
% for ii = 1:n_rotate
%     for jj = 1:n_delay
%         M(:,:,ii,jj)=Ret(ii*delta_rotate,jj*delta_delay);
%     end
% end

% % polarizer
% delta_rotate=5;
% xi=5;
% n_rotate=180/delta_rotate;
% n_delay=180/xi;
% for ii = 1:n_rotate
%     for jj = 1:n_delay
%         M(:,:,ii,jj)=Pol(ii*delta_rotate,2,jj*xi);
%     end
% end
% 
% [Lg,e]=Magnetic_laplacian(M,0.5);


% figure();
% for ii = 1:n_rotate
%     for jj = 1:n_delay
%         scatter(ii,(e(1,ii,jj)),'r');
%         hold on
%         scatter(ii,(e(2,ii,jj)),'b');
%         hold on
%         scatter(ii,(e(3,ii,jj)),'g');
%         hold on
%         scatter(ii,(e(4,ii,jj)),'y');
%         hold on
%     end
% end
% 
% 
% figure();
% for ii = 1:n_rotate
%     for jj = 1:n_delay
%         scatter(jj,(e(1,ii,jj)),'r');
%         hold on
%         scatter(jj,(e(2,ii,jj)),'b');
%         hold on
%         scatter(jj,(e(3,ii,jj)),'g');
%         hold on
%         scatter(jj,(e(4,ii,jj)),'y');
%         hold on
%     end
% end


% figure();
% for ii = 1:n_rotate
%     for jj = 1:n_delay
%         scatter3(ii,jj,(e(1,ii,jj)),'r');
%         hold on
%         scatter3(ii,jj,(e(2,ii,jj)),'b');
%         hold on
%         scatter3(ii,jj,(e(3,ii,jj)),'g');
%         hold on
%         scatter3(ii,jj,(e(4,ii,jj)),'y');
%         hold on
%     end
% end
%% 
% depolarizer

% n_a=10;
% n_b=10;
% n_c=10;
% delta_rotate=5;
% n_rotate=180/delta_rotate;
% 
% for i = 1:n_rotate
%     for ii = 1:n_b
%         M(:,:,i,ii)=depolarier(i*5,0,ii*0.1,0);
%     end
% end


% [Lg,e]=Magnetic_laplacian(M,0.5);



%%
eig1 = squeeze(e(1,:,:));
eig2 = squeeze(e(2,:,:));
eig3 = squeeze(e(3,:,:));
eig4 = squeeze(e(4,:,:));

rotate_angle = linspace(5,180,n_rotate);

figure();
plot(rotate_angle, eig4(:,1));
hold on
plot(rotate_angle, eig3(:,1));
hold on
plot(rotate_angle, eig2(:,1),'-o');
hold on
plot(rotate_angle, eig1(:,1),'-*');
legend('4th eig','3rd eig','2nd eig','1st eig')


aa = linspace(1,0,n_c);

figure();
plot(aa, eig4(1,:));
hold on
plot(aa, eig3(1,:));
hold on
plot(aa, eig2(1,:),'-o');
hold on
plot(aa, eig1(1,:),'-*');
legend('4th eig','3rd eig','2nd eig','1st eig')



% delay = linspace(5,180,n_delay);
% 
% figure();
% plot(delay, eig4(1,:));
% hold on
% plot(delay, eig3(1,:));
% hold on
% plot(delay, eig2(1,:),'-o');
% hold on
% plot(delay, eig1(1,:),'-*');
% legend('4th eig','3rd eig','2nd eig','1st eig')
% 
% figure();
% plot(delay, eig4(2,:));
% hold on
% plot(delay, eig3(2,:));
% hold on
% plot(delay, eig2(2,:),'-o');
% hold on
% plot(delay, eig1(2,:),'-*');
% legend('4th eig','3rd eig','2nd eig','1st eig')