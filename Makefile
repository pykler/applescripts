SCRIPTS=$(wildcard */*.applescript)
APPS=$(patsubst %applescript,apps/%app,${SCRIPTS}) 

all: ${APPS}

apps/%.app: %.applescript
	mkdir -p $$(dirname $@)
	osacompile -o $@ $<
	cp resources/applet.icns $@/Contents/Resources/applet.icns

clean:
	rm -fr ${APPS}
