import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pop_network/pop_network.dart';
import 'package:rick_and_morty/core/interceptors/log_interceptor.dart';
import 'package:rick_and_morty/feature/app.dart';

void main() {
  runZonedGuarded(
    () async {
      await Network.config(
          baseUrl: 'https://rickandmortyapi.com/api',
          interceptors: [
            LogInterceptor(),
          ]);
      runApp(const MyApp());
    },
    (Object error, StackTrace stackTrace) {
      debugPrint(error.toString());
    },
  );
}
