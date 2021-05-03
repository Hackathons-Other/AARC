#!/usr/bin/env python
# coding: utf-8

# In[1]:


import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import datetime as dt


# In[2]:


analysts = pd.read_csv('./analysts_dataset.csv', 
                       parse_dates=['Date'],)
analysts.head()


# In[3]:


analysts.rename({'Analyst Name':'Name'}, axis=1, inplace=True)
dropcols = ['Prediction Source', 'Result Source']
analysts = analysts.drop(dropcols, axis=1)
analysts


# In[93]:


def get_metrics(name):
    preds = analysts[analysts['Name']==name].drop('Name', axis=1)
    results = {}
    
    ### METRICS
    # accuracy
    x = preds[['1mo', '6mo', '12mo']].to_numpy().flatten().astype(float)
    x = x[~np.isnan(x)]
    results['accuracy'] = sum(x)/len(x)
    
    # experience
    earliest, latest = preds['Date'].min(), preds['Date'].max()
    analyst_exp = (latest-earliest).days
    cumulative_exp = (analysts['Date'].max() - analysts['Date'].min()).days
    results['experience'] = analyst_exp / cumulative_exp
    
    # topic influence
    
    # FIGURES
    
    # topic dist
    group = preds[['Topic', 'Prediction']].groupby(by=['Topic']).count()
    counts = np.array(group['Prediction'])
    xs = np.array(group.index)
    topic_dist_fig = plt.bar(xs, counts/sum(counts))
    plt.xlabel('Topic')
    plt.ylabel('Proportion')
    plt.title('Distribution of predictions per topic')
    plt.show()
    plt.clf()
    
    # experience over time
    curr = dt.datetime.now()
    days_diff = (curr - earliest).days
    timerange = np.array([earliest + dt.timedelta(days=i) for i in range(days_diff)])
    cumsum_time = preds[['Prediction']].groupby(pd.cut(preds['Date'], bins=timerange)).count()
    ys = np.cumsum(cumsum_time['Prediction'])
    start_str, end_str = earliest.strftime("%Y-%m-%d"), ys.index[-1].left.strftime("%Y-%m-%d")
    xs = pd.date_range(start_str, end_str).tolist()
    plt.plot(xs,np.array(ys))
    plt.xlabel('time')
    plt.ylabel('count')
    plt.show()
    plt.clf();
    
    return results


# In[94]:


res1 = get_metrics('Rod Hall')


# In[ ]:


unique_ana = np.unique(analysts['Name'])

ana_metrics = dict.from_keys(unique_ana)

for ana in unique_ana:
    ana_metrics = get_metrics(ana)

