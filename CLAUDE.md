# Sample — An Inform 7 Practice Game

A local-only Inform 7 project for practicing rooms, objects, and interactions via CLI workflow.

## Project Structure

```
C:\code\ifhub\projects\sample\
├── CLAUDE.md              ← You are here
├── story.ni               ← Source of truth (Inform 7 source)
├── sample.ulx             ← Compiled Glulx binary (build output)
├── web/
│   ├── play.html          ← Browser-playable game (Parchment player)
│   └── lib/parchment/     ← Parchment JS libraries + sample.ulx.js (base64 binary)
└── tests/
    ├── project.conf       ← Project-specific test configuration
    ├── run-tests.sh       ← RegTest runner (wrapper)
    ├── run-walkthrough.sh ← Walkthrough runner (wrapper)
    ├── find-seeds.sh      ← Seed discovery (wrapper)
    ├── seeds.conf         ← Golden seeds for deterministic testing
    ├── sample.regtest     ← RegTest regression test suite
    └── inform7/
        ├── walkthrough.txt        ← Walkthrough commands
        └── walkthrough_output.txt ← Generated transcript
```

## Shared Resources

- **Inform 7 hub**: `C:\code\ifhub\CLAUDE.md` — syntax guides, compiler docs, testing framework
- **Syntax reference**: `C:\code\ifhub\reference\syntax-guide.md`
- **Text formatting**: `C:\code\ifhub\reference\text-formatting.md`
- **Testing framework**: `C:\code\ifhub\tools\testing\` — generic scripts driven by `project.conf`
- **Native interpreters**: `C:\code\ifhub\tools\interpreters\` — `glulxe.exe`, `dfrotz.exe` (build with `build.sh` in MSYS2)
- **RegTest runner**: `C:\code\ifhub\tools\regtest.py`
- **Web player setup**: `C:\code\ifhub\tools\web\` — Parchment libraries, template, setup script
- **Pipeline**: `C:\code\ifhub\tools\pipeline.sh` — compile → test → deploy orchestrator

## Building

```bash
# Compile + update web player (recommended)
bash /c/code/ifhub/tools/compile.sh sample

# Or via pipeline (compile + test + deploy to hub)
bash /c/code/ifhub/tools/pipeline.sh sample compile test deploy
```

## Web Player

Open `web/play.html` in a browser to play. Uses Parchment (JS Glulx interpreter).

To serve locally (avoids file:// CORS issues):
```bash
python -m http.server 8000 --directory web
# Then open http://localhost:8000/play.html
```

After recompiling, always re-run the base64 step (Step 4) to update the web binary.

## Testing

Test scripts delegate to the shared framework at `C:\code\ifhub\tools\testing\`. Platform detection in `project.conf` auto-selects native `glulxe.exe` (Git Bash) or WSL `glulxe` (Linux).

```bash
# Run walkthrough (native — no WSL needed if interpreters are built)
bash tests/run-walkthrough.sh

# Run regression tests
bash tests/run-tests.sh

# Find golden seeds
bash tests/find-seeds.sh

# Or via pipeline
bash /c/code/ifhub/tools/pipeline.sh sample compile test
```

## Game Overview

- **Max score**: 10 points
- **Rooms**: Entrance Hall, Library, Study, Kitchen, Garden, Pond
- **Scoring**: Open journal (2) + take coin (2) + push stones / find ring (3) + take locket (3)

## Key Rules

- This is a **local-only** project — no git, no GitHub, no SDLC workflow
- `story.ni` is the single source of truth
- Do NOT create `.inform/` IDE bundles
- For Inform 7 syntax and conventions, see `C:\code\ifhub\CLAUDE.md`
