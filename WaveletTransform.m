clear;                   
[A,map]=imread('E:\picture\test.jpg');                
X=rgb2gray(A);  
%����ԭʼͼ��  
subplot(2,2,1);imshow(X);
title('ԭʼͼ��');  
%��������ͼ��  
x=imnoise(X ,'gaussian',0,0.03);
%��������ͼ��  
subplot(2,2,2);imshow(x);  
title('������ͼ��');  
%�������ͼ���ȥ�봦��  
%��С������sym4��x����2��С���ֽ�  
[c,s]=wavedec2(x,2,'sym4');  
%��ȡС���ֽ��е�һ��ĵ�Ƶͼ�񣬼�ʵ���˵�ͨ�˲�ȥ��  
a1=wrcoef2('a',c,s,'sym4');  % a1Ϊ double �����ݣ�
%����ȥ����ͼ��  
subplot(2,2,3); imshow(uint8(a1)); % ע�� imshow()��image()��ʾͼ��������imshow()������ʾ double �����ݣ��������ת�� uint8(a1)��
title('��һ��ȥ��ͼ��');           % ����image() ��ʾͼ�������ꣻ
%��ȡС���ֽ��еڶ���ĵ�Ƶͼ�񣬼�ʵ���˵�ͨ�˲�ȥ��  
%�൱�ڰѵ�һ��ĵ�Ƶͼ�񾭹���һ�εĵ�Ƶ�˲�����  
a2=wrcoef2('a',c,s,'sym4',2);  
%����ȥ����ͼ��  
subplot(2,2,4); imshow(uint8(a2)); %image(a2);
title('�ڶ���ȥ��ͼ��');
%����ͼ��  
imwrite(x,'E:\picture\2.jpg');
imwrite(uint8(a1),'E:\picture\3.jpg'); %imwrite()����ͼ��Ҳ��Ҫ����������ת��Ϊuint8
imwrite(uint8(a2),'E:\picture\4.jpg');