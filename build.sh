#!/bin/bash
# git clean -Xfd # clean all files in .gitignore
code_path=`pwd`

# rm -rf $code_path/simple_live_app/build
# rm -rf $code_path/simple_live_app/.flutter-plugins-dependencies
# rm -rf $code_path/simple_live_app/.flutter-plugins
# rm -rf $code_path/simple_live_app/.pubspec.lock
# rm -rf $code_path/simple_live_app/android/gradle-wrapper.jar
# rm -rf $code_path/simple_live_app/android/.gradle
# rm -rf $code_path/simple_live_app/android/captures/
# rm -rf $code_path/simple_live_app/android/gradlew
# rm -rf $code_path/simple_live_app/android/gradlew.bat
# rm -rf $code_path/simple_live_app/android/local.properties
# rm -rf $code_path/simple_live_app/android/GeneratedPluginRegistrant.java
# rm -rf $code_path/simple_live_app/android/.cxx/

docker run --rm \
  -v $code_path:/work \
  -w /work/simple_live_app \
  ghcr.io/cirruslabs/flutter:stable \
  bash -lc "flutter --version && yes | sdkmanager --licenses >/dev/null && flutter pub get && flutter build apk --release" \
&& cp $code_path/simple_live_app/build/app/outputs/flutter-apk/app-release.apk /mnt/c/Users/pengs/Downloads/


  # -v flutter_pub_cache:/root/.pub-cache \
  # -v gradle_cache:/root/.gradle \