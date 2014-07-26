correct_distances = [];
imposter_distances = [];

for j = 1:length(veins)
   [id, distance, distances] = test_identity (j, 0.8, veins);
   distances = sort (distances, 'ascend');
     
   if ( mod(j,2) == 0)
       answer = j-1;
   else
       answer = j+1;    
   end
   
   if (id ~= answer)
       fprintf ('Incorrect for %i. Detected as %i, actually %i. Distance was %0.3f\n', j, id, answer, distance); 
       imposter_distances = [imposter_distances ; distances(2:end)]; 
   else
       correct_distances = [correct_distances ; distances(2)]; %since first one in sorted order is 0
       imposter_distances = [imposter_distances ; distances(3:end)];
   end
end