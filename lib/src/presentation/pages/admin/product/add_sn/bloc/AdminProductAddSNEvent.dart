import 'package:equatable/equatable.dart';

abstract class AdminProductAddSNEvent extends Equatable {
  const AdminProductAddSNEvent();

  @override
  List<Object?> get props => [];
}

class LoadProductEvent extends AdminProductAddSNEvent {
  final String codEAN;

  const LoadProductEvent({required this.codEAN});

  @override
  List<Object?> get props => [codEAN];
}

class SNChangedEvent extends AdminProductAddSNEvent {
  final int index;
  final String sn;

  const SNChangedEvent({required this.index, required this.sn});

  @override
  List<Object?> get props => [index, sn];
}

class AddSNEvent extends AdminProductAddSNEvent {
  const AddSNEvent();
}
