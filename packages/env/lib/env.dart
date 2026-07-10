/// A repository that manages environmental variables.
library;

export 'src/env.dev.dart';
export 'src/env.prod.dart';

enum Env {
  supabaseUrl,
  supabaseAnonKey,
  powerSyncUrl,
}
