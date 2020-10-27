import 'package:bloc/bloc.dart';
import 'package:my_ledger_app/my_pocket_class.dart';

class PocketListObserver extends BlocObserver {
  @override
  void onChange(Cubit cubit, Change change) {
    super.onChange(cubit, change);
  }
}

class PocketListCubit extends Cubit<List<Pocket>> {
  PocketListCubit() : super(pockets);

  void addPocket(Pocket pocket) => {state.add(pocket)};
}
