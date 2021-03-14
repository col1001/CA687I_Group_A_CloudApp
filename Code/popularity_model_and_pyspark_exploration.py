#!/usr/bin/env python
# coding: utf-8

# Popularity model testing and pyspark testing used with original, uncleaned
# data source "data.csv"

import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.neighbors import KNeighborsClassifier
from sklearn.linear_model import LinearRegression
from sklearn.tree import DecisionTreeClassifier
from sklearn.linear_model import Lasso
from sklearn.model_selection import cross_val_score
import matplotlib as plt
import numpy as np

data = pd.read_csv('data.csv')
data.drop_duplicates(subset="id", keep=False, inplace=True)

print(len(data['id'].unique()))

del data['name']
del data['release_date']
del data['duration_ms']
del data['key']
del data['liveness']
del data['valence']
del data['mode']
del data['danceability']
del data['explicit']
del data['tempo']

data.head()

corr = data.corr()
corr.style.background_gradient(cmap='coolwarm')

train, test = train_test_split(data, test_size=0.50)

x_train = train.drop("popularity", axis=1)
x_train = x_train.drop(["id"], axis=1)

y_train = train["popularity"]

x_test = test.drop("id", axis=1).copy()
x_test = x_test.drop(["popularity"], axis=1)

y_test = test["popularity"]

knn = KNeighborsClassifier(n_neighbors = 5)
knn.fit(x_train, y_train)

ypred = knn.predict(x_test)

print(knn.score(x_test, y_test))

lr = LinearRegression()
lr.fit(x_train,y_train)
lr.predict(x_test)

print(lr.score(x_test, y_test))

ls = Lasso(alpha=0.1)
ls.fit(x_train,y_train)
ls.predict(x_test)

print(ls.score(x_test, y_test))

dct = DecisionTreeClassifier()
dct.fit(x_train,y_train)
dct.predict(x_test)

print(dct.score(x_test, y_test))

#from pyspark.sql import SQLContext
#from pyspark import SparkContext

#sc = SparkContext("local","example")
#sql_sc = SQLContext(sc)

#df = pd.read_csv('data.csv')

#s_df = sql_sc.createDataFrame(df)
#s_df_collected = s_df.collect()

#knnobj = NearestNeighbors().fit(s_df_collected)







