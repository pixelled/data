#!/bin/bash

mongod &
sleep 1
echo -e \
"use pixelled\n
db.art.insertOne({ name: 'girl1.png', width: 5000, height: 3000, date: new Date() })\n
quit()" \
| mongosh

sleep .5
mongoexport --collection=art --db=pixelled --out=images.json --jsonArray

sleep .5
echo -e \
"use admin\n
db.shutdownServer()\n
quit()" \
| mongosh
