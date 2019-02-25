
import 'dart:io';
import 'package:dio/dio.dart';
class HttpUtil{
 
    Dio dio;
   //参数配置
    Options options;

HttpUtil(){
  options=Options(
      // 请求基地址,可以包含子路径，如: "https://www.google.com/api/".
      baseUrl: "https://api.apiopen.top/recommendPoetry",
      //连接服务器超时时间，单位是毫秒.
      connectTimeout: 100000,
       ///  响应流上前后两次接受到数据的间隔，单位为毫秒。如果两次间隔超过[receiveTimeout]，
      ///  [Dio] 将会抛出一个[DioErrorType.RECEIVE_TIMEOUT]的异常.
      ///  注意: 这并不是接收数据的总时限.
      receiveTimeout: 3000,
      headers: {},
      /// 请求的Content-Type，默认值是[ContentType.JSON].
      /// 如果您想以"application/x-www-form-urlencoded"格式编码请求数据,
      /// 可以设置此选项为 `ContentType.parse("application/x-www-form-urlencoded")`,  这样[Dio]
      /// 就会自动编码请求体.
     contentType: ContentType.JSON,
      /// [responseType] 表示期望以那种格式(方式)接受响应数据。
      /// 目前 [ResponseType] 接受三种类型 `JSON`, `STREAM`, `PLAIN`.
      ///
      /// 默认值是 `JSON`, 当响应头中content-type为"application/json"时，dio 会自动将响应内容转化为json对象。
      /// 如果想以二进制方式接受响应数据，如下载一个二进制文件，那么可以使用 `STREAM`.
      ///
      /// 如果想以文本(字符串)格式接收响应数据，请使用 `PLAIN`.
    //   responseType: ResponseType.PLAIN
  );
    dio=new Dio(options);
    dio.interceptor.request.onSend = (Options options){
    print("进入请求拦截中");
     // 在请求被发送之前做一些事情
     return options; //continue
     // 如果你想完成请求并返回一些自定义数据，可以返回一个`Response`对象或返回`dio.resolve(data)`。
     // 这样请求将会被终止，上层then会被调用，then中返回的数据将是你的自定义数据data.
     // 如果你想终止请求并触发一个错误,你可以返回一个`DioError`对象，或返回`dio.reject(errMsg)`，
     // 这样请求将被中止并触发异常，上层catchError会被调用。
  };
 dio.interceptor.response.onSuccess = (Response response) {
     print("请求成功");
     // 在返回响应数据之前做一些预处理
     return response; // continue
  };
 dio.interceptor.response.onError = (DioError e){
     // 当请求失败时做一些预处理
     return e;//continue
  };

}

  get(url, params,) async {
    print('get请求启动! url：$url ,body: $params');
    Response response;
    try {
      response = await dio.get(
        url,
        data: params,
      );
    } on DioError catch (e) {
      if (CancelToken.isCancel(e)) {
        print('get请求取消! ' + e.message);
      }
      print('get请求发生错误：$e');
    }
    return response.data;
  }

  post(url, params) async {
    print('post请求启动! url：$url ,body: $params');
    Response response;
    try {
      response = await dio.post(
        url,
        data: params,
      );
    } on DioError catch (e) {
      if (CancelToken.isCancel(e)) {
        print('post请求取消! ' + e.message);
      }
      print('post请求发生错误：$e');
    }
    return response.data;
  }



}
