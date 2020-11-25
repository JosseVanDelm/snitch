#!/bin/bash
# Copyright 2020 ETH Zurich and University of Bologna.
# Solderpad Hardware License, Version 0.51, see LICENSE for details.
# SPDX-License-Identifier: SHL-0.51

set -e
ROOT=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)

# Skip third party sources.
find hw/ \
    -not \( -path '*.bender' -prune \) \
    -not \( -path 'hw/vendor' -prune \) \
    -name "*.sv" \
    | xargs verible-verilog-lint \
    --rules=-interface-name-style --lint_fatal --parse_fatal
