# Macaulay2 (M2)-codespace
Codespace setup for Macaulay2 (M2)

## Checking if Codespace Was Set Up Properly

1. **Reload the VS Code window** to apply all settings:
   - Press `Cmd+Shift+P` (Mac) or `Ctrl+Shift+P` (Windows/Linux)
   - Search for and select: `Reload Window`

   Or run this in the Command Palette:


2. **Fix Macaulay2 executable path errors**:
If you see an error like “Cannot find Macaulay2 executable”, it's likely caused by conflicting user settings.

👉 To fix this, **turn off Settings Sync** in VS Code:

- Open the Command Palette (`Cmd/Ctrl + Shift + P`)
- Search for:  
  ```
  > Settings Sync: Turn Off
  ```

- Confirm when prompted.

3. **Check the Codespace creation log** to confirm Macaulay2 was installed and the extension settings were applied correctly:
- Open the Command Palette (`Cmd/Ctrl + Shift + P`)
- Search for and select: `Codespaces: View Creation Log`
- Look for confirmation messages like:
  ```
  ✅ Macaulay2 installed successfully!
  ```
  and
  ```
  macaulay2.executablePath set to /usr/bin/M2
  ```
4. **If the creation log does not show the executable path** 
- run the manual check script:
```bash
bash .devcontainer/check_m2_path.sh

✅ Following all three steps ensures that only the settings configured in this repository are applied and Macaulay2 is ready to use inside your Codespace.
