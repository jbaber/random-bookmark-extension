all: png_icons firefox_extension

icons/png/bookmarky128.png: icons/bookmarky.svg
	convert $< -fuzz 10% -transparent white -geometry 128x128 $@

icons/png/bookmarky16.png: icons/bookmarky.svg
	convert $< -fuzz 10% -transparent white -geometry 16x16 $@

icons/png/bookmarky19.png: icons/bookmarky.svg
	convert $< -fuzz 10% -transparent white -geometry 19x19 $@

icons/png/bookmarky38.png: icons/bookmarky.svg
	convert $< -fuzz 10% -transparent white -geometry 38x38 $@

icons/png/bookmarky48.png: icons/bookmarky.svg
	convert $< -fuzz 10% -transparent white -geometry 48x48 $@

icons/png/bookmarky512.png: icons/bookmarky.svg
	convert $< -fuzz 10% -transparent white -geometry 512x512 $@

icons/png/bookmarky96.png: icons/bookmarky.svg
	convert $< -fuzz 10% -transparent white -geometry 96x96 $@

png_icons: icons/bookmarky.svg icons/png/bookmarky128.png icons/png/bookmarky16.png icons/png/bookmarky19.png icons/png/bookmarky38.png icons/png/bookmarky48.png icons/png/bookmarky512.png icons/png/bookmarky96.png

firefox_extension:
	web-ext build


.PHONY: clean

clean:
	rm -rf web-ext-artifacts
