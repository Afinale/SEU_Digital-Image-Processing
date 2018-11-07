%��ɫͼ��ֱ��ͼƥ��matlab
clear
I=imread('car.jpg');%��ȡͼ��
Imatch=imread('starsky.jpg');%��ȡƥ��ͼ��
R=I(:,:,1);%��ȡԭͼ��Rͨ��
G=I(:,:,2);%��ȡԭͼ��Gͨ��
B=I(:,:,3);%��ȡԭͼ��Bͨ��
R_hist=imhist(R);%��ȡԭͼ��Rͨ��ֱ��ͼ
G_hist=imhist(G);%��ȡԭͼ��Gͨ��ֱ��ͼ
B_hist=imhist(B);%��ȡԭͼ��Bͨ��ֱ��ͼ
Rmatch=Imatch(:,:,1);%��ȡƥ��ͼ��Rͨ��
Gmatch=Imatch(:,:,2);%��ȡƥ��ͼ��Gͨ��
Bmatch=Imatch(:,:,3);%��ȡƥ��ͼ��Bͨ��
Rmatch_hist=imhist(Rmatch);%��ȡƥ��ͼ��Rͨ��ֱ��ͼ
Gmatch_hist=imhist(Gmatch);%��ȡƥ��ͼ��Gͨ��ֱ��ͼ
Bmatch_hist=imhist(Bmatch);%��ȡƥ��ͼ��Bͨ��ֱ��ͼ

cdf= cumsum(R_hist) / numel(R); 
cdfRef= cumsum(Rmatch_hist) / numel(Rmatch);
% Compute the mapping
M   = zeros(1,256);
for idx = 1 : 256
    [tmp,ind] = min(abs(cdf(idx) - cdfRef));
    M(idx) = ind-1;
end
Rout = M(double(R)+1);

cdf= cumsum(G_hist) / numel(G); 
cdfRef= cumsum(Gmatch_hist) / numel(Gmatch);
% Compute the mapping
M   = zeros(1,256);
for idx = 1 : 256
    [tmp,ind] = min(abs(cdf(idx) - cdfRef));
    M(idx) = ind-1;
end
Gout = M(double(G)+1);

cdf= cumsum(B_hist) / numel(B); 
cdfRef= cumsum(Bmatch_hist) / numel(Bmatch);
% Compute the mapping
M   = zeros(1,256);
for idx = 1 : 256
    [tmp,ind] = min(abs(cdf(idx) - cdfRef));
    M(idx)= ind-1;
end
Bout = M(double(B)+1);

J(:,:,1)=Rout;
J(:,:,2)=Gout;
J(:,:,3)=Bout;
figure;%��ʾԭͼ��ƥ��ͼ���ƥ����ͼ��
subplot(1,3,1),imshow(I);title('ԭͼ��');
subplot(1,3,2),imshow(Imatch);title('ƥ��ͼ��');
subplot(1,3,3),imshow(J);title('ƥ��֮��ͼ��');
figure;%��ʾԭͼ��ƥ��ͼ���ƥ���ͼ���ֱ��ͼ
subplot(3,3,1),imhist(R,64);ylabel('ԭͼ��Rͨ��ֱ��ͼ');
subplot(3,3,2),imhist(G,64);ylabel('ԭͼ��Gͨ��ֱ��ͼ');
subplot(3,3,3),imhist(B,64);ylabel('ԭͼ��Bͨ��ֱ��ͼ');

subplot(3,3,4),imhist(Rmatch,64);ylabel('ƥ��ͼ��Rͨ��ֱ��ͼ');
subplot(3,3,5),imhist(Gmatch,64);ylabel('ƥ��ͼ��Gͨ��ֱ��ͼ');
subplot(3,3,6),imhist(Bmatch,64);ylabel('ƥ��ͼ��Bͨ��ֱ��ͼ');
 
subplot(3,3,7),imhist(Rout,64);ylabel('ƥ��֮��ͼ��Rͨ��ֱ��ͼ');
subplot(3,3,8),imhist(Gout,64);ylabel('ƥ��֮��ͼ��Gͨ��ֱ��ͼ');
subplot(3,3,9),imhist(Bout,64);ylabel('ƥ��֮��ͼ��Bͨ��ֱ��ͼ');
