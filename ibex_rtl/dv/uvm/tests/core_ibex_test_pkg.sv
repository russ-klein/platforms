// Copyright 2018 lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0

// ---------------------------------------------
// Core ibex test package
// ---------------------------------------------
package core_ibex_test_pkg;

  import uvm_pkg::*;
  import core_ibex_env_pkg::*;
  import ibex_mem_intf_agent_pkg::*;

  `include "core_ibex_vseq.sv"
  `include "core_ibex_base_test.sv"

endpackage
