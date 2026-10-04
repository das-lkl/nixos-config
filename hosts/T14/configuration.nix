{ config, pkgs, lib, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/core/cli.nix
    ../../modules/desktops/gnome.nix
  ];

  # Bootloader & Netzwerk
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  networking.hostName = "T14";
  networking.networkmanager.enable = true;


  # falls network schlecht ist remove this 
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = false;
  };

  # Zeit & Sprache
  time.timeZone = "Europe/Berlin";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_DE.UTF-8";
    LC_IDENTIFICATION = "de_DE.UTF-8";
    LC_MEASUREMENT = "de_DE.UTF-8";
    LC_MONETARY = "de_DE.UTF-8";
    LC_NAME = "de_DE.UTF-8";
    LC_NUMERIC = "de_DE.UTF-8";
    LC_PAPER = "de_DE.UTF-8";
    LC_TELEPHONE = "de_DE.UTF-8";
    LC_TIME = "de_DE.UTF-8";
  };


  # --- DESKTOP WAHL (Main System) ---
  services.xserver.enable = true;
  services.displayManager.gdm.enable = true; # GDM managt den Login
  services.desktopManager.gnome.enable = true;
  programs.hyprland.enable = true; # Hyprland parallel verfügbar machen

  # ... (Dein restlicher Bootloader/Netzwerk Code bleibt hier) ...

  # --- BOOT-SPLIT: NIXSTEAM ---
  specialisation."NixSteam".configuration = {
    system.nixos.tags = [ "gaming" ];
    boot.kernelPackages = pkgs.linuxPackages_zen;
    
    # Touchscreen Hardware-seitig blockieren
    boot.blacklistedKernelModules = [ "hid_multitouch" ];

    hardware.graphics = { enable = true; enable32Bit = true; };

    programs.steam = {
      enable = true;
      gamescopeSession.enable = true; # Erlaubt den Start ohne GNOME
    };
    programs.gamemode.enable = true;
    
    environment.systemPackages = with pkgs; [ discord brave mangohud ];
    services.desktopManager.gnome.enable = true; # Nur als Fallback, falls du doch mal einen Desktop im Gaming-Modus brauchst
    
    # Hintergrunddienste killen
    services.printing.enable = lib.mkForce false;
    # hardware.bluetooth.enable = lib.mkForce false; # BT-Controller
  };

  # Wörterbücher systemweit für alle Programme zugänglich machen
  environment.variables = {
    DICPATH = "/run/current-system/sw/share/hunspell";
  };
  
  # Tastaturlayout (Konsole, X11/Wayland kommt ins GNOME-Modul)
  console.keyMap = "de-latin1-nodeadkeys";

  # Audio (Pipewire)
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  services.printing.enable = true;

  # Sudo Timeout
  security.sudo.extraConfig = ''
    Defaults timestamp_timeout=30
  '';

  # Nix Basis-Einstellungen
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;

  # Dein nackter User-Account (Pakete machen wir über Home-Manager)
  users.users."lkl" = {
    isNormalUser = true;
    description = "lkl";
    extraGroups = [ "networkmanager" "wheel" ];
  };
  
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 14d";
  };

  system.stateVersion = "26.05";
}
