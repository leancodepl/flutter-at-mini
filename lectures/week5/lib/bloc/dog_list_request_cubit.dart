import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:leancode_cubit_utils/leancode_cubit_utils.dart';
import 'package:lecture_week5/data/dog.dart';

abstract class HttpRequestCubit<TOut>(
  super.loggerTag, {
  required final http.Client client,
}) extends RequestCubit<http.Response, TOut, int> {
  @override
  Future<RequestState<TOut, int>> handleResult(http.Response result) async {
    if (result.statusCode == 200) {
      logger.info('Request success. Data: ${result.body}');
      return RequestSuccessState(map(result.body));
    } else {
      logger.severe('Request error. Status code: ${result.statusCode}');
      try {
        return await handleError(RequestErrorState(error: result.statusCode));
      } catch (err, st) {
        logger.severe('Processing error failed', err, st);
        return RequestErrorState(exception: err, stackTrace: st);
      }
    }
  }

  TOut map(String data);
}

class DogListRequestCubit({required super.client})
    extends HttpRequestCubit<List<Dog>> {
  this : super('DogListRequestCubit');

  final _uri = Uri.parse('https://dog.ceo/api/breed/corgi/images/random/50');

  @override
  List<Dog> map(String data) {
    final body = json.decode(data) as Map<String, dynamic>;
    return (body['message'] as List)
        .cast<String>()
        .map((url) => (url: url))
        .toList();
  }

  @override
  Future<http.Response> request() => client.get(_uri);
}
