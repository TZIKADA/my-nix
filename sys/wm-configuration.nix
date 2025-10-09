{ pkgs, ... }:

{
	xdg.portal = {
		enable = true;
		extraPortals = with pkgs; [ xdg-desktop-portal-hyprland ];
	};

	programs = {
		hyprland = {
			enable = true;
			withUWSM = true; # recommended for most users
		};

		hyprlock.enable = true;
	};
}
