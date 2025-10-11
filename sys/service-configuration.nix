{ pkgs, ... }:

{
	services = {
		xserver.videoDrivers = ["modesetting" "nvidia"];
		zfs = {
			autoScrub = {
				enable = true;
			};

			autoSnapshot = {
				enable = true;
				flags = "-k -p --utc";
			};
		};

		hypridle.enable = true;

		greetd = {
			enable = true;
			settings = {
				default_session = {
					command = "${pkgs.greetd.greetd}/bin/agreety --cmd Hyprland";
				};
			};
		};

		regreet.enable = true;
	};
}
