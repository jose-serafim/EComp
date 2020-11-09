include system.mk

all:
	@echo "Specify a folder to compile and run"

iob-soc-fork: compile-and-run

soc-knn-fork: compile-and-run

knn-fork: compile-and-run

timer-fork: compile-and-run

compile-and-run:
ifeq ($(HOST),local)
	make -C submodules/$(MAKECMDGOALS) $(OBJ) D=1 
else
	@$(SSH) 'mkdir -p $(REMOTE_ROOT_DIR)'
	@rsync -avz $(RSYNC_REMOTE) --exclude .git $(ROOT_DIR) $(SERVER):$(REMOTE_ROOT_DIR)
	@$(SSH) -t 'source ~/.zprofile; make -C $(REMOTE_ROOT_DIR)/submodules/$(MAKECMDGOALS) $(OBJ) D=1'
endif

.PHONY: all iob-soc-fork soc-knn-fork clean
