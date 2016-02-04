.PHONY: clean test


FILE = poly.glot
SHELL = /bin/bash


test: test_pl test_php test_py test_rb test_cpp test_c test_objc
	@echo "ALL TESTS DONE."

test_pl: $(FILE)
	@if [[ "$(shell perl $(FILE))" != "Perl Code" ]]; then \
		echo "FAILED :: Perl test"; \
	fi

test_php: $(FILE)
	@if [[ "$(shell php $(FILE))" != "#/*PHP Code" ]]; then \
		echo "FAILED :: PHP test"; \
	fi

test_py: $(FILE)
	@if [[ "$(shell python $(FILE))" != "Python Code" ]]; then \
		echo "FAILED :: Python test"; \
	fi

test_rb: $(FILE)
	@if [[ "$(shell ruby $(FILE))" != "Ruby Code" ]]; then \
		echo "FAILED :: Ruby test"; \
	fi

test_c: clean c.out
	@if [[ "$(shell ./c.out)" != "C Code" ]]; then \
		echo "FAILED :: C test"; \
	fi

test_cpp: clean cpp.out
	@if [[ "$(shell ./cpp.out)" != "C++ Code" ]]; then \
		echo "FAILED :: C++ test"; \
	fi

test_objc: clean objc.out
	@if [[ "$(shell ./objc.out)" != "Objective-C Code" ]]; then \
		echo "FAILED :: Objective-C test"; \
	fi


c.out: $(FILE)
	@gcc -w -x c $(FILE) -o "c.out"

cpp.out: $(FILE)
	@gcc -w -x c++ $(FILE) -o "cpp.out"

objc.out: $(FILE)
	@gcc -w -x objective-c $(FILE) `gnustep-config --objc-flags`\
	                               `gnustep-config --base-libs` -o objc.out


clean:
	@rm -rfv c.out cpp.out objc.out objc.d
