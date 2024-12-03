{ pkgs, ... }: rec {
  pystoi = pkgs.callPackage ./pystoi { };
  argbind = pkgs.callPackage ./argbind { };
  alias-free-torch = pkgs.callPackage ./alias-free-torch { };
  pyloudnorm = pkgs.callPackage ./pyloudnorm { };
  randomname = pkgs.callPackage ./randomname { };
  auraloss = pkgs.callPackage ./auraloss { };
  diffq = pkgs.callPackage ./diffq { };
  einops-exts = pkgs.callPackage ./einops-exts { };
  ema-pytorch = pkgs.callPackage ./ema-pytorch { };
  laion-clap = pkgs.callPackage ./laion-clap { };
  local-attention = pkgs.callPackage ./local-attention { };
  encodec = pkgs.callPackage ./encodec { };
  jams = pkgs.callPackage ./jams { };
  julius = pkgs.callPackage ./julius { };
  lameenc = pkgs.callPackage ./lameenc { };
  stempeg = pkgs.callPackage ./stempeg { };
  openunmix = pkgs.callPackage ./openunmix { };
  pedalboard = pkgs.callPackage ./pedalboard { };
  read-version = pkgs.callPackage ./read-version { };
  submitit = pkgs.callPackage ./submitit { };
  prefigure = pkgs.callPackage ./prefigure { };
  treetable = pkgs.callPackage ./treetable { };
  vmo = pkgs.callPackage ./vmo { };
  music21 = pkgs.callPackage ./music21 { };
  dali-dataset = pkgs.callPackage ./dali-dataset { };
  mido = pkgs.callPackage ./mido { };
  v-diffusion-pytorch = pkgs.callPackage ./v-diffusion-pytorch { };
  torch-stoi = pkgs.callPackage ./torch-stoi { inherit pystoi; };
  pretty-midi = pkgs.callPackage ./pretty-midi { inherit mido; };
  aeiou = pkgs.callPackage ./aeiou { inherit pedalboard; };
  mirdata = pkgs.callPackage ./mirdata { inherit jams pretty-midi music21 dali-dataset; };
  hydra-colorlog = pkgs.callPackage ./hydra-colorlog { inherit read-version; };
  msaf = pkgs.callPackage ./msaf { inherit jams; inherit vmo; };
  dora-search = pkgs.callPackage ./dora-search { inherit treetable submitit; };
  musdb = pkgs.callPackage ./musdb { inherit stempeg; };
  museval = pkgs.callPackage ./museval { inherit musdb; };
  einx = pkgs.callPackage ./einx { };
  vector-quantize-pytorch = pkgs.callPackage ./vector-quantize-pytorch { inherit einx; };
  x-transformers = pkgs.callPackage ./x-transformers { };
  descript-audiotools = pkgs.callPackage ./descript-audiotools { inherit argbind pyloudnorm pystoi randomname torch-stoi; };
  descript-audio-codec = pkgs.callPackage ./descript-audio-codec { inherit argbind descript-audiotools; };
  stable-audio-tools = pkgs.callPackage ./stable-audio-tools { inherit aeiou prefigure pedalboard alias-free-torch auraloss descript-audio-codec einops-exts ema-pytorch laion-clap local-attention v-diffusion-pytorch vector-quantize-pytorch x-transformers; };
  # TODO
  #demucs = pkgs.callPackage ./demucs{ inherit diffq; inherit dora-search; inherit julius; inherit hydra-colorlog; inherit lameenc; inherit museval; inherit openunmix; inherit submitit; inherit treetable; };
  # TODO
  #audiocraft = pkgs.callPackage ./audiocraft{ inherit demucs; };
}
