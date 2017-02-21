#!/usr/bin/env bash

cd shared
if [ ! -d "db" ]; then
    mkdir db
fi
cd db
if [ ! -d .git ]; then
    git clone https://github.com/t3kit/t3kit_db.git .
fi;
cd ..

if [ ! -d "site" ]; then
    mkdir site
fi
cd site
if [ ! -d .git ]; then
    git clone https://github.com/t3kit/t3kit_composer.git .
    composer install

    cd typo3conf/ext/theme_t3kit
    git submodule update --init

    cd ../theme_t3kit_bluemountain
    git submodule update --init
fi;
