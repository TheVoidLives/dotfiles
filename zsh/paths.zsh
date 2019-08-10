# Custom Paths

# Vim
export EDITOR="nvim"

# Java & Jenv
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

# Path
export PATH="~/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export LESSOPEN="|/usr/local/bin/lesspipe.sh %s" LESS_ADVANCED_PREPROCESSOR=1
export ANDROID_HOME=$HOME/Library/Android/sdk
export JAVA_HOME="$HOME/.jenv/versions/`jenv version-name`"
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

# Golang
export GOPATH="${HOME}/.go"
export GOROOT="$(brew --prefix golang)/libexec"
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"
test -d "${GOPATH}" || mkdir "${GOPATH}"
test -d "${GOPATH}/src/github.com" || mkdir -p "${GOPATH}/src/github.com"

export PATH="/usr/local/sbin:$PATH"
