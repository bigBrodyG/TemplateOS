# TemplateOS CyberSecurity Codespace

Ambiente pronto all'uso per laboratori di cybersecurity e penetration testing basato su GitHub Codespaces.

## 🚀 Quick Start
1. Crea un nuovo repository e copia questa struttura.
2. Esegui `git add` / `git commit` dei file del template.
3. Apri **Code → Codespaces → Create codespace on main**.
4. Attendi la fine del workflow `.devcontainer/setup.sh` che prova l'installazione avanzata e, se fallisce, richiama il fallback (15‑20 minuti la prima volta).

## 📦 Contenuto del Template
- `.devcontainer/devcontainer.json` configura l'immagine base Ubuntu, le GitHub Features (Docker-in-Docker, Python 3.11, Java 23, Ruby, Node LTS, common-utils) e abilita `SYS_PTRACE` / `seccomp=unconfined`.
- `.devcontainer/setup.sh` esegue prima `.devcontainer/setup-advanced.sh` (logging avanzato, sezioni disattivabili tramite `SKIP_SECTIONS`) e, in caso d'errore, ripiega su `.devcontainer/setup-fallback.sh`.
- `SETUP-GUIDE.md` spiega deployment, prebuild, secrets e personalizzazioni avanzate.

## 🛠️ Tool Installati
- **Network**: tshark, Wireshark (CLI), nmap.
- **Reverse Engineering**: Ghidra, pwndbg, binwalk, ltrace, patchelf.
- **Password Cracking**: John The Ripper jumbo build.
- **Steganografia & Utility**: Stegsolve, GIMP, HT editor.
- **Dev Tooling**: Docker CLI (via feature DinD), Postman, ngrok, Python packages (`pwntools`, `ropper`, `pycryptodome`, `capstone`), Ruby gems (`one_gadget`, `seccomp-tools`).

## ⚙️ Personalizzazione
- Rimuovi o aggiungi tool modificando `.devcontainer/setup.sh`.
- Aggiungi estensioni VS Code aggiornando `customizations.vscode.extensions` nel devcontainer.
- `SKIP_SECTIONS="john ghidra" bash .devcontainer/setup-advanced.sh` per saltare installazioni pesanti.
- `bash .devcontainer/setup-fallback.sh` per forzare il vecchio flusso in caso di necessità.
- Modifica porte inoltrate (`forwardPorts`) per le tue applicazioni.
- Usa GitHub Codespaces **prebuilds** o un Dockerfile personalizzato per ridurre i tempi di bootstrap (vedi `SETUP-GUIDE.md`).

## ❗ Note Importanti
- Lo script è idempotente: controlla directory di destinazione prima di scaricare/clonare.
- Alcuni tool (es. Wireshark GUI, Ghidra) richiedono forwarding X11 o uso via CLI.
- L'esecuzione di `apt upgrade` può richiedere diversi minuti e occupare banda.
- Per velocizzare ulteriormente, commenta le sezioni dei tool che non ti servono.

## 🧪 Verifica Rapida
All'avvio del Codespace, controlla:
```bash
which python3
ghidraRun                # deve essere disponibile in $HOME/tools
~/.local/bin/pwntools-shell
```
Se uno strumento manca, rileggi i log di `.devcontainer/setup.sh` alla fine della build.

## 📚 Riferimenti
- Documentazione devcontainer: https://containers.dev/
- Guida GitHub Codespaces: https://docs.github.com/en/codespaces
