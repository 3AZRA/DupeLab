# Duplication Lab 0.1.0

A client-side Fabric research utility for Minecraft Java 26.1.2. It records inventory snapshots and compares item counts and component signatures. It does **not** create items, alter packets, bypass server validation, or modify server state.

## Requirements

- Minecraft Java Edition 26.1.2
- Fabric Loader 0.19.3 or newer compatible with 26.1.2
- Fabric API 0.155.3+26.1.2
- JDK 25 (the Gradle runtime and Java toolchain)
- Gradle 9.4.0
- Visual Studio Code with the Extension Pack for Java (recommended)

Minecraft 26.1 uses Mojang's unobfuscated names. This project uses the new `net.fabricmc.fabric-loom` plugin ID and Java 25.

## Build on Windows

1. Install JDK 25 and Gradle 9.4.0.
2. Open this folder in VS Code.
3. Open Terminal > New Terminal in the project root.
4. Confirm `java -version` reports 25 and `gradle --version` reports Gradle 9.4.0.
5. Run:

   ```powershell
   gradle build
   ```

6. The mod JAR will be in `build/libs/duplab-0.1.0.jar`.
7. Copy that JAR into your Minecraft instance's `mods` folder. Fabric API must also be installed.

If your launcher uses a separate game directory, use that instance's `mods` folder, not necessarily `%AppData%\\.minecraft\\mods`.

## Controls

| Key | Action |
|---|---|
| F8 | Save an inventory snapshot |
| F9 | Save a new snapshot and compare it with the previous snapshot |
| F10 | Add a timestamped experiment marker |

The keys can be changed under Options > Controls > Key Binds > Duplication Lab.

## Output files

Files are saved under the Minecraft config directory:

`config/duplab/snapshots/`

- `snapshot-*.tsv`: inventory slots, item registry IDs, counts, and encoded component signatures.
- `comparison-*.txt`: differences between the two newest snapshots.
- `experiment-markers.txt`: timestamped markers.

The comparison aggregates counts by item ID and component signature rather than slot, so moving an item between slots should not appear as a count change. Component signatures are diagnostic text representations, not a cryptographic or server-authoritative proof of item identity.

## Important testing notes

A client-side snapshot only describes what the client currently displays. A difference is not proof of duplication. For a meaningful persistence test:

1. Capture a baseline with F8.
2. Perform one permitted test action.
3. Capture and compare with F9.
4. Disconnect and reconnect to the same server.
5. Capture again with F9 and inspect the generated report.

Only a server-confirmed inventory state that persists after reconnect can establish that an item count genuinely changed. The mod intentionally does not automate exploit attempts or send inventory-manipulation packets.

## Project structure

```text
DuplicationLab/
├── build.gradle
├── gradle.properties
├── settings.gradle
├── README.md
└── src/
    ├── client/java/com/aziz/duplab/DuplicationLabClient.java
    └── main/resources/
        ├── fabric.mod.json
        └── assets/duplab/lang/en_us.json
```
