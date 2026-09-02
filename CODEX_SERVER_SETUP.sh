#!/usr/bin/env bash
# LLM-DEM Linux server environment setup for Codex.
# Run from any directory with: bash /path/to/LLM-DEM/CODEX_SERVER_SETUP.sh

set -Eeuo pipefail

PROJECT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
cd "$PROJECT_DIR"

PYTHON_BIN="${PYTHON_BIN:-python3.11}"
VENV_DIR="$PROJECT_DIR/.venv"
VENV_PYTHON="$VENV_DIR/bin/python"

if ! command -v "$PYTHON_BIN" >/dev/null 2>&1; then
    echo "ERROR: Python 3.11 was not found as '$PYTHON_BIN'." >&2
    echo "Ubuntu/Debian example: sudo apt-get update && sudo apt-get install -y python3.11 python3.11-venv" >&2
    echo "Then rerun this script. To use another executable, set PYTHON_BIN=/path/to/python3.11." >&2
    exit 2
fi

"$PYTHON_BIN" -c 'import sys; assert sys.version_info[:2] == (3, 11), f"Python 3.11 required, got {sys.version.split()[0]}"'

if [[ -e "$VENV_DIR" && ! -x "$VENV_PYTHON" ]]; then
    echo "ERROR: $VENV_DIR exists but is not a Linux virtual environment." >&2
    echo "Move or remove that environment, then rerun this script. Virtual environments cannot be copied between Windows and Linux." >&2
    exit 3
fi

if [[ ! -x "$VENV_PYTHON" ]]; then
    "$PYTHON_BIN" -m venv "$VENV_DIR"
fi

"$VENV_PYTHON" -c 'import sys; assert sys.version_info[:2] == (3, 11), f"Existing .venv uses Python {sys.version.split()[0]}; Python 3.11 is required"'
"$VENV_PYTHON" -m pip install --upgrade pip setuptools wheel
"$VENV_PYTHON" -m pip install -r "$PROJECT_DIR/D_01_requirements.txt"
"$VENV_PYTHON" -m pip check

MPLBACKEND=Agg PYTHONDONTWRITEBYTECODE=1 "$VENV_PYTHON" -c '
import importlib.metadata as metadata
import A_01_deepseek_mapping_method
import A_03_result_plotting_method
import A_04_prompt_effect_evaluation_method
import A_05_consistency_evaluation_method
import A_08_full_process_method
import M_01_unit_schema
import M_02_pandapower_base_model
import M_03_ieee33_model

packages = ("openai", "python-dotenv", "pydantic", "pandapower", "matplotlib", "numpy", "pandas")
print("Environment smoke test: OK")
for package in packages:
    print(f"  {package}=={metadata.version(package)}")
'

if [[ ! -f "$PROJECT_DIR/.env" ]]; then
    cp "$PROJECT_DIR/.env.example" "$PROJECT_DIR/.env"
    echo "Created .env from .env.example. Replace the placeholder DEEPSEEK_API_KEY before real API runs."
else
    echo "Existing .env preserved."
fi

echo "Setup complete. Use: $VENV_PYTHON C_01_main_controller.py --help"
