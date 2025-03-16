import 'package:flutter/material.dart';
import 'package:pokedex/presentation/widgets/logo_widget.dart';

enum LoaderSize { small, medium, large }

class LoadingIndicator extends StatefulWidget {
  final String loadingText;
  final LoaderSize loaderSize;

  const LoadingIndicator({
    this.loadingText = "",
    this.loaderSize = LoaderSize.medium,
    super.key,
  });

  @override
  State<LoadingIndicator> createState() => _LoadingIndicatorState();
}

class _LoadingIndicatorState extends State<LoadingIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.loadingText.isEmpty) {
      return _rotatingPokeball(widget.loaderSize, _controller);
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _rotatingPokeball(widget.loaderSize, _controller),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(widget.loadingText),
          )
        ],
      );
    }
  }

  Widget _rotatingPokeball(
      LoaderSize loaderSize, AnimationController controller) {
    final double height = switch (loaderSize) {
      LoaderSize.small => 32.0,
      LoaderSize.medium => 48.0,
      LoaderSize.large => 64.0,
    };

    return Center(
      child: RotationTransition(
        turns: controller,
        child: LogoWidget(
          size: height,
          color: Colors.red.withValues(alpha: 0.8),
        ),
      ),
    );
  }
}
