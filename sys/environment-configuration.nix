{
	environment = {
		systemPackages = with pkgs; [
			neovim
			wget
			git
		];
	};
	
	fonts = {
		enableDefaultPackage = true;
		fontDir.enable = true;
	};

	nixpkg.config.allowUnfree = true;
}
