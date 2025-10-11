{
	description = "My laptop flake";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
	};

	outputs = { self, nixpkgs }: 
		let
			system = "x86_64-linux";
			pkgs = import nixpkgs { inherit system; config.allowUnfree = true;};
		in {
			nixosConfiguration.potato = nixpkgs.lib.nixosSystem {
				inherit system;
				modules = [
					./configuration.nix
				];
			};
		};
}
