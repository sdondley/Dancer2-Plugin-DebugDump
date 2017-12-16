# Dancer2::Plugin::DebugDump version 0.2

DebugDump is designed to make it easier to read the output of variables while debugging Dancer2 web apps. Enable
this module like you would any other Dancer2 plugin.

Use the keyword 'ddump()' to dump the variables with Data::Dumper output.

INSTALLATION

To install this module type the following:

```
   perl Makefile.PL
   make
   make test
   make install
```

Or use your favorite CPAN installation tool.

DEPENDENCIES

This module requires these other modules and libraries:

  Data::Dumper

COPYRIGHT AND LICENCE

Copyright (C) 2017 by Steve Dondley

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.14.4 or,
at your option, any later version of Perl 5 you may have available.

