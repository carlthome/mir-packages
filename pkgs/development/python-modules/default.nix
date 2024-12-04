{ pkgs, ... }: rec {
  diffq = pkgs.callPackage ./diffq { };
  encodec = pkgs.callPackage ./encodec { };
  jams = pkgs.callPackage ./jams { };
  julius = pkgs.callPackage ./julius { };
  lameenc = pkgs.callPackage ./lameenc { };
  stempeg = pkgs.callPackage ./stempeg { };
  openunmix = pkgs.callPackage ./openunmix { };
  pedalboard = pkgs.callPackage ./pedalboard { };
  read-version = pkgs.callPackage ./read-version { };
  submitit = pkgs.callPackage ./submitit { };
  treetable = pkgs.callPackage ./treetable { };
  vmo = pkgs.callPackage ./vmo { };
  music21 = pkgs.callPackage ./music21 { };
  dali-dataset = pkgs.callPackage ./dali-dataset { };
  mido = pkgs.callPackage ./mido { };
  pretty-midi = pkgs.callPackage ./pretty-midi { inherit mido; };
  mirdata = pkgs.callPackage ./mirdata { inherit jams pretty-midi music21 dali-dataset; };
  hydra-colorlog = pkgs.callPackage ./hydra-colorlog { inherit read-version; };
  msaf = pkgs.callPackage ./msaf { inherit jams vmo; };
  dora-search = pkgs.callPackage ./dora-search { inherit treetable submitit; };
  flashy = pkgs.callPackage ./flashy { inherit dora-search; };
  musdb = pkgs.callPackage ./musdb { inherit stempeg; };
  museval = pkgs.callPackage ./museval { inherit musdb; };
  demucs = pkgs.callPackage ./demucs { inherit diffq dora-search julius hydra-colorlog lameenc museval openunmix submitit treetable; };
  audiocraft = pkgs.callPackage ./audiocraft { inherit demucs flashy hydra-colorlog; };
}
