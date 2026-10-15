#!/bin/bash

# Activate the virtual environment
source .venv/bin/activate

cd Docs

python3 -m mkdocs build --clean

# Obviously this will only work on my personal server
ssh 192.168.0.240 'rm -rf /home/bart/NFS/fpgc-reference/*'
rsync -r site/ 192.168.0.240:/home/bart/NFS/fpgc-reference/
ssh 192.168.0.240 'chown $USER:$USER -R /home/bart/NFS/fpgc-reference/*'

# Deactivate virtual environment
deactivate
