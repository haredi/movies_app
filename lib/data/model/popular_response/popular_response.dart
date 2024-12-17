import '../results.dart';

class PopularResponse {
  PopularResponse({
      this.page, 
      this.results, 
      this.totalPages, 
      this.totalResults,
  this.statusCode,
  this.statusMessage,
  this.success});

  PopularResponse.fromJson(dynamic json) {
    page = json['page'];
    statusCode = json['status_code'];
    statusMessage = json['status_message'];
    success = json['success'];
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results?.add(Results.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }
  num? page;
  List<Results>? results;
  num? totalPages;
  num? totalResults;
  num? statusCode;
  String? statusMessage;
  bool? success;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['page'] = page;
    if (results != null) {
      map['results'] = results?.map((v) => v.toJson()).toList();
    }
    map['total_pages'] = totalPages;
    map['total_results'] = totalResults;
    return map;
  }

}