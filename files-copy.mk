# We are copying a fixed set of files in some directories
files-copy: $(OUT_DIR)
	echo $(OUT_DIR)
	for file in $(FILES_COPY); do \
		cp $(CURDIR)/$${file} $(OUT_DIR)/$${file}; \
    done