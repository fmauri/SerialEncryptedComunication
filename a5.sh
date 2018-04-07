#!/bin/bash

ghdl -r --ieee=synopsys a5_v1_tb --stop-time=10000ns > output.txt
