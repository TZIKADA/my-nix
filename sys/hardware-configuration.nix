{ config, lib, pkgs, modulesPath, ... }:

{
	imports =[
		(modulesPath + "/installer/scan/not-detected.nix")
	];
	
	boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "nvme" "usbhid" "usb_storage" "sd_mod" ];
	boot.initrd.kernelModules = [ ];
	boot.kernelModules = [ "kvm-intel" ];
	boot.extraModulePackages = [ ];

	# ROOT:
	fileSystems."/" = {
		device = "rpool/ROOT/NixOS";
		fsType = "zfs";
	};

	# SYSTEM:
	fileSystems."/tmp" ={
		device = "rpool/ROOT/NixOS/tmp";
		fsType = "zfs";
	};
	
	fileSystems."/nix" = {
		device = "rpool/ROOT/NixOS/nix";
		fsType = "zfs";
	};

	fileSystems."/srv" = {
		device = "rpool/ROOT/NixOS/srv";
		fsType = "zfs";
	};

	fileSystems."/opt" = {
		device = "rpool/ROOT/NixOS/opt";
		fsType = "zfs";
	};

	fileSystems."/var" = {
		device = "rpool/ROOT/NixOS/var";
		fsType = "zfs";
	};

	fileSystems."/var/cache" = {
		device = "rpool/ROOT/NixOS/var/cache";
		fsType = "zfs";
	};

	fileSystems."/var/lib" = {
		device = "rpool/ROOT/NixOS/var/lib";
		fsType = "zfs";
	};
	
	fileSystems."/var/log" = {
		device = "rpool/ROOT/NixOS/var/log";
		fsType = "zfs";
	};
	
	fileSystems."/var/tmp" = {
		device = "rpool/ROOT/NixOS/var/tmp";
		fsType = "zfs";
	};

	fileSystems."/root" = {
		device = "rpool/HOME/root";
		fsType = "zfs";
	};


	# My Home:
	fileSystems."/home/dan" = {
		device = "rpool/HOME/dan";
		fsType = "zfs";
	};

	fileSystems."/home/dan/Games" = {
		device = "rpool/HOME/dan/Games";
		fsType = "zfs";
	};

	fileSystems."/home/dan/MyCode" = {
		device = "rpool/HOME/dan/MyCode";
		fsType = "zfs";
	};

	fileSystems."/home/dan/Music" = {
		device = "rpool/HOME/dan/Music";
		fsType = "zfs";
	};

	fileSystems."/home/dan/Documents" = {
		device = "rpool/HOME/dan/Documents";
		fsType = "zfs";
	};

	fileSystems."/home/dan/Pictures" = {
		device = "rpool/HOME/dan/Pictures";
		fsType = "zfs";
	};

	fileSystems."/home/dan/.cache" = {
		device = "rpool/HOME/dan/.cache";
		fsType = "zfs";
	};
	
	fileSystems."/home/dan/Downloads" = {
		device = "rpool/HOME/dan/Downloads";
		fsType = "zfs";
	};

	fileSystems."/home/dan/.config" = {
		device = "rpool/HOME/dan/.config";
		fsType = "zfs";
	};

	fileSystems."/home/dan/.local" = {
		device = "rpool/HOME/dan/.local";
		fsType = "zfs";
	};

	fileSystems."/home/dan/Videos" = {
		device = "rpool/HOME/dan/Videos";
		fsType = "zfs";
	};

	# BOOT:
	fileSystems."/boot" = {
		device = "/dev/disk/by-uuid/5288-B1CA";
		fsType = "vfat";
		options = [ "fmask=0022" "dmask=0022" ];
	};

	swapDevices = [ ];

	# Enables DHCP on each ethernet and wireless interface. In case of scripted networking
	# (the default) this is the recommended approach. When using systemd-networkd it's
	# still possible to use this option, but it's recommended to use it in conjunction
	# with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
	networking.useDHCP = lib.mkDefault true;
	# networking.interfaces.enp7s0.useDHCP = lib.mkDefault true;
	# networking.interfaces.wlp0s20f3.useDHCP = lib.mkDefault true;

	nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
	hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
