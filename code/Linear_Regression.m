filename='Extracted_Data.xlsx';
sheet=2;
dataset = xlsread(filename,2,'B3:I307');
temp_data=dataset(:,1);
humid_data=dataset(:,2);
dewpt_data=dataset(:,3);
windspeed_data=dataset(:,4);
pressure_data=dataset(:,5);
day_data=dataset(:,6);
et_data=dataset(:,7);
solar_data=dataset(:,8);

figure(1)
subplot(2,4,1);
scatter(temp_data,solar_data)
title('Intensity vs temperature')
xlabel('temperature(C)')
ylabel('Intensity(w/sq.m)')
subplot(2,4,2);
scatter (humid_data,solar_data)
title('Intensity vs humidity')
xlabel('humidity(%)')
ylabel('Intensity(w/sq.m)')
subplot(2,4,3);
scatter (dewpt_data,solar_data)
title('Intensity vs dew point')
xlabel('dew point(C)')
ylabel('Intensity(w/sq.m)')
subplot(2,4,4);
scatter (windspeed_data,solar_data)
title('Intensity vs windspeed')
xlabel('windspeed(mph)')
ylabel('Intensity(w/sq.m)')
subplot(2,4,5);
scatter (pressure_data,solar_data)
title('Intensity vs pressure')
xlabel('pressure(inHg)')
ylabel('Intensity(w/sq.m)')
subplot(2,4,6);
scatter (et_data,solar_data)
title('Intensity vs et')
xlabel('et(mm)')
ylabel('Intensity(w/sq.m)')
subplot(2,4,7);
scatter(day_data,solar_data)
title('Intensity vs day')
xlabel('day')
ylabel('Intensity(w/sq.m)')
%x=tic;
coeff_mvn = mvregress(dataset(1:240,1:7),solar_data(1:240),'algorithm','mvn');
%disp(toc(x));
%x=tic;
coeff_ecm = mvregress(dataset(1:240,1:7),solar_data(1:240),'algorithm','ecm');
%disp(toc(x));
%x=tic;
coeff_cwls = mvregress(dataset(1:240,1:7),solar_data(1:240),'algorithm','cwls');
%disp(toc(x));
expected_value_validation_mvn = dataset(1:240,1:7)*coeff_mvn;
expected_value_validation_ecm = dataset(1:240,1:7)*coeff_ecm;
expected_value_validation_cwls = dataset(1:240,1:7)*coeff_cwls;
expected_value_testing_mvn = dataset(241:305,1:7)*coeff_mvn;
expected_value_testing_ecm = dataset(241:305,1:7)*coeff_ecm;
expected_value_testing_cwls = dataset(241:305,1:7)*coeff_cwls;

figure(2)
subplot(1,3,1);
plot(day_data(1:20),expected_value_validation_mvn(1:20),'g',day_data(1:20),solar_data(1:20),'b')
legend('Predicted Intensity Value(MVN)','Actual Intensity Value')
xlabel('Day')
ylabel('Intensity(w/sq.m)')

subplot(1,3,2);
plot(day_data(1:20),expected_value_validation_ecm(1:20),'g',day_data(1:20),solar_data(1:20),'b')
legend('Predicted Intensity Value(ECN)','Actual Intensity Value')
xlabel('Day')
ylabel('Intensity(w/sq.m)')

subplot(1,3,3);
plot(day_data(1:20),expected_value_validation_cwls(1:20),'g',day_data(1:20),solar_data(1:20),'b')
legend('Predicted Intensity Value(CWLS)','Actual Intensity Value')
xlabel('Day')
ylabel('Intensity(w/sq.m)')

A1=solar_data(1:240);
A2=expected_value_validation_cwls;
er = A1 - A2; 
er = sqrt( (er(:)' * er(:)) / length(er(:)) );
RMS_ERROR_VALIDATION = er

A1=solar_data(241:305);
A2=expected_value_testing_cwls;
er = A1 - A2; 
er = sqrt( (er(:)' * er(:)) / length(er(:)) );
RMS_ERROR_TESTING = er