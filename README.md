# GrzAdr Vim

Config files for vim environment

# Installation:

Old configuration has to be _"safely"_ replaced according to this [Stackoverflow post](https://stackoverflow.com/questions/2411031/how-do-i-clone-into-a-non-empty-directory)

Run this command inside ~/.vim directory:

```bash
    (rm -rf plugged || true) && \
    mkdir git-tmp && \
    git clone --no-checkout grzadr/grzadr_vim ./git-tmp && \
    rm -rf git-tmp && \
    git reset --hard HEAD
```
