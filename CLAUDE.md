# Sample — An Inform 7 Practice Game

An Inform 7 project for practicing rooms, objects, and interactions. Published to GitHub Pages at `johnesco.github.io/sample/`.

## Project Structure

```
C:\code\ifhub\projects\sample\
├── CLAUDE.md              ← You are here
├── story.ni               ← Source of truth (Inform 7 source)
├── sample.ulx             ← Compiled Glulx binary (build output)
├── index.html             ← Landing page
├── play.html              ← Browser-playable game (Parchment player)
├── source.html            ← Source browser
├── walkthrough.html       ← Walkthrough viewer
├── lib/parchment/         ← Parchment JS libraries + sample.ulx.js (base64 binary)
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

## GitHub Repository

- **Repo**: `Johnesco/sample`
- **GitHub Pages**: `johnesco.github.io/sample/`
- **IF Hub**: Served in-place — the hub iframes pages directly from GitHub Pages

## Shared Resources

- **Inform 7 hub**: `C:\code\ifhub\CLAUDE.md` — syntax guides, compiler docs, testing framework
- **Syntax reference**: `C:\code\ifhub\reference\syntax-guide.md`
- **Text formatting**: `C:\code\ifhub\reference\text-formatting.md`
- **Testing framework**: `C:\code\ifhub\tools\testing\` — generic scripts driven by `project.conf`
- **Native interpreters**: `C:\code\ifhub\tools\interpreters\` — `glulxe.exe`, `dfrotz.exe` (build with `build.sh` in MSYS2)
- **RegTest runner**: `C:\code\ifhub\tools\regtest.py`
- **Web player setup**: `C:\code\ifhub\tools\web\` — Parchment libraries, template, setup script
- **Pipeline**: `C:\code\ifhub\tools\pipeline.sh` — compile → test → push orchestrator

## Building

```bash
# Compile + update web player (recommended)
bash /c/code/ifhub/tools/compile.sh sample

# Or via pipeline (compile + test)
bash /c/code/ifhub/tools/pipeline.sh sample compile test
```

## Web Player

Open `play.html` in a browser to play. Uses Parchment (JS Glulx interpreter).

To serve locally (avoids file:// CORS issues):
```bash
python /c/code/ifhub/tools/dev-server.py
# Then open http://127.0.0.1:8000/sample/play.html
```

After recompiling, the compile script automatically updates the web binary.

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

- `story.ni` is the single source of truth
- Do NOT create `.inform/` IDE bundles
- For Inform 7 syntax and conventions, see `C:\code\ifhub\CLAUDE.md`
