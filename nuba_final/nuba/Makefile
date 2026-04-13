# Makefile — Build, install and package Nuba Programming Language
# Usage:
#   make              # show help
#   make install      # install for current user
#   make install-system  # install system-wide (needs sudo)
#   make uninstall    # remove installation
#   make test         # run test suite
#   make dist         # build distribution ZIP
#   make deb          # build .deb package
#   make rpm          # build .rpm package

SHELL := /bin/bash
.DEFAULT_GOAL := help

NUBA_VERSION  := 1.0.0
NUBA_NAME     := nuba-lang
PYTHON        := $(shell command -v python3 || command -v python)
PREFIX        ?= $(HOME)/.local
INSTALL_DIR   := $(PREFIX)/lib/nuba
BIN_DIR       := $(PREFIX)/bin
SYSTEM_PREFIX := /usr/local

DIST_DIR := dist
PKG_NAME := $(NUBA_NAME)-$(NUBA_VERSION)

# ── Colors ────────────────────────────────────────────────────────────────
RED    := \033[0;31m
GREEN  := \033[0;32m
YELLOW := \033[1;33m
BLUE   := \033[0;34m
RESET  := \033[0m

.PHONY: help install install-system uninstall test clean dist deb rpm pip check

# ── Help ──────────────────────────────────────────────────────────────────
help:
	@echo ""
	@echo -e "$(BLUE)Nuba Programming Language v$(NUBA_VERSION)$(RESET)"
	@echo ""
	@echo "  make install         Install for current user ($(PREFIX))"
	@echo "  make install-system  Install system-wide ($(SYSTEM_PREFIX)) — needs sudo"
	@echo "  make uninstall       Remove user installation"
	@echo "  make test            Run test suite"
	@echo "  make check           Check syntax of all .nu files"
	@echo "  make dist            Create distributable ZIP"
	@echo "  make pip             Install via pip (pip install -e .)"
	@echo "  make deb             Build Debian .deb package"
	@echo "  make rpm             Build RPM package"
	@echo "  make clean           Remove build artifacts"
	@echo ""

# ── Check Python ──────────────────────────────────────────────────────────
check-python:
	@if [ -z "$(PYTHON)" ]; then \
		echo -e "$(RED)Error: Python 3.8+ not found$(RESET)"; \
		exit 1; \
	fi
	@PY_VER=$$($(PYTHON) -c "import sys; print(sys.version_info.major*10+sys.version_info.minor)"); \
	if [ "$$PY_VER" -lt 38 ]; then \
		echo -e "$(RED)Error: Python 3.8+ required$(RESET)"; \
		exit 1; \
	fi
	@echo -e "$(GREEN)✓ Python OK: $$($(PYTHON) --version)$(RESET)"

# ── Install ───────────────────────────────────────────────────────────────
install: check-python
	@echo -e "$(BLUE)Installing Nuba $(NUBA_VERSION) to $(INSTALL_DIR) ...$(RESET)"
	@mkdir -p $(INSTALL_DIR) $(BIN_DIR)
	@cp -r nuba         $(INSTALL_DIR)/
	@cp -r stdlib       $(INSTALL_DIR)/
	@cp    nuba_cli.py  $(INSTALL_DIR)/
	@[ -d examples ] && cp -r examples $(INSTALL_DIR)/ || true
	@printf '#!/bin/bash\nexec "$(PYTHON)" "$(INSTALL_DIR)/nuba_cli.py" "$$@"\n' > $(BIN_DIR)/nuba
	@chmod +x $(BIN_DIR)/nuba
	@echo -e "$(GREEN)✓ Installed: $(BIN_DIR)/nuba$(RESET)"
	@echo ""
	@echo "  Add to PATH if needed: export PATH=\"$(BIN_DIR):\$$PATH\""
	@echo "  Test: nuba --version"
	@echo "  REPL: nuba"
	@echo ""
	@# Register MIME type on Linux
	@if command -v xdg-mime &>/dev/null 2>&1; then \
		mkdir -p $(HOME)/.local/share/mime/packages; \
		cp registry/x-nuba.xml $(HOME)/.local/share/mime/packages/ 2>/dev/null || true; \
		xdg-mime install --novendor $(HOME)/.local/share/mime/packages/x-nuba.xml 2>/dev/null || true; \
		update-mime-database $(HOME)/.local/share/mime 2>/dev/null || true; \
		mkdir -p $(HOME)/.local/share/applications; \
		cp registry/nuba.desktop $(HOME)/.local/share/applications/ 2>/dev/null || true; \
		echo -e "$(GREEN)✓ .nu file association registered$(RESET)"; \
	fi

install-system: check-python
	@echo -e "$(BLUE)Installing system-wide to $(SYSTEM_PREFIX) ...$(RESET)"
	@mkdir -p $(SYSTEM_PREFIX)/lib/nuba $(SYSTEM_PREFIX)/bin
	@cp -r nuba        $(SYSTEM_PREFIX)/lib/nuba/
	@cp -r stdlib      $(SYSTEM_PREFIX)/lib/nuba/
	@cp    nuba_cli.py $(SYSTEM_PREFIX)/lib/nuba/
	@printf '#!/bin/bash\nexec "$(PYTHON)" "$(SYSTEM_PREFIX)/lib/nuba/nuba_cli.py" "$$@"\n' \
		> $(SYSTEM_PREFIX)/bin/nuba
	@chmod 755 $(SYSTEM_PREFIX)/bin/nuba
	@[ -f registry/x-nuba.xml ] && \
		cp registry/x-nuba.xml /usr/share/mime/packages/ && \
		update-mime-database /usr/share/mime 2>/dev/null || true
	@[ -f registry/nuba.desktop ] && \
		cp registry/nuba.desktop /usr/share/applications/ && \
		update-desktop-database /usr/share/applications 2>/dev/null || true
	@echo -e "$(GREEN)✓ System install complete$(RESET)"

# ── Uninstall ─────────────────────────────────────────────────────────────
uninstall:
	@echo "Removing Nuba..."
	@rm -f  $(BIN_DIR)/nuba
	@rm -rf $(INSTALL_DIR)
	@rm -f  $(HOME)/.local/share/mime/packages/x-nuba.xml
	@rm -f  $(HOME)/.local/share/applications/nuba.desktop
	@update-mime-database $(HOME)/.local/share/mime 2>/dev/null || true
	@echo -e "$(GREEN)✓ Nuba removed$(RESET)"

# ── Tests ─────────────────────────────────────────────────────────────────
test: check-python
	@echo -e "$(BLUE)Running test suite...$(RESET)"
	@$(PYTHON) nuba_cli.py tests/test_features.nu
	@$(PYTHON) nuba_cli.py tests/test_runner.nu
	@echo -e "$(GREEN)✓ All tests passed$(RESET)"

# ── Syntax check all .nu files ────────────────────────────────────────────
check: check-python
	@echo -e "$(BLUE)Checking syntax of all .nu files...$(RESET)"
	@PASS=0; FAIL=0; \
	for f in $$(find . -name "*.nu" -not -path "./__pycache__/*"); do \
		if $(PYTHON) nuba_cli.py --check "$$f" &>/dev/null; then \
			PASS=$$((PASS+1)); \
		else \
			echo "  FAIL: $$f"; \
			FAIL=$$((FAIL+1)); \
		fi; \
	done; \
	echo "Passed: $$PASS  Failed: $$FAIL"

# ── pip install ───────────────────────────────────────────────────────────
pip: check-python
	$(PYTHON) -m pip install -e .

# ── Build distribution ────────────────────────────────────────────────────
dist: clean
	@echo -e "$(BLUE)Building distribution...$(RESET)"
	@mkdir -p $(DIST_DIR)
	@zip -r $(DIST_DIR)/$(PKG_NAME).zip \
		nuba/ stdlib/ examples/ tests/ docs/ \
		nuba_cli.py nuba_main.py \
		bin/ install/ registry/ vscode_extension/ installer/ \
		scripts/ snippets/ \
		README.md CHANGELOG.md LICENSE \
		setup.py setup.cfg pyproject.toml Makefile \
		-x "**/__pycache__/*" -x "*.pyc" -x ".git/*" \
		2>/dev/null || true
	@echo -e "$(GREEN)✓ Distribution: $(DIST_DIR)/$(PKG_NAME).zip$(RESET)"

# ── Debian package ────────────────────────────────────────────────────────
deb:
	@echo -e "$(BLUE)Building Debian package...$(RESET)"
	@mkdir -p $(DIST_DIR)/deb/$(PKG_NAME)_$(NUBA_VERSION)/usr/lib/nuba
	@mkdir -p $(DIST_DIR)/deb/$(PKG_NAME)_$(NUBA_VERSION)/usr/bin
	@mkdir -p $(DIST_DIR)/deb/$(PKG_NAME)_$(NUBA_VERSION)/usr/share/mime/packages
	@mkdir -p $(DIST_DIR)/deb/$(PKG_NAME)_$(NUBA_VERSION)/usr/share/applications
	@mkdir -p $(DIST_DIR)/deb/$(PKG_NAME)_$(NUBA_VERSION)/DEBIAN
	@cp -r nuba stdlib nuba_cli.py \
		$(DIST_DIR)/deb/$(PKG_NAME)_$(NUBA_VERSION)/usr/lib/nuba/
	@printf '#!/bin/bash\nexec python3 /usr/lib/nuba/nuba_cli.py "$$@"\n' \
		> $(DIST_DIR)/deb/$(PKG_NAME)_$(NUBA_VERSION)/usr/bin/nuba
	@chmod 755 $(DIST_DIR)/deb/$(PKG_NAME)_$(NUBA_VERSION)/usr/bin/nuba
	@cp installer/DEBIAN/control  $(DIST_DIR)/deb/$(PKG_NAME)_$(NUBA_VERSION)/DEBIAN/
	@cp installer/DEBIAN/postinst $(DIST_DIR)/deb/$(PKG_NAME)_$(NUBA_VERSION)/DEBIAN/
	@chmod 755 $(DIST_DIR)/deb/$(PKG_NAME)_$(NUBA_VERSION)/DEBIAN/postinst
	@cp registry/x-nuba.xml  $(DIST_DIR)/deb/$(PKG_NAME)_$(NUBA_VERSION)/usr/share/mime/packages/
	@cp registry/nuba.desktop $(DIST_DIR)/deb/$(PKG_NAME)_$(NUBA_VERSION)/usr/share/applications/
	@if command -v dpkg-deb &>/dev/null; then \
		dpkg-deb --build $(DIST_DIR)/deb/$(PKG_NAME)_$(NUBA_VERSION) \
			$(DIST_DIR)/$(PKG_NAME)_$(NUBA_VERSION)_all.deb; \
		echo -e "$(GREEN)✓ .deb built: $(DIST_DIR)/$(PKG_NAME)_$(NUBA_VERSION)_all.deb$(RESET)"; \
	else \
		echo -e "$(YELLOW)dpkg-deb not found. Install with: sudo apt install dpkg$(RESET)"; \
	fi

# ── RPM package ───────────────────────────────────────────────────────────
rpm:
	@echo -e "$(BLUE)Building RPM package...$(RESET)"
	@mkdir -p $(HOME)/rpmbuild/{BUILD,RPMS,SOURCES,SPECS,SRPMS}
	@tar -czf $(HOME)/rpmbuild/SOURCES/v$(NUBA_VERSION).tar.gz \
		--transform "s,^,nuba-$(NUBA_VERSION)/," \
		nuba/ stdlib/ nuba_cli.py README.md 2>/dev/null || true
	@cp installer/nuba-lang.spec $(HOME)/rpmbuild/SPECS/
	@if command -v rpmbuild &>/dev/null; then \
		rpmbuild -ba $(HOME)/rpmbuild/SPECS/nuba-lang.spec; \
		echo -e "$(GREEN)✓ RPM built$(RESET)"; \
	else \
		echo -e "$(YELLOW)rpmbuild not found. Install with: sudo dnf install rpm-build$(RESET)"; \
	fi

# ── Clean ─────────────────────────────────────────────────────────────────
clean:
	@find . -type d -name "__pycache__" -exec rm -rf {} + 2>/dev/null || true
	@find . -name "*.pyc" -delete 2>/dev/null || true
	@rm -rf $(DIST_DIR)
	@echo -e "$(GREEN)✓ Cleaned$(RESET)"

# ── Version ───────────────────────────────────────────────────────────────
version:
	@echo "Nuba $(NUBA_VERSION)"
