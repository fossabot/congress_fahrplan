# congress_fahrplan
[![FOSSA Status](https://app.fossa.io/api/projects/git%2Bgithub.com%2FbenjaminSchilling33%2Fcongress_fahrplan.svg?type=shield)](https://app.fossa.io/projects/git%2Bgithub.com%2FbenjaminSchilling33%2Fcongress_fahrplan?ref=badge_shield)

A Congress Fahrplan App written in Flutter

## How to build

Build the app using `flutter build apk --split-per-abi`.

Required `key.properties` in `./android/`.

Content:

```
storePassword=<Keystore Password>
keyPassword=<Key Password>
keyAlias=<Alias>
storeFile=<Location of the Keystore>
```

When building on Windows: Make sure that the location only includes `\\` and no `\`.

## License
SPDX-License-Identifier: GPL-2.0-only

The full version of the license can be found in LICENSE.


[![FOSSA Status](https://app.fossa.io/api/projects/git%2Bgithub.com%2FbenjaminSchilling33%2Fcongress_fahrplan.svg?type=large)](https://app.fossa.io/projects/git%2Bgithub.com%2FbenjaminSchilling33%2Fcongress_fahrplan?ref=badge_large)

## Copyright
Copyright (C) 2019 Benjamin Schilling