#!/usr/bin/env python
#
# Include file for offlineimap.
#

import subprocess, os;

# TODO: Workaround since for some reason GPG_AGENT_INFO isn't included in the
# environment variables.
with open(os.path.expanduser('~/.gpg-agent-info')) as f:
    for line in f:
        if 'GPG_AGENT_INFO' in line:
            os.environ['GPG_AGENT_INFO'] = line.split('=')[1].strip()
            break

os.environ['GPG_AGENT_INFO']
