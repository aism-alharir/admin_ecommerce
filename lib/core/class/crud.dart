import 'dart:convert';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'statusrequest.dart';

// String _basicAuth =
//     'Basic ${base64Encode(utf8.encode('dddd:sdfsdfsdfsdfdsf'))}';
// Map<String, String> _myheaders = {
// 'content-type' : 'application/json',
// 'accept' : 'application/json',
//   'authorization': _basicAuth
// };

String _basicAuth = 'Basic ${base64Encode(utf8.encode('aism:aism2001'))}';

Map<String, String> _myheaders = {
  // 'content-type' : 'application/json',
  // 'accept' : 'application/json',
  'authorization': _basicAuth
};

class Crud {
  getRequest(String url) async {
    try {
      var response = await http.get(Uri.parse(url),headers: _myheaders);
      if (response.statusCode == 200) {
        var responsebody = jsonDecode(response.body);
        return responsebody;
      } else {
        print("Error ${response.statusCode}");
      }
    } catch (e) {
      print("Error Catch $e");
    }
  }

  Future<Either<StatusRequest, Map>> postData(String linkurl, Map data) async {
    //if (await checkInterent()) {
    var response =
        await http.post(Uri.parse(linkurl), body: data, headers: _myheaders);
    if (response.statusCode == 200 || response.statusCode == 201) {
      Map responsebody = jsonDecode(response.body);
      print(responsebody);
      return Right(responsebody);
    } else {
      return const Left(StatusRequest.serverfailuer);
    }
  }
  //  else {
  //   return const Left(StatusRequest.offlinefailuer);
  // }

  Future<Either<StatusRequest, Map>> addRequestWithImageOne(
      url, data, File? image,
      [String? namerequest]) async {
    if (namerequest == null) {
      namerequest = "file";
    }

    var uri = Uri.parse(url);
    var request = http.MultipartRequest("POST", uri);
    request.headers.addAll(_myheaders);

    if (image != null) {
      var length = await image.length();
      var stream = http.ByteStream(image.openRead());
      stream.cast();
      var multipartFile = http.MultipartFile(namerequest, stream, length,
          filename: basename(image.path));
      request.files.add(multipartFile);
    }

    // add Data to request
    data.forEach((key, value) {
      request.fields[key] = value;
    });
    // add Data to request
    // Send Request
    var myrequest = await request.send();
    // For get Response Body
    var response = await http.Response.fromStream(myrequest);
    if (response.statusCode == 200 || response.statusCode == 201) {
      print(response.body);
      Map responsebody = jsonDecode(response.body);
      return Right(responsebody);
    } else {
      return const Left(StatusRequest.serverfailuer);
    }
  }

  // postRequestWithFile(String url, Map data, File file) async {
  //   var request = http.MultipartRequest("POST", Uri.parse(url));
  //   var length = await file.length();
  //   var stream = http.ByteStream(file.openRead());
  //   var multipartFile = http.MultipartFile("file", stream, length,
  //       filename: basename(file.path));
  //   request.headers.addAll(myheaders);
  //   request.files.add(multipartFile);
  //   data.forEach((key, value) {
  //     request.fields[key] = value;
  //   });
  //   var myrequest = await request.send();

  //   var response = await http.Response.fromStream(myrequest);
  //   if (myrequest.statusCode == 200) {
  //     return jsonDecode(response.body);
  //   } else {
  //     print("Error ${myrequest.statusCode}");
  //   }
  // }
}
