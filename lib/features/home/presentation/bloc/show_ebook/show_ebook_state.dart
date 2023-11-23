abstract class ShowEbookState {}

class ShowEbookInitial extends ShowEbookState {}

class ShowEbookLoading extends ShowEbookState {
  final String title;

  ShowEbookLoading({required this.title});
}

class ShowEbookError extends ShowEbookState {
  final String message;

  ShowEbookError({required this.message});
}

class ShowEbookOpen extends ShowEbookState {}
