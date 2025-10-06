{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    virt-manager
    virt-viewer
    qemu
    qemu_kvm
    libvirt
    swtpm
    OVMF
  ];

  virtualisation.libvirtd = {
    enable = true;
    onBoot = "ignore";  # or "start" to auto-start VMs
    onShutdown = "shutdown";
    qemu = {
      runAsRoot = true;
      swtpm.enable = true;
      ovmf.enable = true;
      ovmf.packages = [ pkgs.OVMF.fd ];
    };
  };

  boot.kernelModules = [ "kvm-amd" "kvm-intel" ];

  users.users.ziad.extraGroups = [ "libvirtd" "kvm" ];

  systemd.sockets.libvirtd = {
    wantedBy = [ "sockets.target" ];
  };
}
