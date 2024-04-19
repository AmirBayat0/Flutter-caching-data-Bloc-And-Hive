/// Generalize InterFace For DataBase Repository Implementation
abstract class InterfaceRepository<T> {
  /// Get All Data From DB
  Future<T?> getAll();

  /// Insert Data To Data Base
  Future<void> insertItem({required T object});

  /// is Data Available
  Future<bool> isDataAvailable();
}
