import 'package:flutter/material.dart';

class ModelFutureBuilder<T> extends StatelessWidget {
  const ModelFutureBuilder({
    Key? key,
    required this.busy,
    required this.data,
    required this.builder,
    this.onError,
    this.loading,
    this.onRefresh,
    this.errorText,
  }) : super(key: key);

  final bool busy;
  final T? data;
  final WidgetBuilder? onError;
  final RefreshCallback? onRefresh;
  final String? errorText;
  final Widget? loading;
  final ValueWidgetBuilder<T> builder;

  @override
  Widget build(BuildContext context) {
    if (busy) {
      return loading ?? const Center(child: CircularProgressIndicator());
    } else {
      if (data == null) {
        return onError != null
            ? onError!(context)
            : ModelErrorWidget(
                onRefresh: onRefresh,
                errorText: errorText ?? 'Something went wrong',
              );
      } else {
        return onRefresh != null
            ? RefreshIndicator(
                onRefresh: onRefresh!,
                child: builder(context, data!, null),
              )
            : builder(context, data!, null);
      }
    }
  }
}

class ModelFutureListBuilder<T> extends StatelessWidget {
  const ModelFutureListBuilder({
    Key? key,
    required this.busy,
    required this.data,
    required this.builder,
    this.empty,
    this.loading,
    this.onRefresh,
    this.hasRefreshButton = true,
    this.emptyText,
  }) : super(key: key);

  final bool busy;
  final List<T> data;
  final Widget? empty;
  final Widget? loading;
  final RefreshCallback? onRefresh;
  final bool hasRefreshButton;
  final String? emptyText;
  final ValueWidgetBuilder<List<T>> builder;

  @override
  Widget build(BuildContext context) {
    if (busy) {
      return loading ?? const Center(child: CircularProgressIndicator());
    } else {
      if (data.isEmpty) {
        return empty ??
            ModelErrorWidget(
              onRefresh: hasRefreshButton ? onRefresh : null,
              errorText: emptyText ?? 'List is empty',
            );
      } else {
        return onRefresh != null
            ? RefreshIndicator(
                onRefresh: onRefresh!,
                child: builder(context, data, null),
              )
            : builder(context, data, null);
      }
    }
  }
}

class ModelErrorWidget extends StatelessWidget {
  const ModelErrorWidget({
    Key? key,
    this.onRefresh,
    required this.errorText,
  }) : super(key: key);

  final RefreshCallback? onRefresh;
  final String errorText;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Visibility(
          visible: onRefresh != null,
          child: OutlinedButton(
            onPressed: onRefresh,
            child: const Text('Refresh'),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: onRefresh != null ? 10 : 0),
          child: Text(
            errorText,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.normal,
              color: Colors.black.withOpacity(0.6),
            ),
          ),
        ),
      ],
    );
  }
}
