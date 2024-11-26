import 'package:equatable/equatable.dart';

class AdminProductAddSNState extends Equatable {
  final String codEAN;
  final List<String> series;
  final bool loading;
  final bool success;

  const AdminProductAddSNState({
    required this.codEAN,
    required this.series,
    required this.loading,
    required this.success,
  });

  factory AdminProductAddSNState.initial() {
    return AdminProductAddSNState(
      codEAN: '',
      series: List.generate(5, (index) => ''), // 5 como ejemplo de SNs vacíos
      loading: false,
      success: false,
    );
  }

  AdminProductAddSNState copyWith({
    String? codEAN,
    List<String>? series,
    bool? loading,
    bool? success,
  }) {
    return AdminProductAddSNState(
      codEAN: codEAN ?? this.codEAN,
      series: series ?? this.series,
      loading: loading ?? this.loading,
      success: success ?? this.success,
    );
  }

  @override
  List<Object?> get props => [codEAN, series, loading, success];
}
