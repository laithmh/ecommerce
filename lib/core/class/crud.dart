// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:dartz/dartz.dart';

import 'package:e_commerce/core/class/statusrequest.dart';
import 'package:e_commerce/core/function/checkinternet.dart';
import 'package:http/http.dart' as http;

class Crud {
  Future<Either<Statusrequest, Map>> postData(String linkurl, Map data) async {
    try {
      if (await checkinternet()) {
        var response = await http.post(Uri.parse(linkurl), body: data);
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responsebody = jsonDecode(response.body);
          print(responsebody);
          return Right(responsebody);
        } else {
          return const Left(Statusrequest.serverfailure);
        }
      } else {
        return const Left(Statusrequest.offlinefailure);
      }
    } catch (e) {
      print("=======================");
      print("Error Catch $e");
      return const Left(Statusrequest.serverfailure);
    }
  }
}
