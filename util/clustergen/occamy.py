# Copyright 2020 ETH Zurich and University of Bologna.
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0

from .cluster import Generator, PMA, PMACfg, SnitchCluster


class Occamy(Generator):
    """
    Generate an Occamy system.
    """
    def __init__(self, cfg):
        super().__init__("occamy.schema.json")
        # Validate the schema.
        self.validate(cfg)
        # from here we know that we have a valid object.
        # and construct a new SnitchClusterTB object.
        self.cfg = cfg
        pma_cfg = PMACfg()
        # TODO(zarubaf): Check dram start address is aligned to its length.
        # For this example system make the entire dram cacheable.
        pma_cfg.add_region(PMA.CACHED, 0, 0)

        # Store Snitch cluster config in separate variable
        self.cluster = SnitchCluster(cfg["cluster"], pma_cfg)
        self.cluster.cfg['tie_ports'] = False

        if "const_cache" in self.cfg["s1_quadrant"]:
            const_cache = self.cfg["s1_quadrant"]["const_cache"]
            self.cluster.add_mem(const_cache["count"],
                                 const_cache["width"],
                                 desc="const cache data",
                                 byte_enable=False,
                                 speed_optimized=True,
                                 density_optimized=True)
            self.cluster.add_mem(const_cache["count"],
                                 self.cluster.tag_width,
                                 desc="const_cache tag",
                                 byte_enable=False,
                                 speed_optimized=True,
                                 density_optimized=True)

    def render_wrapper(self):
        return self.cluster.render_wrapper()