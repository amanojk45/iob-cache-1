MODULE:=CACHE
TOP_MODULE = iob_cache

#PATHS
REMOTE_ROOT_DIR ?= sandbox/iob-soc/submodules/CACHE
CACHE_HW_DIR:=$(CACHE_DIR)/hardware
CACHE_SW_DIR:=$(CACHE_DIR)/software
SIM_DIR ?=$(CACHE_HW_DIR)/simulation
FPGA_DIR ?=$(shell find $($(MODULE)_DIR)/hardware -name $(FPGA_FAMILY))
DOC_DIR:=$(CACHE_DIR)/document
SUBMODULES_DIR:=$(CACHE_DIR)/submodules

# SUBMODULE PATHS
SUBMODULES_LIST:=$(shell ls $(SUBMODULES_DIR))
$(foreach p, $(SUBMODULES_LIST), $(if $(filter $p, $(SUBMODULES)),,$(eval $p_DIR ?=$(SUBMODULES_DIR)/$p)))

#DEFAULT FPGA FAMILY
FPGA_FAMILY ?=CYCLONEV-GT
#FPGA_FAMILY ?=XCKU
FPGA_FAMILY_LIST = CYCLONEV-GT XCKU

#DEFAULT DOC
DOC:=pb
#DOC:=ug
DOC_LIST:=pb ug

# VERSION
VERSION= 0.1
VLINE:="V$(VERSION)"
UART_version.txt:
ifeq ($(VERSION),)
	$(error "variable VERSION is not set")
endif
	echo $(VLINE) > version.txt