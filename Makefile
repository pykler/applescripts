SCRIPTS=$(wildcard rotate_screen/*.applescript)
APPS=$(patsubst rotate_screen%applescript,apps%app,${SCRIPTS})

all: ${APPS}

apps/%.app: rotate_screen/%.applescript
	osacompile -o $@ $<
	cp resources/applet.icns $@/Contents/Resources/applet.icns

clean:
	rm -fr ${APPS}
