import 'package:http_interceptor/http_interceptor.dart';

class LoggingInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({RequestData data}) async {
    // TODO: implement interceptRequest
    print("Request Log");
    print("url: ${data.url}");
    print("headers: ${data.headers}");
    print("ecoding: ${data.encoding}");

    return data;
  }

  @override
  Future<ResponseData> interceptResponse({ResponseData data}) async {
    // TODO: implement interceptResponse
    print("Response Log: ");
    print("Status code: ${data.statusCode}");
    print("headers: ${data.headers}");
    print("body: ${data.body}");

    return data;
  }

}