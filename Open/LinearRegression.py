import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
import numpy as np
from sklearn.linear_model import LinearRegression
from sklearn.model_selection import train_test_split
from sklearn import metrics

# Reading data
data = pd.read_csv('AutomobilePrice.csv')
print('Columns:', data.columns, "\n\nShape:", data.shape, '\n\n')

# Cleaning Data
'''Here we select the necessary columns, (i.e.) the most important ones which we shall take as:
"horsepower", "city-mpg", "wheel-base", "engine-size", "price" and we drop the others'''
feature_cols = ['horsepower', 'city-mpg', 'wheel-base', 'engine-size', 'price',]
data = data[feature_cols]
data = data[data.columns].replace(0, np.NaN)
# Dropping rows where 'price' is NaN
data.dropna(subset=['price'], inplace=True)
print(data.shape, data.info(), data.isnull().sum(), sep='\n\n')
# Handling missing values
# imputing them with median strategy
data.fillna(data.median(), inplace=True)
print(data.isnull().sum(), '\n')


plt.figure(1)
plt.title("Correlation plot")
sns.heatmap(data.corr())
plt.show()
'''This plot tells the dependance among two variables xi, xj.
If the depedance is low then they can be said to behave independant( value is near 0).
Otherwise, if they are dependant (value of corr is closer to +1 or -1 then one of the variable is removed.
here as the columns chosen are quite independant we are not dropping any column.'''
print(data.describe(), '\n')


fig, axs = plt.subplots(1, 4, sharey=True)
data.plot(kind='scatter', x='horsepower', y='price', ax=axs[0], figsize=(16,8))
data.plot(kind='scatter', x='city-mpg', y='price', ax=axs[1], figsize=(16,8))
data.plot(kind='scatter', x='wheel-base', y='price', ax=axs[2], figsize=(16,8))
data.plot(kind='scatter', x='engine-size', y='price', ax=axs[3], figsize=(16,8))
plt.show()


# Split data
'''We have to split data so that we can train and test our model.
Here we shall take train:test=4:1 ratio split'''
X = data.iloc[:, :-1]
y = data.price
X_train, X_test, y_train, y_test = train_test_split(X, y, train_size=0.8, random_state=0)
# To see whether X_train has enough values, it is print
print(X_train.shape, '\n')

# Train Model
lm = LinearRegression()
lm.fit(X_train, y_train)
print("\nTrained Model:", '\tIntercept:', lm.intercept_, "\n\tCoefficients:", lm.coef_, '\n')


# Score Model
'''Here prediction for tested values is obtained'''
y_pred = lm.predict(X_test)
df = pd.DataFrame({'Actual': np.array(y_test).flatten(), 'Predicted': np.array(y_pred).flatten()})
df1 = df.head(25)

df1.plot(kind='bar', figsize=(32,16))
plt.grid(which='major', linestyle='-', linewidth='0.5', color='green')
plt.grid(which='minor', linestyle=':', linewidth='0.5', color='black')
plt.title("Comparision b/w Actual, Predicted")
plt.xlabel("'n'th Case")
plt.ylabel("Price")
plt.show()


# Evaluate Model
print("Evaluation of Model:")
print('\tMean Absolute Error: {:.3f}'.format(metrics.mean_absolute_error(y_test, y_pred)))  
print('\tMean Squared Error: {:.3f}'.format(metrics.mean_squared_error(y_test, y_pred)))
print('\tRoot Mean Squared Error: {:.3f}'.format(np.sqrt(metrics.mean_squared_error(y_test, y_pred))))
print('\tMean of Actual Price: {:.3f}'.format(df.Actual.mean()))
print('\tMean of Actual Price / RMS-Error: {:.3f}'.format(np.sqrt(metrics.mean_squared_error(y_test, y_pred))/df.Actual.mean()))


# Conclusion / Interpretation:
'''
The RMS-Error is around 29% of Mean Actual Price.
This is not a really accurate model but it can help us to roughly tell the prices.
'''