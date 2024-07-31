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
  msaf = pkgs.callPackage ./msaf { inherit jams; inherit vmo; };
  dora-search = pkgs.callPackage ./dora-search { inherit treetable submitit; };
  musdb = pkgs.callPackage ./musdb { inherit stempeg; };
  museval = pkgs.callPackage ./museval { inherit musdb; };
  # TODO
  #demucs = pkgs.callPackage ./demucs{ inherit diffq; inherit dora-search; inherit julius; inherit hydra-colorlog; inherit lameenc; inherit museval; inherit openunmix; inherit submitit; inherit treetable; };
  # TODO
  #audiocraft = pkgs.callPackage ./audiocraft{ inherit demucs; };
}
