import 'package:supabase_flutter/supabase_flutter.dart';

class NotesDatabase {
  final table = Supabase.instance.client.from('signinup');
  //insert
  Future<void> createtable(String content) async {
    await table.insert({'content': content});
  }

  //update
  Future<void> updatetable(dynamic tableId, String content) async {
    await table.update({'content': content}).eq('id', tableId);
  }

  //delete
  Future<void> deletetable(dynamic tableId) async {
    await table.delete().eq('id', tableId);
  }
}
