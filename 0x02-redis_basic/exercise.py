#!/usr/bin/env python3
'''writing strings to reddis'''


import uuid
import redis
from typing import Any, Union, Optional, Callable
from functools import wraps


red = redis.Redis()
#@decorator
def count_calls(method: Callable) -> Callable:
    '''defining the function'''
    @wraps(method)
    def create_count(self, *args, **kwargs):
        '''defining wrapped function'''
        self._redis.incr(self.__qualname__)
        return method(*args)
    return (create_count)

class Cache:
    '''class for cache'''

    def __init__(self) -> None:
        '''initializing the class'''
        self._redis = redis.Redis()
        self._redis.flushdb()

    @count_calls
    def store(self, data: Union[int, float, bytes, str]) -> str:
        '''defining the store function'''
        random_key = uuid.uuid4()
        str_key: str = str(random_key)
        self._redis.set(str_key, data)
        return (str_key)

    def get(self, key: str, fn: Optional[Callable]) -> bytes:
        '''defining the function'''
        if key not in self._redis:
            return None
        res = self._redis.get(key)
        return (res)

    def get_str(self) -> str:
        '''defining the function'''
        res_str = str(self.get())

    def get_int(self) -> int:
        '''defining the function'''
        re = int(self.get())
        return (re)
