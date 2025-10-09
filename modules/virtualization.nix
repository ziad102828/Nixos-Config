# modules/virtualization.nix
{ config, pkgs, ... }:

{
  # Enable KVM virtualization
  boot.kernelModules = [ "kvm-amd" "kvm-intel" ];

  # Enable libvirt daemon
  virtualisation.libvirtd = {
    enable = true;
    onBoot = "ignore";
    onShutdown = "shutdown";
    qemu = {
      runAsRoot = true;
      swtpm.enable = true;
      ovmf.enable = true;
      ovmf.packages = [ pkgs.OVMF.fd ];
    };
  };

  # Add user to libvirt group (note: use "libvirt" not "libvirtd")
  users.users.ziad.extraGroups = [ "libvirt" "kvm" ];

  # Virtualization packages
  environment.systemPackages = with pkgs; [
    qemu
    qemu_kvm
    OVMF
    swtpm
    virt-manager
    virt-viewer
    libvirt
    virtiofsd  # Add this for better filesystem performance
  ];

  # Enable and start the default network
  systemd.services.libvirtd-default-network = {
    description = "Create and start default libvirt network";
    after = [ "libvirtd.service" ];
    requires = [ "libvirtd.service" ];
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
      ExecStart = "${pkgs.libvirt}/bin/virsh net-start default";
      ExecStop = "${pkgs.libvirt}/bin/virsh net-destroy default";
    };
  };

  # Socket activation
  systemd.sockets.libvirtd = {
    enable = true;
    wantedBy = [ "sockets.target" ];
  };
}
