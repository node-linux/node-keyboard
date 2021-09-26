mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
mkfile_dir := $(dir $(mkfile_path))

NODE=-I/usr/include/node -I$(mkfile_dir)node_modules/node-addon-api/ -I$(shell node -p "require('node-addon-api').include")
INCLUDE=$(NODE)
LIBS=

BUILD_DIR=$(curdir)/build

keyboard.node: clean
	mkdir -f $(BUILD_DIR)
	g++ lib.cpp -shared -fPIC -o $(BUILD_DIR)/keyboard.node -Wall -Wextra $(LIBS) $(INCLUDE)

clean:
	$(if $(wildcard $(BUILD_DIR)/*.node), rm *.node)
