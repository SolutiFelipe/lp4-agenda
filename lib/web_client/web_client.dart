import 'dart:convert';

import 'package:first_project/models/person.dart';
import 'package:first_project/web_client/logging_interceptor.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http_client_with_interceptor.dart';

const baseURL = "http://172.16.240.2/contacts";

final Client client =
HttpClientWithInterceptor.build(interceptors: [LoggingInterceptor()]);

Future<List<Person>> findAll() async {
  Map<String, String> headers = Map();
  headers['Accept'] = "application/json";

  Response response = await client.get(baseURL, headers: headers);

  final List<dynamic> decodeJson = jsonDecode(response.body);
  List<Person> pessoas = List();

  for (Map<String, dynamic> element in decodeJson) {
    Person pessoa = Person(
      id: int.tryParse(element['id']),
      nome: element['name'],
      profissao: element['professional'],
    );

    pessoas.add(pessoa);
  }
  return pessoas;
}

Future<bool> save(Person pessoa) async {
  Map<String, String> headers = Map();
  headers['Content-Type'] = "application/json";
  headers['Accept'] = "application/json";

  Map<String, String> body = Map();
  body['name'] = pessoa.getNome();
  body['professional'] = pessoa.getProfissao();

  Response response = await client.post(
      baseURL, headers: headers, body: jsonEncode(body));

  Map<String, dynamic> json = jsonDecode(response.body);
  if(json['message'] == "success") {
    return true;
  }
  return false;
}
