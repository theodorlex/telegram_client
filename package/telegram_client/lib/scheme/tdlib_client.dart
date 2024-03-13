// ignore_for_file: non_constant_identifier_names, camel_case_extensions, camel_case_extensions empty_catches, unnecessary_brace_in_string_interps, constant_identifier_names, unused_local_variable

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

  static (String key_data, bool is_can_get_cache) createKeyAndCanGetCache({
    required String methodName,
    required Map? parameter,
  }) {
    parameter ??= {};
    if (RegExp(r"^(get|search)", caseSensitive: false).hasMatch(methodName)) {
      if (RegExp(r"^(getMe)$", caseSensitive: false).hasMatch(methodName)) {
        return ("", true);
      }
      if (RegExp(r"^(getChat)$", caseSensitive: false).hasMatch(methodName)) {
        return ("${parameter["chat_id"]}", true);
      }
      if (RegExp(r"^(getSupergroup)$", caseSensitive: false)
          .hasMatch(methodName)) {
        return ("${parameter["supergroup_id"]}", true);
      }
      if (RegExp(r"^(searchPublicChat)$", caseSensitive: false)
          .hasMatch(methodName)) {
        return ("${parameter["username"]}", true);
      }
      if (RegExp(r"^(getBasicGroup)$", caseSensitive: false)
          .hasMatch(methodName)) {
        return ("${parameter["basic_group_id"]}", true);
      }
      if (RegExp(r"^(getSupergroupFullInfo)$", caseSensitive: false)
          .hasMatch(methodName)) {
        return ("${parameter["supergroup_id"]}", true);
      }
      if (RegExp(r"^(getUser)$", caseSensitive: false).hasMatch(methodName)) {
        return ("${parameter["getUserFullInfo"]}", true);
      }
      if (RegExp(r"^(getUser)$", caseSensitive: false).hasMatch(methodName)) {
        return ("${parameter["user_id"]}", true);
      }
      return ("", false);
    }

    return ("", false);
  }

  /// add state data
  bool addCacheByMethod({
    required String methodName,
    required Map? parameter,
    required Map result,
    required Duration durationExpired,
  }) {
    var (String key_cache, bool is_can_get_cache) =
        TdlibClientCache.createKeyAndCanGetCache(
            methodName: methodName, parameter: parameter);

    if (is_can_get_cache == false) {
      return false;
    }

    TdlibClientCacheData? tdlibClientCacheData =
        getCacheByMethod(methodName: methodName, parameter: parameter);
    TdlibClientCacheData tdlibClientCacheData_new = TdlibClientCacheData.init(
      methodName: methodName,
      key: key_cache,
      result: result,
      durationExpired: durationExpired,
    );
    if (tdlibClientCacheData == null) {
      tdlibClientCacheDatas.removeWhere((element) =>
          element.isSame(method_name: methodName, key_name: key_cache));
    }
    tdlibClientCacheDatas.add(tdlibClientCacheData_new);
    return true;
  }

  /// add state data
  TdlibClientCacheData? getCacheByMethod({
    required String methodName,
    required Map? parameter,
  }) {
    var (String key_cache, bool is_can_get_cache) =
        TdlibClientCache.createKeyAndCanGetCache(
            methodName: methodName, parameter: parameter);

    TdlibClientCacheData? tdlibClientCacheData =
        tdlibClientCacheDatas.firstWhereOrNull((element) =>
            element.isSame(method_name: methodName, key_name: key_cache));
    if (tdlibClientCacheData != null) {
      if (tdlibClientCacheData.dateTimeExpireDate.isExpired()) {
        tdlibClientCacheDatas.removeWhere((element) =>
            element.isSame(method_name: methodName, key_name: key_cache));
        return null;
      }
    }
    return tdlibClientCacheData;
  }
}

/// add state data
class TdlibClientCacheData {
  String methodName;
  String key;
  Map result;
  DateTime dateTimeExpireDate;

  /// add state data
  TdlibClientCacheData({
    required this.methodName,
    required this.key,
    required this.result,
    required this.dateTimeExpireDate,
  });

  bool isSame({
    required String method_name,
    required String key_name,
  }) {
    if (RegExp("^${methodName}\$", caseSensitive: true).hashData(method_name) &&
        key == key_name) {
      return true;
    }
    return false;
  }

  /// add state data
  static TdlibClientCacheData init({
    required String methodName,
    required String key,
    required Map result,
    required Duration durationExpired,
  }) {
    return TdlibClientCacheData(
      methodName: methodName,
      key: key,
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
