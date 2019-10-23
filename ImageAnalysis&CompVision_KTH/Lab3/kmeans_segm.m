function [segmentation,centers]=kmeans_segm(image,K,L,seed)

%K is the number of cluster centers
%L is the number of iterations
%seed for initializing randomization
image=double(image);
%Important to reshape the image
sz=size(image);
H=sz(1,1);
W=sz(1,2);
%disp(sz);


if W~=3
  row=W*H;
  Ires=reshape(image,row,3);
else
  row=H;
  Ires=image;
end
%rng(seed);
%Random Initialisation
number=255/K;
clusters=[];

for i=1:K
%   a=[];
%   for j=1:3
     tmp=round(rand*(i*number));
%     a=[a tmp];
%    end
  a=[tmp tmp tmp];
  clusters=[clusters;a];  
end
%disp(clusters);
disp(1);
%Computing all distances 

%Will make a distance matrix of size (W*H,K)
distance=zeros(row,K);
  
  %for i=1:row
    for j=1:K
      cl=clusters(j,:);
      I_t=bsxfun(@minus,Ires,cl); %Nx3
      I_tt=I_t.^2; %Sum of rows
      Sum_d=(sum(I_tt,2)).^(0.5);      
      distance(:,j)=Sum_d;
    end
  %end
 disp(2);
 %disp(size(distance));
%Iterate L times

for iter=1:L
  
  %Assigning the each pixel to a particular cluster
  [min_dist,index]=min(distance,[],2);  %2 makes sure that it is minimized row wise
%   [alpha beta]=find(distance==minimize);
%   %disp(alpha(1:100,1));
%   %Matrix to keep track of cluster
%   index=beta;
  
  %new clusters
  visited=zeros(K,1);
  count=zeros(K,3);
  ch_clusters=zeros(K,3);
  %iterating on the num of index matrix
  for M=1:row
    ind=index(M,1);
    if visited(ind,1)==1
      count(ind,:)=count(ind,:)+[1 1 1];
      ch_clusters(ind,:)=ch_clusters(ind,:)+Ires(M,:);   
      clusters(ind,:)=ch_clusters(ind,:)./count(ind,:);
    elseif visited(ind,1)==0
      visited(ind,1)=1;
      count(ind,:)=count(ind,:)+[1 1 1];
      clusters(ind,:)=[0 0 0];
      clusters(ind,:)=clusters(ind,:)+Ires(M,:);
      ch_clusters(ind,:)=ch_clusters(ind,:)+Ires(M,:); 
    end
  end
  %Averaging  
  disp(3);
  %disp(clusters);
  %New distances
  
  distance=zeros(row,K); 
  for j=1:K
      cl=clusters(j,:);
      I_t=bsxfun(@minus,Ires,cl); %Nx3
      I_tt=I_t.^2; %Sum of rows
      Sum_d=(sum(I_tt,2)).^(0.5);      
      distance(:,j)=Sum_d;
    end
  
end

%updated_image=zeros(row,3);

%for i=1:row
 % updated_image(i,:)=clusters(index(i,1),1);
%end

%final_image=reshape(updated_image,H,W,3);
if W~=3
 segmentation=reshape(index,H,W);
else
 segmentation=index;
end
 centers=clusters;

%for f=1:row
 %   Ires(f,:)=clusters(index(f,1),:);
%end


%Ivec=unit8(reshape(Ires,H,W,3));

%output=overlay_bounds(Ivec,segmentation);
%imshow(output);
end
