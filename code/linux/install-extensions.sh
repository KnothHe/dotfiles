#! /bin/bash
cat extensions.list | xargs -L 1 echo code --install-extension > install.sh
chmod +x install.sh
./install.sh
rm install.sh
