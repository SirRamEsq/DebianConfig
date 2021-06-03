#!/bin/sh
# See here: https://github.com/LedgerHQ/ledger-live-desktop/issues/2718
sudo sysctl -w kernel.unprivileged_userns_clone=1
