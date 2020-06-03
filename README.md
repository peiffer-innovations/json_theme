# json_theme

Library to encode and decode `ThemeData` and associated objects to / from JSON.  This is currently an early release of the library.

This provides two main classes.
* `ThemeDecoder` -- Provides functionality to decode theme related objects from JSON maps.
* `ThemeEncoder` -- Provides functionality to encode theme related objects into JSON maps.

**Note**: Encoding and decoding is _mostly_ bi-directionally compatible, but it is not fully bi-directionally compatible.  That's because there are some properties in theme objects that exist on the constructors, but are not re-exposed as properties and only exposed as dynamic calculated values.  Likewise, there are some dynamic classes (specifically custom `Shape`, `Slider`, and `Decoration` classes) that have no meaningful way of being encoded to JSON nor decoded from JSON.

The decoders will throw `assert` errors when unsupported properties are encountered.  The encoders will typically follow a "fail silently" policy and omit unsupported properties that the decoders cannot handle.  This means it's safe to pass an encoded JSON map to the decoders, but hand crafted JSON may encounter issues.