# Vending Machine FSM Design

## Problem Description

Design a finite state machine (FSM) for an automatic vending machine.

The vending machine sells two types of drinks:

- Drink A costs **5 yuan**
- Drink B costs **10 yuan**

The machine accepts the following coin denominations:

- 5 yuan
- 10 yuan

Only one type of drink can be purchased per transaction.

The design must support change return when the inserted amount exceeds the selected drink price.

## Assumptions

- The selection signal `sel` becomes valid before any coin is inserted.
- Once a transaction starts, the value of `sel` remains unchanged until the transaction completes.
- Only one coin may be inserted during a single clock cycle.
- `din = 3` will never occur.

## Interface Signals

### Inputs

| Signal | Width | Description |
|----------|----------|----------|
| `clk` | 1 | System clock |
| `rst_n` | 1 | Active-low reset |
| `sel` | 1 | Drink selection signal |
| `din` | 2 | Coin input |

### Drink Selection

| sel | Drink |
|------|--------|
| 0 | Drink A (5 yuan) |
| 1 | Drink B (10 yuan) |

### Coin Input Encoding

| din | Meaning |
|------|----------|
| 0 | No coin inserted |
| 1 | 5-yuan coin |
| 2 | 10-yuan coin |
| 3 | Invalid (will never occur) |

## Outputs

### Drink Output

`drinks_out` indicates the drink dispensed by the vending machine.

| drinks_out | Meaning |
|------------|----------|
| 0 | No drink dispensed |
| 1 | Dispense Drink A |
| 2 | Dispense Drink B |
| 3 | Invalid (will never occur) |

The output remains valid for **one clock cycle only**.

### Change Output

`change_out` indicates whether a 5-yuan change should be returned.

| change_out | Meaning |
|------------|----------|
| 0 | No change |
| 1 | Return 5 yuan change |

The output remains valid for **one clock cycle only**.

## Functional Requirements

1. The machine shall dispense Drink A when the inserted amount reaches or exceeds 5 yuan.
2. The machine shall dispense Drink B when the inserted amount reaches or exceeds 10 yuan.
3. If the inserted amount exceeds the selected drink price by 5 yuan, the machine shall return a 5-yuan change.
4. The machine shall support multiple coin insertions for a single purchase.
5. After dispensing a drink (and any required change), the machine shall return to its initial state and begin a new transaction.