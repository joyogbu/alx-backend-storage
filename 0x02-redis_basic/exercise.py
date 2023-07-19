#!/usr/bin/env python3
'''writing strings to reddis'''

import uuid
import redis
class Cache:
    '''class for cache'''
    def __init__(self):
        '''initializing the class'''
        self._redis = redis.Redis()
        #flushdb _redis

    def store(self, data):
        '''defining the store function'''
        random_key = uuid.uuid4()
        self._redis.set(random_key, data)
        return (random_key)
