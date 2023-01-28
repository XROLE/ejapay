class Failure {
  int? statusCode;
  String errorMessage;
  String type;
  Failure(this.errorMessage, {this.type = '', this.statusCode});
}