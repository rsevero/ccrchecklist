#!/bin/bash

date
flutter clean
flutter pub get
dart run build_runner build -d
flutter build appbundle
date
