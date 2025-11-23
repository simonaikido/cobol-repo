# Vulnerable COBOL Test Repo

**Purpose:** This repository contains intentionally vulnerable COBOL source files and configuration to be used for security testing and evaluation (for example, to test Aikido Security or other static analysis / SAST tools).

**Disclaimer:** Do not use these files in production or expose them to the internet. They are intentionally insecure.

## Contents
- `vulnerable.cob` - Example program with hardcoded credentials, weak hashing, and unsafe system calls.
- `db_access.cob` - Example with embedded SQL constructed from user input (SQL injection).
- `utils.cob` - Helper routines showing insecure temp file handling and unchecked return values.
- `secrets.env` - Example environment file with secrets.
- `build.sh` - Simple build / run helper (insecure).
- `.github/workflows/scan.yml` - Example GitHub Actions workflow (placeholder) to run a scanner (not functional).
- `sample_input.txt` - Sample input file used by programs.

## How to use
1. Inspect the files locally.
2. Upload to a private repository for testing.
3. Run your security scanner against the repository.

**WARNING:** These files are intentionally insecure.
