import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_isar_store/dio_cache_interceptor_isar_store.dart';
import 'package:learning_app/main.dart';

class Http {
  static var store = IsarCacheStore(tempPath);
  static var options = CacheOptions(
    // A default store is required for interceptor.
    // store: IsarCacheStore(),
    store: store,

    // All subsequent fields are optional.

    // Default.
    policy: CachePolicy.noCache, //refresh
    // Returns a cached response on error but for statuses 401 & 403.
    // Also allows to return a cached response on network errors (e.g. offline usage).
    // Defaults to [null].
    hitCacheOnErrorExcept: [401, 403],
    // Overrides any HTTP directive to delete entry past this duration.
    // Useful only when origin server has no cache config or custom behaviour is desired.
    // Defaults to [null].
    maxStale: const Duration(days: 1),
    // Default. Allows 3 cache sets and ease cleanup.
    priority: CachePriority.normal,
    // Default. Body and headers encryption with your own algorithm.
    cipher: null,
    // Default. Key builder to retrieve requests.
    keyBuilder: CacheOptions.defaultCacheKeyBuilder,
    // Default. Allows to cache POST requests.
    // Overriding [keyBuilder] is strongly recommended when [true].
    allowPostMethod: false,
  );

  static Dio get apiURL {
    Dio dio = Dio();
    try {
      dio.options.baseUrl = 'https://testseries-cf9d5dc153b9.herokuapp.com';
      dio.interceptors.addAll(
        [
          InterceptorsWrapper(
            onError: (e, handler) {
              return handler.next(e);
            },
            onRequest: (options, handler) async {
              // var token = await StorageService()
              //     .initialize()
              //     .read(key: SecureStorageKeys.LOGIN_TOKEN.name);

              // options.headers = {
              //   "authorization": 'Bearer token',
              // };
              return handler.next(options);
            },
            onResponse: (options, handler) {
              return handler.next(options);
            },
          ),
          DioCacheInterceptor(
            options: options,
          ),
        ],
      );
    } catch (e) {}
    return dio;
  }

  static Dio get others {
    Dio dio = Dio();
    try {
      dio.interceptors.addAll(
        [
          InterceptorsWrapper(
            onError: (e, handler) {
              return handler.next(e);
            },
            onRequest: (options, handler) {
              return handler.next(options);
            },
            onResponse: (options, handler) {
              return handler.next(options);
            },
          )
        ],
      );
    } catch (e) {}
    return dio;
  }

  static var authOptions = CacheOptions(
    // A default store is required for interceptor.
    // store: IsarCacheStore(),
    store: store,

    // All subsequent fields are optional.

    // Default.
    policy: CachePolicy.refreshForceCache,
    // Returns a cached response on error but for statuses 401 & 403.
    // Also allows to return a cached response on network errors (e.g. offline usage).
    // Defaults to [null].
    hitCacheOnErrorExcept: [401, 403],
    // Overrides any HTTP directive to delete entry past this duration.
    // Useful only when origin server has no cache config or custom behaviour is desired.
    // Defaults to [null].
    maxStale: const Duration(minutes: 30),
    // Default. Allows 3 cache sets and ease cleanup.
    priority: CachePriority.normal,
    // Default. Body and headers encryption with your own algorithm.
    cipher: null,
    // Default. Key builder to retrieve requests.
    keyBuilder: CacheOptions.defaultCacheKeyBuilder,
    // Default. Allows to cache POST requests.
    // Overriding [keyBuilder] is strongly recommended when [true].
    allowPostMethod: false,
  );

  static Dio get cacheAPI {
    Dio dio = Dio();
    try {
      dio.options.baseUrl = 'https://dev-api.havahavai.com/core/v1';
      dio.interceptors.addAll(
        [
          InterceptorsWrapper(
            onError: (e, handler) {
              return handler.next(e);
            },
            onRequest: (options, handler) async {
              // var token = await StorageService()
              //     .initialize()
              //     .read(key: SecureStorageKeys.LOGIN_TOKEN.name);

          
              // options.headers = {
              //   "authorization": 'Bearer token',
              // };
              return handler.next(options);
            },
            onResponse: (options, handler) {
              return handler.next(options);
            },
          ),
          DioCacheInterceptor(
            options: authOptions,
          ),
        ],
      );
    } catch (e) {}
    return dio;
  }
}
