# Carry Look-Ahead Adder (CLA)

## Introduction

A **Carry Look-Ahead Adder (CLA)** is a type of adder used in digital logic that improves the speed of addition by reducing the amount of time required to determine carry bits. Unlike the ripple carry adder, which waits for the carry to propagate through each bit, the CLA uses a more efficient method to calculate carries.

## How Carry Look-Ahead Adder Works

### Basic Concept

The CLA adder speeds up the addition process by calculating the carry signals in advance, based on the input values. It uses the concepts of **generate** and **propagate**:

- **Generate (G)**: A bit pair generates a carry if both bits are 1.
- **Propagate (P)**: A bit pair propagates a carry if at least one bit is 1.

## Generate and Propagate Formulas

For a given pair of bits (a_i) and (b_i):

- **Generate**: `G_i = a_i & b_i`
- **Propagate**: `P_i = a_i ^ b_i`

## Carry Calculation

The carry-out of each bit is calculated using the generate and propagate signals:

- `C_0 = C_in`
- `C_1 = G_0 | (P_0 & C_0)`
- `C_2 = G_1 | (P_1 & G_0) | (P_1 & P_0 & C_0)`
- `C_3 = G_2 | (P_2 & G_1) | (P_2 & P_1 & G_0) | (P_2 & P_1 & P_0 & C_0)`

## Sum Calculation

The sum bits are calculated using the propagate signals and the carry-in:

- `S_i = P_i ^ C_i`


### Diagram of a 4-bit Carry Look-Ahead Adder

Below is a block diagram of a 4-bit CLA adder:

![carry-lookahead-adder-4-bit](https://github.com/DinethPrabashana/CLA_ADDER_implementation/assets/143341376/b538d28f-4eb8-4544-91ad-c4e2e5691e56)
ple.com/path/to/cla-diagram.png)

## Verilog Implementation
click on the below link to more informative verilog code 
1. [CLA_ADDER](CLA_ADDER_Implementation/CLA_ADDER.v)
