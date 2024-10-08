{ config, 
  pkgs,
  ... }:
{
  # Enable OpenGL
  hardware = {
      opengl = {
	enable = true;
	extraPackages = with pkgs; [
	  vaapiVdpau
	  libvdpau-va-gl
	  ];
      };
      nvidia = {
	  modesetting.enable 			= true;
	  powerManagement.enable 		= false;
	  powerManagement.finegrained 	= false;
	  open 				= true;
	  nvidiaSettings 			= true;
	  # package = config.boot.kernelPackages.nvidiaPackages.vulkan_beta;
	  package = config.boot.kernelPackages.nvidiaPackages.mkDriver {
	    version = "535.154.05";
	    sha256_64bit = "sha256-fpUGXKprgt6SYRDxSCemGXLrEsIA6GOinp+0eGbqqJg=";
	    sha256_aarch64 = "sha256-G0/GiObf/BZMkzzET8HQjdIcvCSqB1uhsinro2HLK9k=";
	    openSha256 = "sha256-wvRdHguGLxS0mR06P5Qi++pDJBCF8pJ8hr4T8O6TJIo=";
	    settingsSha256 = "sha256-9wqoDEWY4I7weWW05F4igj1Gj9wjHsREFMztfEmqm10=";
	    persistencedSha256 = "sha256-d0Q3Lk80JqkS1B54Mahu2yY/WocOqFFbZVBh+ToGhaE=";
	  };
      };
    };

  # Load Nvidia driver
  services.xserver.videoDrivers 	= [ "nvidia" ];

 
  # Kernel parameters
  boot.kernelParams = [
    "nvidia_drm.fbdev=1"
    "ibt=off"
  ];
}
