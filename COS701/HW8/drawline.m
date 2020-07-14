function img=drawline(img,x1,y1,x2,y2)   %?????????????y????????????y??????
    y1=-y1;
    y2=-y2;
    k=(y2-y1)/(x2-x1);
    b=y1-k*x1;
    
    mi=min(x1,x2);
    ma=max(x1,x2);
    for i=mi:ma
       img(-round(i*k+b),i)=0; 
    end
    
    mi=min(y1,y2);
    ma=max(y1,y2);
    for i=mi:ma
       img(-i,round((i-b)/k))=0; 
    end

end