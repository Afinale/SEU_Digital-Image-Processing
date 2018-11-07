function  [result]  = Correlation(a,b)
%�������Ϊ��ά����a��b��aΪƥ������bΪ�˲���

%��ȡa��b�ߴ����
[M,N]=size(a);
m=1:M;
n=1:N;
[M0,N0]=size(b);
p=1:M0;
q=1:N0;
%�Ծ���a�������䣬��0���հ�����
f=zeros(M+2*(M0-1),N+2*(N0-1));
f(m+M0-1,n+N0-1)=a;

result=zeros(M+M0-1,N+N0-1);
for i=1:M+M0-1
    for j=1:N+N0-1
        wkl=zeros(size(f));
        wkl(i+p-1,j+q-1)=b;%�˲���ɨ��ͼ��
        result(i,j)=sum(sum(f.*conj(wkl)));%����ǰ�����ͼ������ֵ���˲�����˲����
    end
end
end

