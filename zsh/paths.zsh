# Custom Paths


export EDITOR="nvim"
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"
export PATH="~/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export LESSOPEN="|/usr/local/bin/lesspipe.sh %s" LESS_ADVANCED_PREPROCESSOR=1
export ANDROID_HOME=$HOME/Library/Android/sdk
export JAVA_HOME="$HOME/.jenv/versions/`jenv version-name`"
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
