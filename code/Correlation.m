filename='Extracted_Data.xlsx';
dataset_new = xlsread(filename,2,'B3:I307');

meaD = mean(dataset_new);
mean = meaD;

for i = 1:304
    mean = [mean; meaD];
end

dataset_new = mean - dataset_new;

S=dataset_new'*dataset_new;
S = S/305;

corrcov(S)