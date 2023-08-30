{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;
  imports = [./home-manager/23.05.nix];
  
  console = {
    packages = [pkgs.terminus_font];
    font = "${pkgs.terminus_font}/share/consolefonts/ter-132n.psf.gz";
  };
  #enable flatpaks
  services.flatpak.enable = true;
 # xdg.portal.exraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  #enable serial console
  systemd.services."serial-getty@ttyS0" = {
	enable = true;
	wantedBy = ["getty.target"];
	serviceConfig.Restart = "always";
  };
  networking.hostName = "nixos-test";
  networking.networkmanager.enable = true;
  time.timeZone = "America/New_York";
  i18n.defaultLocale = "en_US.UTF-8";

  users.users.clay = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    
    };
  home-manager.users.clay = {pkgs, ... }: 
   {
    home.stateVersion = config.system.stateVersion;
  ############PACKAGES############
    home.packages = with pkgs;[
      neovim
      firefox
      zsh
      oh-my-zsh
      python311
      thunderbird
      zulu8
      nmap
      go
      blender
      flatpak
      
    ];
  ################################
    programs.git = {
      enable = true;
      userName = "clayton14";
      userEmail = "claytoneasley77@gmail.com";
    };
   }; 

  sound.enable = true;
  hardware.pulseaudio.enable = true;
  services.xserver = {
    layout = "us";
    libinput.enable = true;
    enable = true;
    desktopManager.plasma5.enable = true;
    displayManager.sddm = {
      enable = true;
      autoNumlock = true;
    };
  };

}
