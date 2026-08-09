abstract class ApiConsumer {
  Future<dynamic> post({
    required String path,
    required Object? data,
    Map<String, dynamic> queryParameters,
    bool isFormData = false,
  });

  Future<dynamic> get({
    required String path,
    required Object? data,
    Map<String, dynamic> queryParameters,
  });

  Future<dynamic> patch({
    required String path,
    required Object? data,
    Map<String, dynamic> queryParameters,
    bool isFormData = false,
  });

  Future<dynamic> delete({
    required String path,
    required Object? data,
    Map<String, dynamic> queryParameters,
    bool isFormData = false,
  });
}
 