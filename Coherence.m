function   Coherence(fr_s1,fr_s2,fr_Y_env, fr_Y_cert,R)

%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
 clear inform;M=1;
     clear  fi1  fi2  fi3  fn1  fn2  fn3 
     inform(1,:)=R(:,1);inform(2,:)=R(:,3);inform(3,:)=R(:,4);inform(4,:)=R(:,5);
    for i=1:73
       data_select(i).sbject.S_fr_Y_env=cell(1,1);         
       data_select(i).sbject.informm=zeros(1,1);
       data_select(i).sbject.s1fi=cell(1,1);    
      data_select(i).sbject.s2fi=cell(1,1);  
      data_select(i).sbject.S_fr_Y_cert=cell(1,1);  
    end
     for i=1:73 
     data_select(i).sbject.S_fr_Y_env=cell(1,200);         
     data_select(i).sbject.informm=inform(:,M:M+199);
      M=M+200;
     end
     M=1;
     for i=1:73  
         for j=1:200
     data_select(i).sbject.s1fi{1,j}=fr_s1{1,M};
     data_select(i).sbject.s2fi{1,j}=fr_s2{1,M};
      M=M+1;
         end
     end
     M=1;
      for i=1:73  
         for j=1:200
     data_select(i).sbject.S_fr_Y_env{1,j}=fr_Y_env{1,M};
     data_select(i).sbject.S_fr_Y_cert{1,j}=fr_Y_cert{1,M};
      M=M+1;
         end
      end
  clear inform inform1 e1 e2 e3 fi1 fi2 fi3 clear index1 index2;
      A=1 ;B=1;C=1;
     for i=1:73
     coh=0;error=0;
     inform=data_select(i).sbject.informm;j=2;
      while(j<=199)
           if(inform(4,j)==0) %&& inform(4,j-1)==0
          if  (inform(3,j)~=inform(3,j+1))% && inform(4,j+1)==1) % ||(inform(4,j)==1 && inform(3,j)==inform(3,j-1)))
             coh=inform(1,j);%+inform(1,j-1);
              if  coh>=12.8                 
               index1(1,C)=(i-1)*200+j;C=C+1; 
              else coh<12.8 && coh~=0
               index2(1,A)=(i-1)*200+j;A=A+1;
              end
          end 
           end
            j=j+1;
  end     
     end 
     %%
      clear  ing_coh3  ing_coh2  ing_coh1 Mean_ing1 Mean_ing2 Mean_ing3  aing_coh1  aing_coh2  aing_coh3
   clear cet_coh3  cet_coh2  cet_coh1 Mean_cet1 Mean_cet2 Mean_cet3  acet_coh1  acet_coh2  acet_coh3
   clear  ama_ing1 ama_ing2 ama_ing3  ama_cet1  ama_cet2 ama_cet3  Tnan1
   clear  s1_coh3  s1_coh2  s1_coh1 Mean_s11 Mean_s12 Mean_s33  as1_coh1  as1_coh2  as1_coh3
   clear  s2_coh3  s2_coh2  s2_coh1 Mean_s21 Mean_s22 Mean_s33  as2_coh1  as2_coh2  as2_coh3
   k1=size(index1,2); anum1=randi([1 k1],1,20);
   k2=size(index2,2); anum2=randi([1 k2],1,20);
   clear allre3 allre2 allre1 as  ama_env1  ama_env2  ama_env3
   clear numnan1 numnan2 numnan3 arrmean1 arrmean2 arrmean3  aing_coh2
   clear acet_coh2 as1_coh2   as2_coh2
     
   Nindex2=size(index2,2);
   for i=1: Nindex2
     k=index2(1,i);
   aing_coh2{1,i}=fr_Y_env{1,k};aing_coh2{1,i}(end,1)=NaN;
    acet_coh2{1,i}=fr_Y_cert{1,k};
    as1_coh2{1,i}=fr_s1{1,k};
    as2_coh2{1,i}=fr_s2{1,k};
   end 
    Nindex1=size(index1,2);
   for i=1: Nindex1
     k=index1(1,i);
     aing_coh1{1,i}=fr_Y_env{1,k};aing_coh1{1,i}(end,1)=NaN;
     acet_coh1{1,i}=fr_Y_cert{1,k};
     as1_coh1{1,i}=fr_s1{1,k};
     as2_coh1{1,i}=fr_s2{1,k};
   end
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%       
   for i=1: Nindex1       
    num_aing(1,i)=size(aing_coh1{1,i},1);
        num_acet(1,i)=size(acet_coh1{1,i},1);
        num_as1(1,i)=size(as1_coh1{1,i},1);  
        num_as2(1,i)=size(as2_coh1{1,i},1); 
       end 
       for i=1: Nindex2       
        num_aing(2,i)=size(aing_coh2{1,i},1);
        num_acet(2,i)=size(acet_coh2{1,i},1);
        num_as1(2,i)=size(as1_coh2{1,i},1); 
        num_as2(2,i)=size(as2_coh2{1,i},1); 
       end 
     
       ama_ing1=nan(max(num_aing(1,:)),Nindex1);ama_ing2= nan(max(num_aing(2,:)),Nindex2);
       ama_cet1=nan(max(num_acet(1,:)),Nindex1);ama_cet2= nan(max(num_acet(2,:)),Nindex2);
       ama_s11=nan(max(num_as1(1,:)),Nindex1);ama_s12= nan(max(num_as1(2,:)),Nindex2);
       ama_s21=nan(max(num_as2(1,:)),Nindex1);ama_s22= nan(max(num_as2(2,:)),Nindex2);

        for i=1: Nindex1
         ans=aing_coh1{1,i};a=size(ans,1);ama_ing1(1:a,i)=ans;clear ans a;
         ans=acet_coh1{1,i};a=size(ans,1);ama_cet1(1:a,i)=ans;clear ans a;
         ans=as1_coh1{1,i};a=size(ans,1);ama_s11(1:a,i)=ans;clear ans a;
         ans=as2_coh1{1,i};a=size(ans,1);ama_s21(1:a,i)=ans;clear ans a;
        end
         for i=1: Nindex2
         ans=aing_coh2{1,i};a=size(ans,1);ama_ing2(1:a,i)=ans;clear ans a;
         ans=acet_coh2{1,i};a=size(ans,1);ama_cet2(1:a,i)=ans;clear ans a;
         ans=as1_coh2{1,i};a=size(ans,1);ama_s12(1:a,i)=ans;clear ans a;
         ans=as2_coh2{1,i};a=size(ans,1);ama_s22(1:a,i)=ans;clear ans a;
         end
        
        %%%%%%%%%%%%%%%%%%%%%
        for i=1:max(num_aing(1,:))
          clear ans; ans=isnan((ama_ing1(i,:)));ans=find(ans==1);Tnan1(i,1)= length(ans);
        end
         for i=1:max(num_aing(2,:))
          clear ans; ans=isnan((ama_ing2(i,:)));ans=find(ans==1);Tnan1(i,3)= length(ans);
         end
          for i=1:size(ama_ing1,2)
             ama_ing1(:,i)=  ama_ing1(:,i)- ama_ing1(1,i);
          end
        for i=1:size(ama_ing2,2)
             ama_ing2(:,i)=  ama_ing2(:,i)- ama_ing2(1,i);
        end
         clear  Mean_ing1 Mean_ing2 Mean_ing3
          Tnan1(:,2)= Nindex1-Tnan1(:,1);Mean_ing1(:,1)=mean(ama_ing1,2,'omitnan');
          Tnan1(:,4)= Nindex2-Tnan1(:,3);Mean_ing2(:,1)=mean(ama_ing2,2,'omitnan');
          %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
          clear Mean_cet1 Mean_cet2 Mean_cet3
         Mean_cet1(:,1)=mean(ama_cet1,2,'omitnan');
         Mean_cet2(:,1)=mean(ama_cet2,2,'omitnan');
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
       for i=1:size(ama_s11,2)
           ama_s11(:,i)=ama_s11(:,i)-ama_s11(1,i);
           ama_s21(:,i)=ama_s21(:,i)-ama_s21(1,i);
       end
       for i=1:size(ama_s12,2)
           ama_s12(:,i)=ama_s12(:,i)-ama_s12(1,i);
           ama_s22(:,i)=ama_s22(:,i)-ama_s22(1,i);
       end
        
        clear  Mean_s11  Mean_s12  Mean_s13  Mean_s21  Mean_s22  Mean_s23
         Mean_s11(:,1)=mean(ama_s11,2,'omitnan');
         Mean_s12(:,1)=mean(ama_s12,2,'omitnan');
         Mean_s21(:,1)=mean(ama_s21,2,'omitnan');
         Mean_s22(:,1)=mean(ama_s22,2,'omitnan');
          %%%%%%%%%%%%%%
          figure;
       for j=1:20 
        hold all;ii1=anum1(1,j);i1=index1(ii1);
        ii2=anum2(1,j);i2=index2(ii2);
        clear coh1 coh2 coh3 ir1 ir2 ir3;        
        ing_coh2= fr_Y_env{1,i2}; ing_coh2(:,1)=ing_coh2(:,1)-ing_coh2(1,1);%coh2(:,end)=coh2(:,end);%+fr_Y_cert{1,i-1}(:,end);
        ing_coh1= fr_Y_env{1,i1}; ing_coh1(:,1)=ing_coh1(:,1)-ing_coh1(1,1);%coh1(:,end)=coh1(:,end);%+fr_Y_cert{1,i-2}(:,end);
        plot(ing_coh1,'color',[1 0 1]); plot(ing_coh2,'color',[0 1 1]);
       end
        hold all; 
         n1=plot(Mean_ing1(1:1500,1),'m','linewidth',2); hold all;
         n2=plot(Mean_ing2(1:1500,1),'c','linewidth',2); hold all;
        % text(1,.7,'Integral Population ','FontSize',10);
         x=[0,0];y=[-0.05 .65];
         line(x,y,'Color','black','LineStyle','--');
         set(gca,'TickDir','out');
         set(gca, 'YTick',[0 .35 .7 ],'FontSize',10);
         set(gca, 'XTick',[0 1500])
         axis([-100 1800 -0.05 .7])      
         x0=0;y0=0;width=330.045524;height=250.585736;%width=660.091047;
         set(gcf,'position',[x0,y0,width,height]);
         set(gca,'TickDir','out');
         xlabel('Time relative to feedback (ms)','FontSize',10);  
         ylabel('Firing rate(Hz)','FontSize',10);
         legend('boxoff');legend([n1,n2],'High coh','Low coh','FontSize',8);
     %%%%%%%%%%%%%%%%%%%%%%%%
   figure;
   for j=1:20 
    hold all;ii1=anum1(1,j);i1=index1(ii1);
    ii2=anum2(1,j);i2=index2(ii2); 
    cet_coh2= fr_Y_cert{1,i2};%er2(:,end)=er2(:,end);%+fr_Y_cert{1,i-1}(:,end);
    cet_coh1= fr_Y_cert{1,i1};%coh1(:,end)=coh1(:,end);%+fr_Y_ccoht{1,i-2}(:,end);
    plot(cet_coh1,'color',[1 0 1]); plot(cet_coh2,'color',[0 1 1]);
   end
     hold all; 
     n1=plot(Mean_cet1(1:1574,1),'m','linewidth',2); hold all;
     n2=plot(Mean_cet2(1:1660,1),'c','linewidth',2); hold all;
    % text(1,40,'Certainty Population','FontSize',10);
    x=[0,0];y=[-0.5 35];
       line(x,y,'Color','black','LineStyle','--');
        set(gca,'TickDir','out');
        set(gca, 'YTick',[0 20 40 ],'FontSize',10);
        set(gca, 'XTick',[0 1500])
        axis([-100 1800 -0.5 45])      
     x0=0;y0=0;width=330.045524;height=250.585736;%width=660.091047;
     set(gcf,'position',[x0,y0,width,height]);
      set(gca,'TickDir','out');
     xlabel('Time relative to feedback (ms)','FontSize',10);  
     ylabel('Firing rate(Hz)','FontSize',10);
     legend('boxoff');legend([n1,n2],'High coh','Low coh','FontSize',8);

   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   
     figure;hold all;
   for j=1:20 
     hold all;ii1=anum1(1,j);i1=index1(ii1);
     ii2=anum2(1,j);i2=index2(ii2); 
     clear coh1 coh2 coh3 ir1 ir2 ir3;        
     s1_coh2=fr_s1{1,i2};s1_coh1=fr_s1{1,i1};
     s2_coh2=fr_s2{1,i2};s2_coh1=fr_s2{1,i1};
     s1_coh2(:,1)= s1_coh2(:,1)- s1_coh2(1,1);
     s1_coh1(:,1)= s1_coh1(:,1)- s1_coh1(1,1);
     s2_coh2(:,1)= s2_coh2(:,1)- s2_coh2(1,1);
     s2_coh1(:,1)= s2_coh1(:,1)- s2_coh1(1,1);   
     plot(s1_coh1,'color',[1 0 1]);hold all; plot(s2_coh1,'--','color',[1 0 1]);
     plot(s1_coh2,'color',[0 1 1]);hold all;plot(s2_coh2,'--','color',[0 1 1]);
    end 
    hold all; 
    n1= plot(Mean_s11(1:1200,1),'m','linewidth',2); hold all;
    n2=plot(Mean_s12(1:1200,1),'c','linewidth',2); hold all;
     plot(Mean_s21(1:1200,1),'--m','linewidth',2); hold all;
     plot(Mean_s22(1:1200,1),'--c','linewidth',2); hold all;
     %text(1,.8,'Sensorimorot module ','FontSize',10);
     x0=0;y0=0;width=330.045524;height=250.585736;%width=660.091047;
     set(gcf,'position',[x0,y0,width,height]);
     set(gca,'TickDir','out');
      x=[0,0];y=[-0.05 .65];
      line(x,y,'Color','black','LineStyle','--');
      set(gca,'TickDir','out');
      set(gca, 'YTick',[0 .8 ],'FontSize',10);
      set(gca, 'XTick',[0 1500])
      axis([-100 1800 -0.1 .8])    
      xlabel('Time relative to feedback (ms)','FontSize',10);  
      ylabel('Firing rate(Hz)','FontSize',10);
      legend('boxoff');legend([n1,n2],'High coh','Low coh','FontSize',8);   
     
  
end

