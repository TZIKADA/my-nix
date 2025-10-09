{ config, lib, pkgs, ... }:

{
	system.nixos.label = "Experimental";

	imports =[
		./sys/hardware-configuration.nix
		./sys/nvidia-configuration.nix
		./sys/service-configuration.nix
		./sys/environment-configuration.nix
	];
	
	# Bootloader:
	boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;

	# Networking stuff
	networking = {
		hostName = "potato";
		hostId = "8425e349";
		networkmanager.enable = true;
	};
	
	# Enable Bluetooth
	hardware.bluetooth.enable = true;

	# Set your time zone
	time.timeZone = "Asia/Jerusalem";

	# Set my user
	users.users.dan = {
		isNormalUser = true;
		extraGroups = [
			"wheel"
			"networkmanager"
			"video"
			"input"
		];
	};

	# Enable flakes
	nix.settings.experimental-features = [
		"nix-command"
		"flakes"
	];
}
