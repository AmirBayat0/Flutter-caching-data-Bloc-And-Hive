part of 'home_bloc.dart';

@immutable
class HomeState extends Equatable {
  final HomeProductsStatus homeProductsStatus;

  const HomeState({
    required this.homeProductsStatus,
  });

  HomeState copyWith({
    HomeProductsStatus? newHomeProductsStatus,
  }) {
    return HomeState(
      homeProductsStatus: newHomeProductsStatus ?? homeProductsStatus,
    );
  }

  @override
  List<Object?> get props => [
        homeProductsStatus,
      ];
}
