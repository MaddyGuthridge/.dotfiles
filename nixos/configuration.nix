# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{
  config,
  pkgs,
  lib,
  ...
}:

let
  # Add the unstable channel declaratively
  nixosUnstable = fetchTarball "https://github.com/NixOS/nixpkgs/archive/nixos-unstable.tar.gz";
  nixos2505 = fetchTarball "https://github.com/NixOS/nixpkgs/archive/nixos-25.05.tar.gz";
in
{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    # Include additional hardware settings
    ./hardware
    # Include environment configuration
    ./environments/gnome.nix
    # Include activities
    ./activities
  ];

  nixpkgs.config = {
    packageOverrides = pkgs: {
      unstable = import nixosUnstable {
        config = config.nixpkgs.config;
      };
      nixos2505 = import nixos2505 {
        config = config.nixpkgs.config;
      };
    };
  };

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # Bootloader.
  boot.loader.systemd-boot = {
    enable = true;
    configurationLimit = 10;
  };
  boot.loader.efi.canTouchEfiVariables = true;

  # Plymouth boot animation
  boot.plymouth = {
    enable = true;
    theme = "rings_2";
    themePackages = with pkgs; [
      # By default we would install all themes
      (adi1090x-plymouth-themes.override {
        selected_themes = [ "rings_2" ];
      })
    ];
  };

  # Currently pinning to 6.18 until Nvidia driver issues are resolved.
  # https://github.com/NixOS/nixpkgs/issues/489947
  boot.kernelPackages = pkgs.linuxPackages_6_18;

  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Australia/Sydney";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_AU.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_AU.UTF-8";
    LC_IDENTIFICATION = "en_AU.UTF-8";
    LC_MEASUREMENT = "en_AU.UTF-8";
    LC_MONETARY = "en_AU.UTF-8";
    LC_NAME = "en_AU.UTF-8";
    LC_NUMERIC = "en_AU.UTF-8";
    LC_PAPER = "en_AU.UTF-8";
    LC_TELEPHONE = "en_AU.UTF-8";
    LC_TIME = "en_AU.UTF-8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # GDM login screen
  services.displayManager.gdm.enable = true;
  services.displayManager.defaultSession = "gnome";

  # Enable the GNOME Desktop Environment.
  services.desktopManager.gnome.enable = true;
  # Amd also Cosmic
  services.desktopManager.cosmic.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "au";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.maddy = {
    isNormalUser = true;
    description = "Maddy Guthridge";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };

  # Allow running arbitrary executables
  # https://nix.dev/guides/faq#how-to-run-non-nix-executables
  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      glibc.static
    ];
  };

  # Install firefox.
  programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    #  vim # Do not forget to add an editor to edit configuration.nix!
    # The Nano editor is also installed by default.
    wget
    zsh
    usbutils
    git
    hack-font
    unstable.cloudflared
    zip
    unstable.mission-center
    file
    iperf
    jq
    wineWowPackages.stableFull
    fastfetch
    hyfetch
    # Just editor to build the system
    just
    just-lsp
  ];

  # Make AppImages runnable
  programs.appimage = {
    enable = true;
    binfmt = true;
  };

  # Ibus input methods
  i18n.inputMethod = {
    enable = true;
    type = "ibus";
    ibus.engines = with pkgs.ibus-engines; [
      # Your engines here
    ];
  };

  # Nix rebuilds like to use 100% CPU if something compiles from source.
  # This at least stops the system from locking up.
  systemd.services.nix-daemon.serviceConfig = {
    # Nice Nix daemon
    Nice = lib.mkForce 15;
    CPUWeight = 5;
    IOSchedulingClass = lib.mkForce "idle";
    IOSchedulingPriority = lib.mkForce 7;
  };

  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 7d --keep 10";
  };

  # GnuPG Agent
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  # plocate
  services.locate = {
    enable = true;
    interval = "daily";
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?
}
