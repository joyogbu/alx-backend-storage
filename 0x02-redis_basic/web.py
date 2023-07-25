#!/usr/bin/env python3
'''Implementing an expiring web cache and tracker'''


import requests


def get_page(url: str) -> str:
    '''defining the function'''
    res = requests.get(url)
    res_text = res.text
    return (res_text)
