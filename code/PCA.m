const = 450;
filename='Extracted_Data.xlsx';

dataset = xlsread(filename,3,'A3:N307');

D=dataset(:,1:13);
B = zscore(D);

[COEFF SCORE LATENT] = princomp(B);

final_matrix = B*COEFF(:,1:13);

coeff = mvregress(final_matrix(:,:),dataset(:,14));

expy_mvregress = (final_matrix(1:10,:))*coeff;
expy_mvregress = expy_mvregress + const


