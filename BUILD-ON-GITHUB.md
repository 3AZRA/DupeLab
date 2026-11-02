# Build Duplication Lab on GitHub (no local Java/Gradle setup)

This repository includes a GitHub Actions workflow. GitHub's hosted runner installs Java 25 and Gradle 9.4.0, builds the mod, and publishes the JAR as a downloadable workflow artifact.

## One-time setup

1. Sign in to GitHub and create a **new public or private repository** named `DuplicationLab`. Do not initialize it with a README, license, or `.gitignore`.
2. Extract this ZIP on your PC.
3. Open the extracted `DuplicationLab-0.1.0` folder. In File Explorer, enable **View > Show > Hidden items** so you can see the `.github` folder.
4. On the empty GitHub repository page, choose **Add file > Upload files**.
5. Drag the *contents* of the extracted folder into the upload area, including the `.github` folder and its `workflows/build.yml` file. Do not upload only the ZIP itself.
6. Commit the upload to the `main` branch.

## Download the JAR

1. Open the repository's **Actions** tab.
2. Select the **Build Fabric mod** workflow and open its newest run.
3. Wait for the run to finish. A green check means the build succeeded.
4. Under **Artifacts** at the bottom of the run page, download `DuplicationLab-0.1.0`.
5. Extract the downloaded artifact ZIP. It contains `duplab-0.1.0.jar`.
6. Put that JAR in the `mods` folder of the Minecraft 26.1.2 Fabric instance. Fabric API must also be installed in that instance.

If the workflow fails, open the failed run and copy the first actual error from the **Build mod** step. A failed run will not publish a JAR.

## What this build is

Duplication Lab is a client-side inventory snapshot and comparison utility. It does not generate items or guarantee a duplication exploit. A client-only mod cannot arbitrarily change server-authoritative inventory state on a correctly validating vanilla server.
