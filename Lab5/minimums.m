function mins = minimums(numbers, k)
  mins = ones(k,size(numbers,2));
 for d=1:size(numbers,2)
 for i=1:size(numbers,1)
    if(numbers(i,d)<numbers(mins(1,d),d)||i<=k)
        mins(1,d) = i;
        for j=1:size(mins,1)-1;
            if(mins(j,d) > mins(j+1,d))
                temp = mins(j+1,d);
                mins(j+1,d) = mins(j,d);
                mins(j,d) = temp;
            end
        end
    end
 end
  end