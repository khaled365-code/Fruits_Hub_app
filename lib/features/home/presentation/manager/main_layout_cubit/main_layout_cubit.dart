import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fruits_commerce_app/core/global/constants/enums.dart';
import 'package:fruits_commerce_app/core/repos/products/products_repo.dart';
import 'package:fruits_commerce_app/features/home/domain/entities/product_entity.dart';
import 'package:meta/meta.dart';

part 'main_layout_state.dart';

class MainLayoutCubit extends Cubit<MainLayoutState> {
  MainLayoutCubit({required this.productsRepo}) : super(MainLayoutState());


  final ProductsRepo productsRepo;


  getAllProducts() async
  {

    emit(state.copyWith(getAllProductsRequestState: RequestStates.loading));
    final result = await productsRepo.getAllProducts();
    result.fold((f)=>emit(state.copyWith(
      getAllProductsRequestState: RequestStates.error,
      fetchAllProductsErrorM: f.callBack
    )), (productsList)=> emit(state.copyWith(getAllProductsRequestState: RequestStates.success,productsList: productsList)));
  }


  getBestSellingProducts() async
  {
    emit(state.copyWith(getBestSellingProductsRequestState: RequestStates.loading));
    final result = await productsRepo.getBestSellingProducts();
    result.fold((f)=>emit(state.copyWith(
        getBestSellingProductsRequestState: RequestStates.error,
        fetchBestSellingProductsErrorM: f.callBack
    )), (productsList)=> emit(state.copyWith(getBestSellingProductsRequestState: RequestStates.success,bestSellingProductsList: productsList)));
  }








  int currentScreenIndex=0;
  void changeCurrentScreenIndex({required int newScreenIndex})
  {
    currentScreenIndex=newScreenIndex;
    emit(state.copyWith(currentScreenIndex: newScreenIndex));
  }

}
