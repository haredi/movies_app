import 'package:flutter/material.dart';
import 'package:movie_app/data/api_manager/api_manager.dart';

import 'my_app/my_app.dart';

void main() {
  runApp( MyApp());

var p=ApiManager();
print(p.getPopular());
}


