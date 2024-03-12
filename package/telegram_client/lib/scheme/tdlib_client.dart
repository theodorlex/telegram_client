// ignore_for_file: non_constant_identifier_names, camel_case_extensions, camel_case_extensions empty_catches, unnecessary_brace_in_string_interps

import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:general_lib/general_lib.dart';

/// add state data
class TdlibClient {
  int client_id;
  int client_user_id;
  bool is_bot;
  Map client_option;
  Map client_dynamic = {};
  DateTime join_date = DateTime.now();
  TdlibClientCache tdlibClientCache = TdlibClientCache();

  /// add state data
  TdlibClient({
    required this.client_id,
    required this.client_option,
    this.is_bot = false,
    this.client_user_id = 0,
  });

  /// add state data
  Map toJson() {
    return {
      "client_id": client_id,
      "client_user_id": client_user_id,
      "join_date": join_date.millisecondsSinceEpoch,
    };
  }

  /// add state data
  @override
  String toString() {
    return json.encode(toJson());
  }
}

/// add state data
class TdlibClientCache {
  /// add state data
  List<TdlibClientCacheData> tdlibClientCacheDatas = [];

  /// add state data
  TdlibClientCache();

  /// add state data
  void clear() {
    tdlibClientCacheDatas = [];
  }

  static bool isCanGetCacheByMethod({
    required String methodName,
  }) {
    if (RegExp(r"^(get|search)", caseSensitive: false).hasMatch(methodName)) {
      return true;
    }
    return false;
  }

  /// add state data
  bool addCacheByMethod({
    required String methodName,
    required Map result,
    required Duration durationExpired,
  }) {
    if (isCanGetCacheByMethod(methodName: methodName) == false) {
      return false;
    }
    TdlibClientCacheData? tdlibClientCacheData = getCacheByMethod(methodName: methodName);
    TdlibClientCacheData tdlibClientCacheData_new = TdlibClientCacheData.init(
      methodName: methodName,
      result: result,
      durationExpired: durationExpired,
    );
    if (tdlibClientCacheData != null) {
      tdlibClientCacheDatas.add(tdlibClientCacheData_new);
      return true;
    }
    tdlibClientCacheDatas.removeWhere((element) => RegExp("^${methodName}\$", caseSensitive: true).hashData(element.methodName));

    tdlibClientCacheDatas.add(tdlibClientCacheData_new);
    return true;
  }

  /// add state data
  TdlibClientCacheData? getCacheByMethod({
    required String methodName,
  }) {
    TdlibClientCacheData? tdlibClientCacheData = tdlibClientCacheDatas.firstWhereOrNull((element) => RegExp("^${methodName}\$", caseSensitive: true).hashData(element.methodName));
    if (tdlibClientCacheData != null) {
      if (tdlibClientCacheData.dateTimeExpireDate.isExpired()) {
        tdlibClientCacheDatas.removeWhere((element) => RegExp("^${methodName}\$", caseSensitive: true).hashData(element.methodName));
        return null;
      }
    }
    return tdlibClientCacheData;
  }
}

/// add state data
class TdlibClientCacheData {
  String methodName;
  Map result;
  DateTime dateTimeExpireDate;

  /// add state data
  TdlibClientCacheData({
    required this.methodName,
    required this.result,
    required this.dateTimeExpireDate,
  });

  /// add state data
  static TdlibClientCacheData init({
    required String methodName,
    required Map result,
    required Duration durationExpired,
  }) {
    return TdlibClientCacheData(
      methodName: methodName,
      result: result,
      dateTimeExpireDate: DateTime.now().add(durationExpired),
    );
  }
}

/// add state data
class TdlibClientExit {
  int client_id;

  /// add state data
  TdlibClientExit({
    required this.client_id,
  });
}
