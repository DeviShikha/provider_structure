class ApiResponse<T> {
  final int status;
  final String message;
  final T? data;
  final String stackTrace;
  final String url;
  final Map<String, dynamic> requestData;
  final Map<String, dynamic> queryParameters;

  ApiResponse({
    this.status = 0,
    this.message = '',
    this.data,
    this.stackTrace = '',
    this.url = '',
    this.requestData = const {},
    this.queryParameters = const {},
  });

  /// Indicates if the API response is successful (status == 1)
  bool get isSuccess => status == 1;

  /// Indicates if the API response is an error
  bool get isError => status == 0 || status == -1;

  /// Creates an ApiResponse from JSON with generic type handling
  factory ApiResponse.fromJson(
      Map<String, dynamic> json, {
        T Function(dynamic)? fromJsonT,
      }) {
    return ApiResponse<T>(
      status: json['s'] as int? ?? 0,
      message: json['m'] as String? ?? '',
      data: fromJsonT != null && json['r'] != null ? fromJsonT(json['r']) : json['r'] as T?,
      stackTrace: json['stackTrace'] as String? ?? '',
      url: json['url'] as String? ?? '',
      requestData: json['data'] as Map<String, dynamic>? ?? {},
      queryParameters: json['queryParam'] as Map<String, dynamic>? ?? {},
    );
  }

  /// Creates an ApiResponse from a list JSON with custom parsing
  factory ApiResponse.fromListJson(
      Map<String, dynamic> json,
      T Function(List<dynamic>) create,
      ) {
    return ApiResponse<T>(
      status: json['s'] as int? ?? 0,
      message: json['m'] as String? ?? '',
      data: json['r'] != null ? create(json['r'] as List<dynamic>) : null,
      stackTrace: json['stackTrace'] as String? ?? '',
      url: json['url'] as String? ?? '',
      requestData: json['data'] as Map<String, dynamic>? ?? {},
      queryParameters: json['queryParam'] as Map<String, dynamic>? ?? {},
    );
  }

  /// Creates an ApiResponse from a map JSON with custom parsing
  factory ApiResponse.fromMapJson(
      Map<String, dynamic> json,
      T Function(Map<String, dynamic>) create,
      ) {
    return ApiResponse<T>(
      status: json['s'] as int? ?? 0,
      message: json['m'] as String? ?? '',
      data: json['r'] != null ? create(json['r'] as Map<String, dynamic>) : null,
      stackTrace: json['stackTrace'] as String? ?? '',
      url: json['url'] as String? ?? '',
      requestData: json['data'] as Map<String, dynamic>? ?? {},
      queryParameters: json['queryParam'] as Map<String, dynamic>? ?? {},
    );
  }

  /// Creates an ApiResponse from a simple message response
  factory ApiResponse.fromMessage(Map<String, dynamic> json) {
    return ApiResponse<T>(
      status: json['s'] as int? ?? 0,
      message: json['m'] as String? ?? '',
      data: json['r'] as T?,
      stackTrace: '',
      url: '',
      requestData: {},
      queryParameters: {},
    );
  }

  /// Creates an empty ApiResponse
  factory ApiResponse.empty() {
    return ApiResponse<T>(
      status: 0,
      message: '',
      data: null,
      stackTrace: '',
      url: '',
      requestData: {},
      queryParameters: {},
    );
  }

  /// Creates an error ApiResponse
  factory ApiResponse.error({
    required String error,
    String stackTrace = '',
    String url = '',
    Map<String, dynamic> requestData = const {},
    Map<String, dynamic> queryParameters = const {},
  }) {
    return ApiResponse<T>(
      status: 0,
      message: error,
      data: null,
      stackTrace: stackTrace,
      url: url,
      requestData: requestData,
      queryParameters: queryParameters,
    );
  }

  /// Converts ApiResponse to JSON
  Map<String, dynamic> toJson({
    Map<String, dynamic> Function(T)? toJsonT,
  }) {
    return {
      's': status,
      'm': message,
      'r': data != null && toJsonT != null ? toJsonT(data as T) : data,
      'stackTrace': stackTrace,
      'url': url,
      'data': requestData,
      'queryParam': queryParameters,
    };
  }

  /// Creates a copy of the ApiResponse with optional overrides
  ApiResponse<T> copyWith({
    int? status,
    String? message,
    T? data,
    String? stackTrace,
    String? url,
    Map<String, dynamic>? requestData,
    Map<String, dynamic>? queryParameters,
  }) {
    return ApiResponse<T>(
      status: status ?? this.status,
      message: message ?? this.message,
      data: data ?? this.data,
      stackTrace: stackTrace ?? this.stackTrace,
      url: url ?? this.url,
      requestData: requestData ?? this.requestData,
      queryParameters: queryParameters ?? this.queryParameters,
    );
  }

  /// Maps the data to a new type
  ApiResponse<U> map<U>(U Function(T?) mapper) {
    return ApiResponse<U>(
      status: status,
      message: message,
      data: data != null ? mapper(data) : null,
      stackTrace: stackTrace,
      url: url,
      requestData: requestData,
      queryParameters: queryParameters,
    );
  }

  @override
  String toString() {
    return 'ApiResponse(status: $status, message: $message, data: $data, stackTrace: $stackTrace, url: $url, requestData: $requestData, queryParameters: $queryParameters)';
  }
}