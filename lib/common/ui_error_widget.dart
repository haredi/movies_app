import 'package:flutter/material.dart';
import 'package:movie_app/result.dart';

class UiErrorWidget extends StatelessWidget {
   UiErrorWidget({super.key,this.serverError,this.error});
ServerError? serverError;
Error? error;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(error?.exception.toString()??serverError.toString()??''),
    );
  }
}
