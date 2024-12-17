import '../results.dart';
import 'dates.dart';

class UpcomingResponse {
  UpcomingResponse(
      {this.dates,
      this.page,
      this.results,
      this.totalPages,
      this.totalResults,
      this.statusMessage,
      this.statusCode,
      this.success});

  UpcomingResponse.fromJson(dynamic json) {
    statusCode = json['status_code'];
    statusMessage = json['status_message'];
    success = json['success'];
    dates = json['dates'] != null ? Dates.fromJson(json['dates']) : null;
    page = json['page'];
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results?.add(Results.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }

  Dates? dates;
  num? page;
  List<Results>? results;
  num? totalPages;
  num? totalResults;
  num? statusCode;
  String? statusMessage;
  bool? success;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (dates != null) {
      map['dates'] = dates?.toJson();
    }
    map['page'] = page;
    if (results != null) {
      map['results'] = results?.map((v) => v.toJson()).toList();
    }
    map['total_pages'] = totalPages;
    map['total_results'] = totalResults;
    return map;
  }
}
