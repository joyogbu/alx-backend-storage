#!/usr/bin/env python3
'''Python function that lists all documents in a collection'''


import pymongo
from pymongo import MongoClient


#client = MongoClient()

#if __name__ == "__main__":
def list_all(mongo_collection):
    '''defining the function'''
    if __name__ == "__main__":
        my_list = []
        client = MongoClient()
        for res in client.mongo_collection.find():
            my_list.append(res)
            return (my_list)
