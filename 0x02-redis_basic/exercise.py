#!/usr/bin/env python3
'''writing strings to reddis'''


import uuid
import redis


class Cache:
    '''class for cache'''

    def __init__(self):
        '''initializing the class'''
        self._redis = redis.Redis()
        self._redis.flushdb()

    def store(self, data) -> str:
        '''defining the store function'''
        random_key = uuid.uuid4()
        str_key = str(random_key)
        self._redis.set(str_key, data)
        return (str_key)
