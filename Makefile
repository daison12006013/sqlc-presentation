# Capture additional command-line arguments
ARGS = $(filter-out $@,$(MAKECMDGOALS))

.DEFAULT_GOAL := help

# Handle the `--` separator
ifneq (,$(findstring --,$(MAKECMDGOALS)))
ARGS := $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))
MAKECMDGOALS := $(firstword $(MAKECMDGOALS))
endif

sqlc:
	(cd db_mysql && sqlc generate)

%:
	@:
