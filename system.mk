# Directories
ROOT_DIR := .

# Server info
#HOST = local
SERVER := geiger@geiger.local
#PORT := -p 22
RSYNC_REMOTE := -e 'ssh $(PORT)'
SSH := ssh $(SERVER) $(PORT)

REMOTE_ROOT_DIR ?=sandbox/$(USER)/ecomp_repo
REMOTE_USER := geiger
DOMAIN := $(REMOTE_USER).local
#DOMAIN := $(USER).com
#PORT := -p 22
SERVER := $(REMOTE_USER)@$(DOMAIN)
RSYNC_REMOTE := -e 'ssh $(PORT)'
SSH := ssh $(SERVER) $(PORT)


# Ojective (sim/fpga); default is sim
OBJ = sim
