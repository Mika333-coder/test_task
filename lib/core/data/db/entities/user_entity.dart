import 'package:floor/floor.dart';

@Entity(tableName: UserEntity.entityName)
class UserEntity {
  @PrimaryKey(autoGenerate: true)
  @ColumnInfo(name: 'id')
  int? id;

  @ColumnInfo(name: 'name')
  String? name;

  static const String entityName = 'users';
}