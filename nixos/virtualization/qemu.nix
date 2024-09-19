{
  config,
  lib,
  pkgs,
  ...
}:
{
  virtualisation.qemu = {
    package = pkgs.qemu_kvm;
    options = [
	"-vga qxl"
	"-spice port=5924,disable-ticketing=on"
	"-device virtio-serial -chardev spicevmc,id=vdagent,debug=0,name=vdagent"
	"-device virtserialport,chardev=vdagent,name=com.redhat.spice.0"
    ];
  };
}
