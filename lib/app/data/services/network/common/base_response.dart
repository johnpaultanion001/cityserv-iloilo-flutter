class BaseResponse<T> {
  BaseResponse({
    this.msg = '',
    this.status = false,
    this.statusCode = '',
    this.data,
  });

  final String msg;
  final bool status;
  final String statusCode;
  final T? data;
}
