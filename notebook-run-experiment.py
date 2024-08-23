# %%
import os

# Get the user ID
user_id = os.getuid()

# Set the XDG_RUNTIME_DIR environment variable
os.environ['XDG_RUNTIME_DIR'] = f'/run/user/{user_id}'

# Set the PRAAT_CMD environment variable
os.environ['PRAAT_CMD'] =f'/usr/bin/praat'

# Verify the environment variable
print(os.environ['XDG_RUNTIME_DIR'])

# %%

%run -i initExperimentVowels.py

# %%
%run -i runExperimentVowels.py
# %%
