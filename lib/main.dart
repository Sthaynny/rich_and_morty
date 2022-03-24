import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pop_network/pop_network.dart';
import 'package:rick_and_morty/core/interceptors/log_interceptor.dart';
import 'package:rick_and_morty/feature/app.dart';
import 'package:rick_and_morty/injection_conatiner.dart';

void main() {
  runZonedGuarded(
    () async {
      await PopNetwork.config(
        baseUrl: 'https://rickandmortyapi.com/api',
        interceptors: [
          LogInterceptor(),
        ],
        mockedEnvironment: true,
      );
      setup();
      runApp(const MyApp());
    },
    (Object error, StackTrace stackTrace) {
      debugPrint(error.toString());
    },
  );
}
