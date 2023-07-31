import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:test/core/faliure.dart';

@injectable
Future<String> apiClient({
  required String url,
  required http.Client client,
  required ApiMethodStatus apiMethodStatus,
  String? body,
  Map<String, String>? headers,
}) async {
  late http.Response response;

  try {
    if (apiMethodStatus.isGet) {
      response = await client.get(
        Uri.parse(url),
        headers: headers,
      );
    }
    if (apiMethodStatus.isPost) {
      response = await client.post(
        Uri.parse(url),
        headers: headers,
        body: body,
      );
    }
    if (apiMethodStatus.isPatch) {
      response = await client.patch(
        Uri.parse(url),
        headers: headers,
        body: body,
      );
    }

    if (response.statusCode == 401) {
      throw Failure(failureMassage: 'Unauthorized');
    }

    if (response.statusCode == 404) {
      throw Failure(failureMassage: 'not found');
    }

    if (response.statusCode >= 500 && response.statusCode <= 504) {
      throw Failure(failureMassage: 'server error');
    }

    // if (response.statusCode != 200) {
    // throw Failure(failureMassage: 'Something went wrong');
    // }

    if (response.body.isEmpty) {
      throw Failure(failureMassage: 'Something went wrong');
    }

    return response.body;
  } on SocketException {
    throw Failure(
      failureMassage: 'No Internet connection',
    );
  } on HttpException {
    throw Failure(
      failureMassage: 'Something went wrong',
    );
  } on FormatException {
    throw Failure(
      failureMassage: 'Bad response format',
    );
  }
  // } catch (error) {
  //   throw Failure(
  //     failureMassage: 'Something went wrong',
  //   );
  // }
}

enum ApiMethodStatus { get, post, patch }

extension ApiMethodStatusX on ApiMethodStatus {
  bool get isGet => this == ApiMethodStatus.get;
  bool get isPost => this == ApiMethodStatus.post;
  bool get isPatch => this == ApiMethodStatus.patch;
}
