.PHONY: build test package clean

build:
	poetry build -f wheel
	pip install dist/*.whl

test:
	poetry run aw-watcher-afk --help  # Ensures that it at least starts
	make typecheck

typecheck:
	poetry run mypy aw_watcher_afk --ignore-missing-imports

package:
	pyinstaller aw-watcher-afk.spec --clean --noconfirm

clean:
	rm -rf build dist
	rm -rf aw_watcher_afk/__pycache__
