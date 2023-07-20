#!/usr/bin/env python3
'''writing strings to reddis'''


import uuid
import redis
from typing import Any, Union, Optional, Callable
from functools import wraps


# red = redis.Redis()
# @decorator
def count_calls(method: Callable) -> Callable:
    '''defining the function'''
    @wraps(method)
    def create_count(self, *args, **kwargs):
        '''defining wrapped function'''
        #key = f"self.__class__.__name__:method.__qualname__:calls"
        key = method.__qualname__
        self._redis.incr(key)
        return method(self, *args, **kwargs)
        #return res
    return (create_count)

def call_history(method: Callable) -> Callable:
    '''defining the decorator function'''
    @wraps(method)
    def create_history(self, *args):
        '''defining the wrapped functio'''
        #input_list = []
        #output_list = []
        method_name = method.__qualname__
        input_key = f"{method_name}:inputs"
        output_key = f"{method_name}:outputs"
        #for arg in args:
        #arg2 = arg.encode("utf-8")
        self._redis.rpush(input_key, str(args))
        res = method(self, *args)
        self._redis.rpush (output_key, str(res))
        return (res)
    return (create_history)

class Cache:
    '''class for cache'''

    def __init__(self) -> None:
        '''initializing the class'''
        self._redis = redis.Redis()
        self._redis.flushdb()

    @count_calls
    @call_history
    def store(self, data: Union[str, bytes, int, float]) -> str:
        '''defining the store function'''
        random_key = uuid.uuid4()
        str_key: str = str(random_key)
        self._redis.set(str_key, data)
        return (str_key)

    def get(self, key: str, fn: Optional[Callable[[str], str]] = None) -> bytes:
        '''defining the function'''
        if key not in self._redis:
        # if key:
            return None
        res = self._redis.get(key)
        #res2 = res.decode("utf-8")
        if res is not None:
            # res = res.decode("utf-8")
            if (fn):
                res = fn(res)
        return(res)
        #return None

    def get_str(self) -> str:
        '''defining the function'''
        res_str = str(self.get())

    def get_int(self) -> int:
        '''defining the function'''
        re = int(self.get())
        return (re)
