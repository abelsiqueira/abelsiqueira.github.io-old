#!/bin/bash

echo -n "Category: "
read title

cat=$(echo $title | tr '[:upper:]' '[:lower:]')
filename=1900-01-01-$cat.html

cat > _posts/$filename << EOF
---
layout:     category
title:      $title
permalink:  /$cat.html
---
<p>
</p>
EOF

cat >> _config.yml << EOF
  $cat:
    title: "$title"
    url:   "/$cat.html"
EOF

vim _posts/$filename
