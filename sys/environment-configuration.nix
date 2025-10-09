{
	environment = {
		systemPackages = with pkgs; [
			neovim
			wget
			tree
			git
			kitty
			librewolf
			libreoffice
		];

		sessionVariables = {
			NIXOS_OZONE_WL = "1";
		};
	};
	
	fonts = {
		enableDefaultPackage = true;
		fontDir.enable = true;
	};

	nixpkg.config.allowUnfree = true;
}
