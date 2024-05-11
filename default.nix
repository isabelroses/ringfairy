{
  lib,
  darwin,
  stdenv,
  openssl,
  pkg-config,
  rustPlatform,
}: let
  inherit (darwin.apple_sdk.frameworks) Security CoreFoundation SystemConfiguration;
in
  rustPlatform.buildRustPackage {
    pname = "ringfairy";
    version = "0.1.2";

    src = ./.;
    cargoLock.lockFile = ./Cargo.lock;

    buildInputs =
      [
        openssl
      ]
      ++ lib.optionals stdenv.isDarwin [
        Security
        CoreFoundation
        SystemConfiguration
      ];

    nativeBuildInputs = [
      pkg-config
    ];
  }
