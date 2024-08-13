#!/bin/bash

rm -f merged.db alignment.tsv

if [ ! -d 'macula-hebrew' ]
then
	git clone git@github.com:Clear-Bible/macula-hebrew.git --depth 1
fi

rebabel-format import macula.toml

if [ ! -d 'bhsa' ]
then
	git clone git@github.com:ETCBC/bhsa.git --depth 1
fi

python3 align_macula_tf.py

rebabel-format import bhsa.toml
