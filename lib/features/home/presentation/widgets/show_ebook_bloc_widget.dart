import 'package:auto_route/auto_route.dart';
import 'package:ebook_reader/core/service_locator/service_locator.dart';
import 'package:ebook_reader/features/home/presentation/bloc/show_ebook/show_ebook_bloc.dart';
import 'package:ebook_reader/features/home/presentation/bloc/show_ebook/show_ebook_state.dart';
import 'package:ebook_reader/features/home/presentation/widgets/error_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'loading_dialog.dart';

class ShowEbookBlocWidget extends StatelessWidget {
  final Widget child;

  const ShowEbookBlocWidget({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = getIt.get<ShowEbookBloc>();

    return BlocBuilder<ShowEbookBloc, ShowEbookState>(
      bloc: bloc,
      builder: (context, state) {
        Future.delayed(
          Duration.zero,
          () => showDialogIfNeeded(context, bloc.state),
        );
        return child;
      },
    );
  }

  void showDialogIfNeeded(BuildContext context, ShowEbookState state) {
    switch (state) {
      case ShowEbookLoading():
        showDialog(
          context: context,
          builder: (ctx) => LoadingDialog(title: state.title),
          barrierDismissible: false,
        );
      case ShowEbookError():
        Navigator.of(context).pop();

        showDialog(
          context: context,
          builder: (ctx) => ErrorDialog(message: state.message),
          barrierDismissible: false,
        );
      case ShowEbookOpen():
        context.popRoute();
    }
  }
}
