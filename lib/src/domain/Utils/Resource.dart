abstract class Resource<T> {}

// Estados
class Initial extends Resource {}

class Loading extends Resource {}

class Success<T> extends Resource {
  final T data;
  Success(this.data);
}

class Error<T> extends Resource {
  final String message;
  Error(this.message);
}
