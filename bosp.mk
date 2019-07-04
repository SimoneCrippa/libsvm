
ifdef CONFIG_EXTERNAL_LIBSVM

# Targets provided by this project
.PHONY: libsvm clean_libsvm

# Add this to the "external" target
external: libsvm
clean_external: clean_libsvm

MODULE_DIR_LIBSVM=external/optional/libsvm
LIBSVM_VERSION="323"

libsvm: 
	@cd $(MODULE_DIR_LIBSVM) && autoreconf -i
	@cd $(MODULE_DIR_LIBSVM) && ./configure --prefix=$(shell pwd)/out
	@echo
	@echo "==== Installing LIBSVM Library ($(LIBSVM_VERSION)) ===="
	@echo " Using GCC    : $(CC)"
	@echo " Target flags : $(TARGET_FLAGS)"
	@echo " Sysroot      : $(PLATFORM_SYSROOT)"
	@echo " BOSP Options : $(CMAKE_COMMON_OPTIONS)"
	@cd $(MODULE_DIR_LIBSVM) && \
	        make -j$(CPUS) || \
	        exit 1        
	@cd $(MODULE_DIR_LIBSVM) && \
	        make -j$(CPUS) install || \
	        exit 1
	@cd $(MODULE_DIR_LIBSVM) && make maintainer-clean

clean_libsvm:
	@echo "==== Clean-up LIBSVM library ===="
	@[ ! -f $(BUILD_DIR)/lib/libsvm.so ] || \
		rm -f $(BUILD_DIR)/lib/libsvm*
	@[ ! -d $(MODULE_DIR_LIBSVM)/build ] || \
		rm -rf $(MODULE_DIR_LIBSVM)/build

else # CONFIG_EXTERNAL_LIBSVM

libsvm:
	$(warning $(MODULE_DIR_LIBSVM) module disabled by BOSP configuration)
	$(error BOSP compilation failed)

endif # CONFIG_EXTERNAL_LIBSVM

