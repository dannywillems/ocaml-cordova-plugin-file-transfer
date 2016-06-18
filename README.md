# ocaml-cordova-plugin-file-transfer

[![LGPL-v3 licensed](https://img.shields.io/badge/license-LGPLv3-blue.svg)](https://raw.githubusercontent.com/dannywillems/ocaml-cordova-plugin-file-transfer/master/LICENSE)
[![Build Status](https://travis-ci.org/dannywillems/ocaml-cordova-plugin-file-transfer.svg?branch=master)](https://travis-ci.org/dannywillems/ocaml-cordova-plugin-file-transfer)

Binding to
[cordova-plugin-file-transfer](https://github.com/apache/cordova-plugin-file-transfer)

[Example
application](https://github.com/dannywillems/ocaml-cordova-plugin-file-transfer-example).

## What does cordova-plugin-file-transfer do ?

```
This plugin allows you to upload and download files.

This plugin defines global `FileTransfer`, `FileUploadOptions` constructors. Although in the global scope, they are not available until after the `deviceready` event.
```

Source: [cordova-plugin-file-transfer](https://github.com/apache/cordova-plugin-file-transfer)

## How to install and compile your project by using this plugin ?

Don't forget to switch to a compiler **>= 4.03.0**.
```Shell
opam switch 4.03.0
```

* If you added
[ocaml-cordova-plugin-list](https://github.com/dannywillems/ocaml-cordova-plugin-list)
as opam package provider, you can use
```
opam install cordova-plugin-file-transfer
```

* Else, you can use opam by pinning the repository with
```Shell
opam pin add cordova-plugin-file-transfer https://github.com/dannywillems/ocaml-cordova-plugin-activityindicator.git
```

To compile your project, use
```Shell
ocamlfind ocamlc -c -o [output_file] -package gen_js_api -package cordova-plugin-file-transfer [...] -linkpkg [other arguments]
```

Don't forget to install cordova-plugin-file-transfer with
```Shell
cordova plugin add cordova-plugin-file-transfer
```

## How to use ?

See the official documentation
[cordova-plugin-file-transfer](https://github.com/apache/cordova-plugin-file-transfer)
