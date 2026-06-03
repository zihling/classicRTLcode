# N-Bit Carry Lookahead Adder (CLA)

## Motivation

Ripple Carry Adder (RCA) computes carries sequentially:

```text
C0 → C1 → C2 → ... → Cn
```

CLA reduces carry propagation delay by computing carries in parallel.

## CLA Equations

### Bit-Level Signals

Generate: $$G_i = A_i \cdot B_i$$

Propagate: $$P_i = A_i \oplus B_i$$

Some definitions use AND: $$P_i = A_i + B_i$$

### Carry Computation

$$C_{i+1} = G_i + P_i \cdot C_i$$

By recursively applying the carry equation, we can express carries in terms of G and P and the initial carry C0:

$$C_1 = G_0 + P_0 \cdot C_0$$

$$C_2 = G_1 + P_1 \cdot C_1 = G_1 + P_1 \cdot (G_0 + P_0 \cdot C_0)$$

...and so on.

### Sum Computation

$$S_i = A_i \oplus B_i \oplus C_i$$

### Group Signals

Group Propagate: $$P_{m} = P_0 \cdot P_1 \cdot ... \cdot P_{n-1}$$

Group Generate: $$G_{m} = G_{n-1} + P_{n-1} \cdot G_{n-2} + ... + P_{n-1} \cdot P_{n-2} \cdot ... \cdot P_1 \cdot G_0$$

### Block Carry Equation

Group Carry: $$C_{m} = G_{m} + P_{m} \cdot C_0$$

## Interview Takeaways

* CLA accelerates addition by computing carries in parallel.
* G indicates carry generation.
* P indicates carry propagation.
* Pm/Gm summarize carry behavior of an entire CLA block.
* Pm/Gm are primarily used for hierarchical CLA construction.
* CLA is more complex than RCA but significantly faster for large bit-widths.
