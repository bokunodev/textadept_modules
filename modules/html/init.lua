buffer.tab_indents=true
buffer.use_tabs=true

local snip = snippets.html
snip["html"]=[[
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
</head>
<body>
    %0
</body>
</html>
]]

snip["a"]='<a href="%1">%0</a>'
snip["link"]='<link rel="stylesheet" href="%1" />'
snip["img"]='<img src="%1" />'
snip["script"]='<script type="text/javascript" src="%1">%0</script>'
snip["style"]='<style type="text/css" media="%1(all)">%0</style>'
