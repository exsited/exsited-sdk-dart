import 'dart:io';

/// The `TERM` value that means the terminal cannot render escapes at all.
const String _dumbTerminal = 'dumb';

/// Whether ANSI colour should be emitted at all, before the caller's `printColor` is consulted.
bool stdoutSupportsColour() {
  try {
    final noColor = Platform.environment['NO_COLOR'];
    if (noColor != null && noColor.isNotEmpty) return false;
    if (Platform.environment['TERM'] == _dumbTerminal) return false;
    return stdout.hasTerminal;
  } on Object {
    return false;
  }
}

/// Write one warning line to stderr, never stdout: stdout is the data stream
/// the rendered exchanges own.
void writeWarning(String message) {
  try {
    stderr.writeln(message);
  } on Object {
    // The log record already carries it.
  }
}

/// Whether the console's encoding can represent [text], probed by round trip
/// because `SystemEncoding` substitutes rather than throws.
bool stdoutCanEncode(String text) {
  try {
    final encoding = stdout.encoding;
    return encoding.decode(encoding.encode(text)) == text;
  } on Object {
    return false;
  }
}
