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

		dconf.profiles.user.databases = [
			{
				settings."org/gnome/desktop/interface" = {
					gtk-theme = "Adwaita";
					icon-theme = "Flat-Remix-Red-Dark";
					font-name = "Noto Sans Medium 11";
					document-font-name = "Noto Sans Medium 11";
					monospace-font-name = "Noto Sans Mono Medium 11";
				};
			}
		];
	};
}
