part of 'main_layout_cubit.dart';

@immutable
final class MainLayoutState extends Equatable {

  final int currentScreenIndex;
  final RequestStates getAllProductsRequestState;
  final RequestStates getBestSellingProductsRequestState;
  final List<ProductEntity>? productsList;
  final List<ProductEntity>? bestSellingProductsList;
  final String fetchAllProductsErrorM;
  final String fetchBestSellingProductsErrorM;




  const MainLayoutState({this.currentScreenIndex=0,
  this.getAllProductsRequestState=RequestStates.initial,
    this.getBestSellingProductsRequestState=RequestStates.initial,
    this.bestSellingProductsList,
  this.productsList,
  this.fetchAllProductsErrorM='',
    this.fetchBestSellingProductsErrorM=''
  });


  MainLayoutState copyWith({int? currentScreenIndex,RequestStates? getAllProductsRequestState,
  String? fetchAllProductsErrorM,
  List<ProductEntity>?  productsList,
  RequestStates?  getBestSellingProductsRequestState,
  String? fetchBestSellingProductsErrorM,
  List<ProductEntity>? bestSellingProductsList
  })
  {
    return MainLayoutState(
    currentScreenIndex: currentScreenIndex??this.currentScreenIndex,
    getAllProductsRequestState: getAllProductsRequestState??this.getAllProductsRequestState,
    fetchAllProductsErrorM: fetchAllProductsErrorM??this.fetchAllProductsErrorM,
    productsList: productsList??this.productsList,
    getBestSellingProductsRequestState: getBestSellingProductsRequestState??this.getBestSellingProductsRequestState,
    bestSellingProductsList: bestSellingProductsList??this.bestSellingProductsList,
    fetchBestSellingProductsErrorM: fetchBestSellingProductsErrorM??this.fetchBestSellingProductsErrorM
    );
  }

  @override
  List<Object?> get props => [currentScreenIndex,
  getAllProductsRequestState,productsList,fetchAllProductsErrorM,
    getBestSellingProductsRequestState,fetchBestSellingProductsErrorM,bestSellingProductsList
  ];


}

