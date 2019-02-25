


import 'dart:convert' show json;
class poetry {

  int code;
  String message;
  List result;

  poetry.fromParams({this.code, this.message, this.result});

  factory poetry(jsonStr) => jsonStr == null ? null : jsonStr is String ? new poetry.fromJson(json.decode(jsonStr)) : new poetry.fromJson(jsonStr);
  
  poetry.fromJson(jsonRes) {
    code = jsonRes['code'];
    message = jsonRes['message'];
    result = jsonRes['result'] == null ? null : new List.fromJson(jsonRes['result']);
  }

  @override
  String toString() {
    return '{"code": $code,"message": ${message != null?'${json.encode(message)}':'null'},"result": $result}';
  }
}

class List {

  String authors;
  String content;
  String title;

  List.fromParams({this.authors, this.content, this.title});
  
  List.fromJson(jsonRes) {
    authors = jsonRes['authors'];
    content = jsonRes['content'];
    title = jsonRes['title'];
  }

  @override
  String toString() {
    return '{"authors": ${authors != null?'${json.encode(authors)}':'null'},"content": ${content != null?'${json.encode(content)}':'null'},"title": ${title != null?'${json.encode(title)}':'null'}}';
  }
}

