{ pkgs, ... }:

{
	environment = {
		systemPackages = with pkgs; [
			neovim
			wget
			tree
			gcc
			fastfetch
			git
			pciutils
			kitty
			librewolf
			libreoffice
		];

		sessionVariables = {
			NIXOS_OZONE_WL = "1";
			AQ_DRM_DEVICES = "/dev/dri/by-path/pci-0000:00:02.0-card";
			AQ_FORCE_LINEAR_BLIT = "0";
		};
	};
	
	fonts = {
		enableDefaultPackages = true;
		fontDir.enable = true;
	};
}
