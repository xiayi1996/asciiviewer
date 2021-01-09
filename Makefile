.DEFAULT_GOAL := help

VERSION = 0.0.1

.PHONY: help
help: ## this help
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_0-9-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.PHONY: build-linux
build-linux: ## build on linux
	python -m PyInstaller \
	--dist ./dist/linux \
	--onefile --windowed  --clean --noconfirm \
	./asciiviewer.spec

.PHONY: build-wine
build-wine-raw: # build on wine using multiple commands
	python -m PyInstaller \
	--onefile --windowed --clean --noconfirm --noupx \
	--dist ./dist/windows --name asciiviewer \
	--path ./asciiviewer/source \
	--add-data="asciiviewer\splash.jpg;." \
	--add-data="asciiviewer\default.cfg;." \
	--add-data=".\asciiviewer\example\fmap;example" \
	--add-data=".\asciiviewer\example\MCOMPO_UOX_TBH;example" \
	--log-level DEBUG \
	--debug all \
	./asciiviewer/AsciiViewer.py

.PHONY: build-wine
build-wine: ## build on wine using spec file
	python -m PyInstaller \
	--dist ./dist/windows \
	--onefile --windowed --noconsole --clean --noconfirm --noupx \
	./asciiviewer.spec

.PHONY: build-mac
build-mac: ## build on macos
	python -m PyInstaller \
	--onefile --windowed  --clean --noconfirm \
	./asciiviewer.spec

.PHONY: centos-up
centos-up: ## start centos7
	vagrant up centos7

.PHONY: centos-ssh
centos-ssh: ## ssh into centos7
	vagrant ssh centos7

.PHONY: conda-env
conda-env: ## create conda environment
	conda env create --file environment.yml

.PHONY: conda-requirements
conda-requirements: ## export/update conda requirements for mac
	conda env export > environment.yml

.PHONY: docker-wine-py3
docker-win-py3: ## run docker to build windows binary with wine
	docker run -it --rm -v "$$(pwd):/src/" \
	--entrypoint /bin/sh cdrx/pyinstaller-windows:python3-32bit \
	-c "apt-get install make && pip install -r requirements.txt && /bin/bash"

.PHONY: create-git-tag
create-git-tag: ## create git tag
	git tag -a v$(VERSION) -m "v$(VERSION)"

.PHONY: push-git-tag
push-git-tag: ## push git tag to origin
	git push -f origin master
	git push origin v$(VERSION)

.PHONY: delete-git-tag
delete-git-tag: ## delete local and remove git tags
	git tag -d v$(VERSION)
	git push --delete origin v$(VERSION)

.PHONY: tag
tag: delete-git-tag create-git-tag push-git-tag
