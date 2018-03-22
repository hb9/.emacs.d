# Introduction

I created this emacs configuration after using spacemacs for quite a while. Therefore the keybindings mimic the bindings used in spacemacs (which are great imho). I use evil bindings though.

Of course i to also sometimes look at other peoples repositorys. You can find a superset of those repos [here](https://github.com/emacs-tw/awesome-emacs#noteworthy-configurations).

The packages that build the backbone of this configuration are: [use-package](https://github.com/jwiegley/use-package), [general](https://github.com/noctuid/general.el) and [ivy/counsel](https://github.com/abo-abo/swiper).

# Installation

I do not recommend to install this config. Some variables used in this config (to define places and files) are defined in a private file which is not a part of this repo. If you are inclined to use this config anyway you must deal with those variables first. Most of them are used in `cfg/init-org.el` and some in `cfg/init-bindings.el`.