function prob_image= mixture_prob(image, K, L, mask) %sz is the size of the mask
  image=single(image);
  [H W colors]=size(image);
  N_i=W*H;
  Fs=reshape(mask,W*H,1);
  ind=find(Fs);
  Iv=single(reshape(image,W*H,3));  %Original Image without masking
  Ivec=Iv(ind,:);
  disp(size(Ivec));
  %Ivec=bsxfun(@times,Fs,Iv);
  %for ch=1:N_i
    %if Fs(ch,1)==1
      %Ivec=[Ivec;Iv];
    %end
  %end
  
  %tmpimage=image;
  %tmpimage(:,:,1)=image(:,:,1).*mask;
  %tmpimage(:,:,2)=image(:,:,2).*mask;
  %tmpimage(:,:,3)=image(:,:,3).*mask;
  
  %Store all pixels for which mask=1 in a Nx3 matrix  
  [N m]=size(Ivec);
  
  %Initialization
  [Seg,Mu_k]=kmeans_segm(Ivec,K,4,10);
  %Gcomp will be Kx3 matrix which will act as a mean(Mu_k} for us in this code
  Sig={};  %We shall have sigma_k after this 
  cov_k=[1 0 0;0 1 0;0 0 1];  %defining covariance matrix
  
  for num=1:K
    Sig{num,1}=cov_k;
  end
  
  %Finding w_k
  edg=1:K;
  Count_vec=histc(Seg(:),edg);
  sum_c_vec=sum(Count_vec(:));
  W_k=bsxfun(@rdivide,Count_vec,sum_c_vec)
  
  MAT_gkci=zeros(K,N); %Large matrix used in this code
  MAT_pik=zeros(N,K);
  
  for iter=1:L
    disp(iter);
    %Expectation step
    
    %Finding g_k(c_i)
    for cl=1:K
      t=single(bsxfun(@minus,Ivec,Mu_k(cl,:)));
      cov_k=Sig{cl,1};
      if det(cov_k)==0
         MAT_gkci(cl,:)=zeros(1,N);
      else
         Tt=-(t*inv(cov_k))/2; %Nx3
         Ft=bsxfun(@times,Tt,t); %t is N*3
         Above=sum(Ft,2); %Nx1
         det_k=abs(det(cov_k));
         g_ck=(1/sqrt(det_k))*exp(Above);  %Nx1 matrix
         MAT_gkci(cl,:)=(g_ck(:,1))';
      end
      
    end
      %disp(unique(MAT_gkci));
      
    
   %Finding Pik on tmpimage
   prob=zeros(K,N);
   Dot_prod=bsxfun(@times,W_k,MAT_gkci); %KxN
   S=sum(Dot_prod); %1xN
   for loop=1:N
     if S(1,loop)~=0
       prob(:,loop)=Dot_prod(:,loop)/S(1,loop); 
     end     
   end
   
   %prob=bsxfun(@rdivide,Dot_prod,S);
   MAT_pik=prob';  %NxK
    
   %Maximization Step
   Sum_pik=sum(MAT_pik)  %1xK
   W_k=1/N*(Sum_pik)';
   %Mu_k is Kx3
   
   for cl=1:K
     
     T=MAT_pik(:,cl); %Nx1
     T_I=bsxfun(@times,T,Ivec);%Nx3
     S_tmp=sum(T_I); %1x3
     if(S_tmp==[0 0 0])
      Mu_k(cl,:)=[0 0 0];
     else
      Mu_k(cl,:)=S_tmp./Sum_pik(1,cl); %1x3
     end
     
     t=single(bsxfun(@minus,Ivec,Mu_k(cl,:)));%Nx3
     Tt=bsxfun(@times,T,t);%Nx3
     T_F=(t')*Tt;  %3x3
     if(T_F==zeros(3,3))
          Sig{cl,1}=zeros(3,3);
     else
          %disp(T_F);
          %disp(Sum_pik(1,cl));
          if Sum_pik(1,cl)==0
            Sig{cl,1}=zeros(3,3);
          else
            Sig{cl,1}=T_F/Sum_pik(1,cl);
          end
     end  
     
   end
   
   
  end
  
  %Calculating p(c_i)
  
  MAT_gkci=zeros(K,N_i); 
  for cl=1:K
      t=single(bsxfun(@minus,Iv,Mu_k(cl,:)));
      cov_k=Sig{cl,1};
      if det(cov_k)==0
         MAT_gkci(cl,:)=zeros(1,N_i);
      else
         Tt=-(t*inv(cov_k))/2; %Nx3
         Ft=bsxfun(@times,Tt,t); %t is N*3
         Above=sum(Ft,2); %Nx1
         det_k=abs(det(cov_k));
         g_ck=(1/sqrt(det_k))*exp(Above);  %Nx1 matrix
         MAT_gkci(cl,:)=(g_ck(:,1))';
      end
    end
    
  Dot_pro=bsxfun(@times,W_k,MAT_gkci);
  p_ci=(sum(Dot_pro))'; %Nx1
  prob_image=reshape(p_ci,H,W);
  
  
end
