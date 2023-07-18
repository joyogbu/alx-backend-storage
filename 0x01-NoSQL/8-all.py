#!/usr/bin/env python3
'''Python function that lists all documents in a collection'''


import pymongo
from pymongo import MongoClient


#client = MongoClient()

if __name__ == "__main__":
def list_all(mongo_collection):
    '''defining the function'''
    client = MongoClient()
    res = client.mongo_collection.find()
    return res
