import 'package:build/build.dart';
import 'package:json_theme_codegen/json_theme_codegen.dart';
import 'package:source_gen/source_gen.dart';

Builder decoderLibrary(BuilderOptions options) => LibraryBuilder(
      DecoderLibraryBuilder(),
    );
