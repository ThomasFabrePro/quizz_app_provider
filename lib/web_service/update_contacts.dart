import 'dart:convert' show jsonDecode, jsonEncode;

import 'package:flutter/foundation.dart';
import 'package:quizz_app_provider/models/stat.dart';
import 'package:quizz_app_provider/models/persons/user.dart';
import 'package:quizz_app_provider/web_service/web_service.dart';
import 'package:http/http.dart' as http;

//!fonction inutile ? On va ajouter, supprimer, mais pas mettre à jour
// mixin UpdateContacts {
//   Future<void> updateContacts(Stat quizzStat) async {
//     const String path = '/api/users/update_contacts';
//     String url = WebService.baseUrl + path;
//     try {
//       final response = await http.post(
//         Uri.parse(url),
//         headers: <String, String>{
//           'Content-Type': 'application/json',
//         },
//         body: jsonEncode(<String, dynamic>{
//           'email': user.email,
//           'category': quizzStat.quizzCategory,
//           'right': quizzStat.rightAnswers,
//           'wrong': quizzStat.wrongAnswers,
//         }),
//       );

//       if (response.statusCode == 201) {
//         dynamic data = jsonDecode(response.body);
//         user = user.fromJson(data["user"]);
//       }
//     } catch (e) {
//       debugPrint("ERROR $e");
//     }
//   }
// }
