// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'dart:async';

// slebew
typedef TelegramClientCallApiInvoke = FutureOr<Map> Function({
  required Map parameters,
  bool? is_invoke_no_relevance,
});
