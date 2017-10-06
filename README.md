# Prediction

## Description
Predicting solar generation based on weather forecast - a project which was part of [Machine Learning](https://en.wikipedia.org/wiki/Machine_learning) course at BITS Pilani

## Data Collection

Among the many different data sets we went through, we found the weather data from a [Davis Weather station in Amherst, Massachusetts](http://traces.cs.umass.edu/index.php/Sensors/Sensors) most suitable. The data was collected periodically every five minutes.

### Attributes of the dataset

-	Temperature: The temperature is measured in °C.
-	Wind-chill: Wind-chill is the perceived decrease in air temperature felt by the body on exposed skin due to the flow of air. In this dataset it is measured in °C.
-	Humidity: Humidity is the amount of water vapor in the air. Relative humidity, expressed as a percent, measures the current absolute humidity relative to the maximum for that temperature. The dataset has values for relative humidity.
-	Dew-point: The dew point is the temperature at which the water vapor in a sample of air at constant barometric pressure condenses into liquid water at the same rate at which it evaporates. The dataset records dew point in °C.
-	Wind speed: Wind speed is measured in miles/hour (mph) 
-	Wind direction: Wind direction is measured in degrees (°).
-	Rain: Rainfall is measured in mm.
-	Pressure: Pressure is measured in inHg (inches of mercury).
-	Solar Intensity: Solar intensity refers to the amount of sunlight hitting the planets surface. Latitude is the North-South position on the planet. Solar intensity varies with latitude based on the shape and angle of the planet. In the dataset the solar intensity is measured in watts/sq. meter (w/m2)
-	Evapotranspiration (ET): It is the sum of the evaporation and plant transpiration from the Earth’s land and ocean surface to the atmosphere. It is expressed in feet. 
-	UltraViolet index: It is an international standard measurement of the strength of ultraviolet (UV) radiation from the sun at a particular place and time.
- 	Day of the year: It is the specific day of the year numbered from 1 to 365.
-	Time of the day: This is included as a timestamp. 

The last two attributes are included because daylight on particular instant of time influences solar intensity and varies throughout the year for a given location.

## Algorithms Used

### 1.	[Linear Regression](https://en.wikipedia.org/wiki/Linear_regression)

The multivariate linear regression method is implemented using three different algorithmic techniques in MATLAB R2013b.
-	mvn (multivariate normal maximum likelihood estimation)
-	ecm(expectation maximization algorithm)
-	cwls(Covariance-weighted least squares estimation)

### 2.	[Principal Component Analysis(PCA)](https://en.wikipedia.org/wiki/Principal_component_analysis)

The original dataset consisted of thirteen independent variables as discussed above and one response variable. Since the dimension of data was too large, it has been trained on the data collected at noon in the year 2010. [Principal Component Regression(PCR)](https://en.wikipedia.org/wiki/Principal_component_regression) is also implemented that performs a regression analysis on the observed principal components obtained from PCA which identifies those set of parameters that captures high variability. From this analysis, seven features have shown maximum variability in the data. The parameters were Temperature, Humidity, Dew point, Wind speed, Pressure, Day, Evapotranspiration. Thus the model is limited to only these seven parameters as the remaining parameters did not affect much in the variability of the data.   


