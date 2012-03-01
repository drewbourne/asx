# ASX FlexUnit Runner
mxmlc asx_test/src/asx_test.mxml \
-output=asx_test/bin/asx_test.swf \
-debug=true \
-sp+=asx/src \
-sp+=asx_test/src \
-library-path+=asx_test/libs

# ASX SpecRunner
# mxmlc specs/AsxSpecRunner.mxml \
#  -output=bin/AsxSpecs.swf \
#  -debug=true \
#  -sp specs \
#  -sp src \
#  -sp ../spectacular-as3/src/ \
#  -sp ../hamcrest-as3/hamcrest/src \

# swc
compc \
-sp+=asx/src \
-include-sources asx/src \
-output asx/bin/asx.swc

# generate docs
# asdoc \
#  -doc-sources src \
#  -source-path src \
#  -main-title "ASX API Documentation" \
#  -window-title "ASX API Documentation" \
#  -output doc
