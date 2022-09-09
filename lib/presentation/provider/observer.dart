import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class Observer implements ProviderObserver {
  @override
  void didAddProvider(
      ProviderBase provider, Object? value, ProviderContainer container) {
    log(provider.name.toString());
  }

  @override
  void didDisposeProvider(ProviderBase provider, ProviderContainer containers) {
    log(provider.name.toString());
  }

  @override
  void didUpdateProvider(ProviderBase provider, Object? previousValue,
      Object? newValue, ProviderContainer container) {
    log(provider.name.toString());
  }

  @override
  void providerDidFail(ProviderBase provider, Object error,
      StackTrace stackTrace, ProviderContainer container) {
    log(provider.name.toString());
  }
}
