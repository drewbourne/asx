# ASX SpecRunner
mxmlc specs/AsxSpecRunner.mxml \
 -output=bin/AsxSpecs.swf \
 -debug=true \
 -sp specs \
 -sp src \
 -sp ../spectacular-as3/src/ \
 -sp ../hamcrest-as3/core/src \
 -sp ../hamcrest-as3/factories/src

# swc
compc \
 -include-sources src \
 -output bin/asx.swc

# generate docs
# asdoc \
#  -doc-sources src \
#  -source-path src \
#  -main-title "ASX API Documentation" \
#  -window-title "ASX API Documentation" \
#  -output doc
