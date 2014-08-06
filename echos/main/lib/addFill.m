function [ c ] = addFill(a, b)
% a  -  2xL matrix 
% b  -  2xL matrix 
v={a,b};
m=max(cellfun(@length,v));
n=length(v);
V=zeros(m,n);
mask=zeros(m,n);
for i=1:length(v)
    vi=v{i};
    V(1:length(vi),i)=vi;
    mask(1:length(vi),i)=ones(size(vi));
end

c = sum(V.*mask,2)./sum(mask,2);



