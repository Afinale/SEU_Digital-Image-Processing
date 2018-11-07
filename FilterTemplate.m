clear;
RESOURCE=imread('E:\picture\test.png');
resource=rgb2gray(RESOURCE);
TEMPLATE=imread('E:\picture\template.png');
template=rgb2gray(TEMPLATE);

[m,n]=size(resource);
[m0,n0]=size(template);
%ԭͼ�а�ɫ�Ҷ�ֵΪ255��ɫΪ0������������ֵ��������Ҫ��������λ��
%�����Ҫ��ͼ����з�ת
resource_inversion=255-resource;
template_inversion=255-template;

%�˲����ƹ�ͼ�񲢼���ÿ��λ�ó˻�֮�ͣ��������
result=Correlation(resource_inversion,template_inversion);
%�ҵ�������λ������
[iMaxPos,jMaxPos]=find( result==max( result(:)));

figure,
subplot(121);imshow(TEMPLATE),title('ƥ��ģ����ͼ��');
subplot(122);imshow(RESOURCE),title('��ǳ�ƥ�������ԭͼ');
hold on
plot(jMaxPos,iMaxPos,'*');%���������ص�
%�þ��ο��ǳ�ƥ�����������ص�Ϊƥ���������½�
plot([jMaxPos,jMaxPos-n0+1],[iMaxPos,iMaxPos]);
plot([jMaxPos-n0+1,jMaxPos-n0+1],[iMaxPos,iMaxPos-m0+1]);
plot([jMaxPos,jMaxPos-n0+1],[iMaxPos-m0+1,iMaxPos-m0+1]);
plot([jMaxPos,jMaxPos],[iMaxPos,iMaxPos-m0+1]);
