{ config, lib, pkgs, ... }:

{
	hardware.graphics.enable = true;

	hardware.nvidia = {
		modesetting.enable = true;
		powerManagement = {
			enable = true;
			finegrained = true;
		};
		open = true;
		nvidiaSettings = true;

		prime = {
			offload = {
				enable = true;
				enableOffloadCmd = true;
			};

			intelBusId = "PCI:0:2:0";
			nvidiaBusId = "PCI:1:0:0";
		};
	};
}
