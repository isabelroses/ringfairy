{rustPlatform}:
rustPlatform.buildRustPackage {
  pname = "ringfairy";
  version = "0.1.2";

  src = ./.;
  cargoLock.lockFile = ./Cargo.lock;
}
