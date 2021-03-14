#!/usr/bin/env python
# coding: utf-8


import pandas as pd
from scipy.spatial import KDTree
from tabpy.tabpy_tools.client import Client

connection = Client('http://localhost:9004/')


def rec(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10,
                    arg11, arg12, arg13, arg14, arg15, arg16):

    _arg1 = arg1[0]
    _arg2 = arg2[0]
    _arg3 = arg3[0]
    _arg4 = arg4[0]
    _arg5 = arg5[0]
    _arg6 = arg6[0]
    _arg7 = arg7[0]
    _arg8 = arg8[0]
    _arg9 = arg9[0]
    _arg10 = arg10[0]
    _arg11 = arg11[0]
    _arg12 = arg12[0]
    _arg13 = arg13[0]
    _arg14 = arg14[0]
    _arg15 = arg15[0]
    _arg16 = arg16[0]

    data = pd.read_csv('data_cleaned.csv')

    search = pd.DataFrame([[_arg1, _arg2, _arg3, _arg4, _arg5, _arg6, _arg7, _arg8, _arg9, _arg10, _arg11, _arg12, _arg13, _arg14, _arg15]])

    characteristics = data[["acousticness", "danceability", "duration_s", "energy", "explicit", "instrumentalness", "key", "liveness", "loudness", "mode", "popularity", "speechiness", "tempo", "valence", "year"]]

    kdb = KDTree(characteristics.values)

    results_indexes = kdb.query(search.values, k=5)[-1]

    return str(data.iloc[results_indexes[0][_arg16]]["name"]) + " by " + str(data.iloc[results_indexes[0][_arg16]]["artists"]).replace("'","").replace("[","").replace("]","")

connection.deploy('rec1', rec,
'Return recommended song')
