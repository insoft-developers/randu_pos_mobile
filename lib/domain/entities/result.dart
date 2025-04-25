sealed class Result<T> {
  const Result();
  const factory Result.success(T value) = Success;
  const factory Result.failed(String message) = Failed;
  // const factory Result.loading(String message) = Loading;
  // const factory Result.empty() = Empty;

  bool get isSuccess => this is Success<T>;
  bool get isFailed => this is Failed<T>;
  // bool get isLoading => this is Loading<T>;
  // bool get isEmpty => this is Empty<T>;

  T? get resultValue => isSuccess ? (this as Success<T>).value : null;
  String? get errorMessage => isFailed ? (this as Failed<T>).message : null;

  // Add the `when` method
  R when<R>({
    required R Function(T value) success,
    required R Function(String message) failed,
    // R Function(String message)? loading,
    // R Function()? empty,
  }) {
    return switch (this) {
      Success(value: final value) => success(value),
      Failed(message: final message) => failed(message),
      // Loading(message: final message) => loading?.call(message) ?? (throw UnimplementedError('Loading handler not implemented')),
      // Empty() => empty?.call() ?? (throw UnimplementedError('Empty handler not implemented')),
    };
  }
}

class Success<T> extends Result<T> {
  final T value;

  const Success(this.value);
}

class Failed<T> extends Result<T> {
  final String message;

  const Failed(this.message);
}

// class Loading<T> extends Result<T> {
//   final String message;
//
//   const Loading(this.message);
// }

// class Empty<T> extends Result<T> {
//   const Empty();
// }
