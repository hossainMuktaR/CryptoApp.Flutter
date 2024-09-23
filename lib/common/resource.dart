sealed class Resource<T> {
  const Resource();
}

class Success<T> extends Resource<T> {
  final T data;
  const Success(this.data);
}

class Error<T> extends Resource<T> {
  final String message;
  final T? data;
  const Error(this.message, {this.data});
}

class Loading<T> extends Resource<T> {
  final T? data;
  const Loading({this.data});
}