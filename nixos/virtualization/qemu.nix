{
  pkgs,
  ...
}:
{
  virtualisation.qemu.options = [
      "-vga qxl"
      "-spice port=5924,disable-ticketing=on"
      "-device virtio-serial -chardev spicevmc,id=vdagent,debug=0,name=vdagent"
      "-device virtserialport,chardev=vdagent,name=com.redhat.spice.0"
  ];
}
