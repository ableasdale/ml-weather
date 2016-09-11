xquery version "1.0-ml";

for $i in xdmp:filesystem-directory(xdmp:modules-root())
return $i
