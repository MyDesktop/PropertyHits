#!/usr/bin/env python

import requests
import json

url = "https://api.mydesktop.com.au/cgi-bin/test/propertyhits.cgi"

headers = {'Content-type': 'application/json'}

properties = [
    {
        'UniqueID': '4500199',
        'AgentID': '12345',
        'Date': '2014-09-05',
        'Hits': '114'
    },
    {
        'UniqueID': '4500200',
        'AgentID': '12345',
        'Date': '2014-09-05',
        'Hits': '205'
    }
]

data = {'Apikey': '54321abcde', 'Test': '0', 'Properties': properties}

r = requests.post(url, data=json.dumps(data), headers=headers)

status = r.status_code

if (status == 403):
    print("403 Forbidden")
elif (status == 401):
    print("401 Unauthorized")
else:
    print(r.text)
