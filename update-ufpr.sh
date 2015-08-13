#!/bin/bash

jekyll build --config=_config-ufpr.yml
mkdir -p _site/mirrors
cp ~/Dropbox/0_Mirror/* _site/mirrors/

# Criação do html
cat > _site/mirrors/index.html << EOF
<html>
<body>
<ul>
EOF
for file in ~/Dropbox/0_Mirror/*
do
  file=$(basename $file)
  echo "<li> <a href=\"$file\"> $file </a>"
done >> _site/mirrors/index.html
cat >> _site/mirrors/index.html << EOF
</ul>
</body>
</html>
EOF

lftp -c "set ftp:list-options -a;
open abelsiqueira@people.ufpr.br;
lcd _site;
cd html;
mirror --reverse --verbose --only-newer"
