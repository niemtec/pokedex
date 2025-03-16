import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/presentation/bloc/homepage/homepage_cubit.dart';
import 'package:pokedex/presentation/bloc/homepage/homepage_states.dart';
import 'package:pokedex/presentation/widgets/loading_indicator.dart';
import 'package:pokedex/presentation/widgets/logo_widget.dart';
import 'package:pokedex/presentation/widgets/pokemon_mini_profile_card.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final ScrollController _scrollController = ScrollController();
  static const double _cardWidth = 200.0;
  static const double _gridSpacing = 24.0;

  @override
  void initState() {
    super.initState();
    _initializeData();
    _setupScrollListener();
  }

  void _initializeData() {
    context.read<HomepageCubit>().getPokemon(isFirstLoad: true);
  }

  void _setupScrollListener() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        context.read<HomepageCubit>().getPokemon();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(_gridSpacing),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              bottom: _gridSpacing,
            ),
            child: const Row(
              children: [
                LogoWidget(
                  size: 32.0,
                ),
                Text(
                  "Pokédex",
                  style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(16.0)),
              child: BlocBuilder<HomepageCubit, HomepageState>(
                buildWhen: (previous, current) => current is HomepageLoaded,
                builder: (context, state) {
                  return _buildContentBody(state);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContentBody(HomepageState state) {
    if (state is HomepageLoading) {
      return const Center(
        child: LoadingIndicator(loaderSize: LoaderSize.large),
      );
    }

    if (state is HomepageLoaded) {
      return LayoutBuilder(
        builder: (context, constraints) => _buildGrid(constraints, state),
      );
    }

    if (state is HomepageError) {
      return Center(child: Text('Error: ${state.message}'));
    }

    return const Center(child: LoadingIndicator());
  }

  Widget _buildGrid(BoxConstraints constraints, HomepageLoaded state) {
    final int crossAxisCount = _calculateCrossAxisCount(constraints.maxWidth);

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: _gridSpacing,
        mainAxisSpacing: _gridSpacing,
        childAspectRatio: 3.0 / 2.0,
      ),
      controller: _scrollController,
      itemCount: state.pokemonList.length + 1,
      itemBuilder: (context, index) => _buildGridItem(index, state),
    );
  }

  Widget _buildGridItem(int index, HomepageLoaded state) {
    if (index == state.pokemonList.length) {
      return state.hasMoreItems
          ? const LoadingIndicator(
              loadingText: "Loading more Pokemon",
              loaderSize: LoaderSize.small,
            )
          : const SizedBox.shrink();
    }

    return PokemonMiniProfileCard(
      pokemonProfile: state.pokemonList[index],
    );
  }

  int _calculateCrossAxisCount(double width) {
    int count = (width / _cardWidth).floor();
    return count < 1 ? 1 : count;
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
