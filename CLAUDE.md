# Sample — An Inform 7 Practice Game

A local-only Inform 7 project for practicing rooms, objects, and interactions via CLI workflow.

## Project Structure

```
C:\code\i7\sample\
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

- **Inform 7 hub**: `C:\code\i7\inform7\CLAUDE.md` — syntax guides, compiler docs, testing framework
- **Syntax reference**: `C:\code\i7\inform7\reference\syntax-guide.md`
- **Text formatting**: `C:\code\i7\inform7\reference\text-formatting.md`
- **Testing framework**: `C:\code\i7\inform7\tools\testing\` — generic scripts driven by `project.conf`
- **RegTest runner**: `C:\code\i7\inform7\tools\regtest.py`
- **Web player setup**: `C:\code\i7\inform7\tools\web\` — Parchment libraries, template, setup script

## Building

CLI compilation (no `.inform` IDE bundle needed):

```bash
# Step 1: Compile I7 → I6
"/c/Program Files/Inform7IDE/Compilers/inform7.exe" \
    -internal "/c/Program Files/Inform7IDE/Internal" \
    -source story.ni \
    -o story.i6 \
    -silence

# Step 2: Compile I6 → Glulx
"/c/Program Files/Inform7IDE/Compilers/inform6.exe" -w -G \
    story.i6 \
    sample.ulx

# Step 3: Clean up intermediate file
rm story.i6

# Step 4: Update web player binary
B64=$(base64 -w 0 sample.ulx) && echo "processBase64Zcode('${B64}')" > web/lib/parchment/sample.ulx.js
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

All test scripts run via WSL and delegate to the shared framework at `C:\code\i7\inform7\tools\testing\`.

```bash
# Run walkthrough
wsl -e bash tests/run-walkthrough.sh

# Run regression tests
wsl -e bash tests/run-tests.sh

# Find golden seeds
wsl -e bash tests/find-seeds.sh
```

## Game Overview

- **Max score**: 10 points
- **Rooms**: Entrance Hall, Library, Study, Kitchen, Garden, Pond
- **Scoring**: Open journal (2) + take coin (2) + push stones / find ring (3) + take locket (3)

## Key Rules

- This is a **local-only** project — no git, no GitHub, no SDLC workflow
- `story.ni` is the single source of truth
- Do NOT create `.inform/` IDE bundles
- For Inform 7 syntax and conventions, see `C:\code\i7\inform7\CLAUDE.md`
